from bootstrapping_olympics.interfaces import StreamSpec
from contracts import contract
from geometry import SE3, se3, SO2
from vehicles_dynamics import CircleVel, Dynamics, SE2Dynamics
import numpy as np
from contracts.interface import describe_value
from geometry.poses import SE3_from_SE2
from geometry.poses_embedding import SE2_from_SO2

class Turret(Dynamics):
    
    @contract(max_linear_velocity='seq[2](>=0)',
              max_angular_velocity='>=0',)
    def __init__(self, max_linear_velocity, max_angular_velocity,
                       max_turret_velocity):
        self.body = SE2Dynamics(max_linear_velocity=max_linear_velocity,
                                max_angular_velocity=max_angular_velocity)
        self.turret = CircleVel(max_velocity=max_turret_velocity)
        
        cmd1 = StreamSpec.from_yaml(self.body.get_commands_spec())
        cmd2 = StreamSpec.from_yaml(self.turret.get_commands_spec())
        
        cmd_spec = StreamSpec.join(cmd1, cmd2).to_yaml()
        
        pose_space = self.body.get_pose_space()
        shape_space = self.turret.get_pose_space()
        
        Dynamics.__init__(self, commands_spec=cmd_spec, pose_space=pose_space,
                          shape_space=shape_space)

    @contract(pose='SE3')
    def pose2state(self, pose):
        ''' Returns the state that best approximates the given pose (in SE3).'''
        # random_angle = SO2.convert_to(SE3, SO2.sample_uniform()) # XXX
        random_angle = SE3_from_SE2(SE2_from_SO2(SO2.sample_uniform())) 
        return (self.body.pose2state(pose),
                self.turret.pose2state(random_angle))
    
    @contract(commands='array[4]')
    def _integrate(self, state, commands, dt):
        cmd1 = commands[:3]
        cmd2 = np.array([commands[3]])
        state1, state2 = state
        #print('got state:\n%s' % self.print_state(state))
        state1b = self.body.integrate(state1, cmd1, dt)
        state2b = self.turret.integrate(state2, cmd2, dt)
        stateb = state1b, state2b
        #print('new state:\n%s' % self.print_state(stateb))
        return stateb
        
#    def print_state(self, state):
#        state1, state2 = state
#        s = ' body: %s ' % (describe_value(state1))
#        s += '\n turr: %s ' % (describe_value(state2))
#        return s
    
    def state_to_yaml(self, state):
        ''' Converts the state to a YAML representation.'''
        state1, state2 = state
        s = {}
        s['body'] = self.body.state_to_yaml(state1)
        s['turret'] = self.turret.state_to_yaml(state2)
        return s
    
    @contract(returns='tuple(SE3, se3)')
    def joint_state(self, state, joint=0):
        state1, state2 = state
        conf = self.body.joint_state(state1, 0)
        body_pose, body_vel = conf
        if joint == 0:
            #print('here: %s' % describe_value(conf))
            return body_pose, body_vel
        elif joint == 1:
            # FIXME: velocity not computed
            q, _ = self.turret.joint_state(state2)
            j = SE3.multiply(body_pose, q)
            
            jvel = se3.zero() #@UndefinedVariable
            conf2 = j, jvel
            #print('there: %s' % describe_value(conf2))
            return conf2 
        else:
            raise ValueError('No such joint %d.' % joint)
            
            
