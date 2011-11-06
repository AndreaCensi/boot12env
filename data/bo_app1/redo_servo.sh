#!/bin/bash
set -e
set -x
id_robot=r_fs_A
# id_robot=r_cam_A
# id_robot=r_rf_A

rm -rf logs/simulations/$id_robot/BDSAgent_C1*
boot_olympics_manager  -d . servo -a BDSAgent_C1 -r $id_robot --num_episodes=1 --max_episode_len=30
boot_olympics_manager  -d . video -a BDSAgent_C1_servo -r $id_robot -m boot_log2movie_servo -z 1