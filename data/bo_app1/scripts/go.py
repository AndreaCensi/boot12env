#!/usr/bin/env python

import os
from bootstrapping_olympics import logger
from bootstrapping_olympics.utils import wrap_script_entry_point
from bootstrapping_olympics.programs.manager.experiments_utils import experiment_explore_learn_main
#from compmake import comp 

robots = ['r_cam360', 'r_rf360']
agents = ['embed', 'BDSAgent_C1', 'EstStats']
explorer = 'expswitch_t1'

def go(args):
    proj_root = os.path.dirname(os.path.realpath(os.curdir))
    experiment_explore_learn_main(proj_root,
                                  explorer, agents, robots, args)



if __name__ == '__main__': 
    wrap_script_entry_point(go, logger)

