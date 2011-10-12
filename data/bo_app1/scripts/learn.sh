#!/bin/bash
set -e
set -x
. config.sh

$manager learn-log -a embed -r d_SE2_dd_v2-cam360-test_dynamic
