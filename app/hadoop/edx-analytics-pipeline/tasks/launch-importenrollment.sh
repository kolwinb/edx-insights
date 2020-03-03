#!/bin/bash
source setup.sh

launch-task ImportEnrollmentsIntoMysql \
--interval $(date +%Y-%m-%d -d "$from_date")-$(date +%Y-%m-%d -d "$to_date") \
--n-reduce-tasks $num_reduce_tasks \
--overwrite-n-days 1 \
--remote-log-level 1
