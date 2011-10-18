#!/bin/bash
set -e
set -x
# id_robot=r_rf360
# id_robot=r_cam360
id_robot=r_sf12
# id_robot=r_cam360s15

rm -rf logs/simulations/$id_robot/BDSAgent_C1*
boot_olympics_manager  -d . servo -a BDSAgent_C1 -r $id_robot --num_episodes=1 --max_episode_len=10
boot_olympics_manager  -d . video -a BDSAgent_C1_servo -r $id_robot -m boot_log2movie_servo -z 2