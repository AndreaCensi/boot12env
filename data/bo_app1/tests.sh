#!/bin/bash
set -e
set -x

#. config.sh
PROJ_ROOT=$PWD
BO_DIR=../../src/bootstrapping_olympics/src/bootstrapping_olympics
VEHICLES_TEST_CONFIG=${PROJ_ROOT}:default BO_TEST_CONFIG=${PROJ_ROOT}:default nosetests --with-id --with-color --with-progressive -w $BO_DIR $*


