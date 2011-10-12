#!/bin/bash
set -e
set -x

. config.sh

BO_TEST_CONFIG=${PROJ_ROOT} nosetests -w $BO_DIR $*


