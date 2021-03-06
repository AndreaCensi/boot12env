#!/usr/bin/env python
from bootstrapping_olympics import logger
from bootstrapping_olympics.programs.manager.experiments_utils import (
    experiment_explore_learn_main)
from bootstrapping_olympics.utils import wrap_script_entry_point
from os.path import dirname
import os

# robots = ['r_cam360', 'r_rf360', 'r_cam360s15', 'r_sf12', 'r_sf144r']
# robots = ['r_cam_A', 'r_rf_A', 'r_fs_A']
robots = ['r_cam_A', 'r_rf_A', 'r_fs_A',
            'r_rf_A_n1', 'r_rf_A_n2',
            'r_cam_A_n1', 'r_cam_A_n2']
agents = ['embed', 'BDSAgent_C1', 'EstStats']
explorer = 'expswitch_t1'

def go(args):
    # FIXME make this robust
    cwd = os.path.dirname(os.path.realpath(__file__))
    proj_root = dirname(dirname(cwd))
    
    # load vehicles config
    VehiclesConfig.load()
    VehiclesConfig.load(proj_root)

    experiment_explore_learn_main(proj_root,
                                  explorer, agents, robots, args)

def main():
    wrap_script_entry_point(go, logger)

if __name__ == '__main__': 
    main()

