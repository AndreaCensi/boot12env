#!/bin/bash
# set -e
set -x
root=`pwd`

cd $root/src/contracts && ./tests.sh 
cd $root/src/geometry && ./tests_fast.sh 
cd $root/src/reprep && ./tests.sh 
cd $root/src/vehicles_dynamics && nosetests 
cd $root/src/vehicles && ./tests_fast.sh 
cd $root/src/bootstrapping_olympics/ && ./tests.sh
cd $root/src/boot_agents/ && ./tests_local.sh
cd $root/src/boot_agents/ && ./tests_olympics.sh
cd $root/data/bo_app1 && ./tests.sh
cd $root/data/bo_hidden && ./tests.sh
