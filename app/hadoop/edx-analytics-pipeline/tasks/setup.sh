#!/bin/bash

from_date=$(date +%Y-%m-%d -d 2014-01-01)
to_date=$(date +%Y-%m-%d)

tracking_log='/edx/var/log/insights/*tracking.log*'
luigi_output_stream_path='./luigi-output-stream/'
verbose_output="--verbose"
wait="--wait"
remote_user="hadoop"
host="localhost"
remote_name="analyticstack"
override_config="./override.cfg"
num_reduce_tasks=1


