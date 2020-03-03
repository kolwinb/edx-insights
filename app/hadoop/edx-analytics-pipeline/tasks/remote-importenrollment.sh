#!/bin/bash
source setup.sh

remote-task ImportEnrollmentsIntoMysql \
--interval $(date +%Y-%m-%d -d "2015-01-01")-$(date +%Y-%m-%d -d "2019-05-13") \
--n-reduce-tasks $num_reduce_tasks \
--log-path $luigi_output_stream_path \
$verbose_output \
$wait \
--user $remote_user \
--host $host \
--remote-name $remote_name \
--override-config $override_config \
--overwrite-n-days 1 \
#--source '["hdfs://localhost:9000/data/tracking.log"]' \
#--expand-interval '0 w 2 d 0 h 0 m 0 s' \

#--overwrite mysql \
#--overwrite hive
