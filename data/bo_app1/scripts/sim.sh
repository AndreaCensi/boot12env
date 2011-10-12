#!/bin/bash
set -e
set -x
. config.sh




# $manager list-robots
# read
# $manager list-agents
# read

$manager simulate -a expswitch_t1 -r r_cam180
$manager simulate -a expswitch_t1 -r r_rf360


# $manager list-logs
# read
