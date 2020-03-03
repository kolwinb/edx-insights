
launch-task CourseMetaSummaryEnrollmentIntoMysql \
--input-format None \
--warehouse-path hdfs://localhost:9000/edx-analytics-pipeline/warehouse/ \
--lib-jar [] \
--remote-log-level INFO \
--credentials /edx/etc/edx-analytics-pipeline/output.json \
--api-page-size 100 \
--date-pattern %Y%m%d \
--insert-chunk-size 100 \
--source '["hdfs://localhost:9000/data/"]' \
--pattern '["*tracking.log*"]' \
--overwrite-n-days 1 \
--mapreduce-engine hadoop \
--api-root-url None \
--n-reduce-tasks 1 \
--date 2019-05-15 \
--interval-end 2019-05-15 \
--database reports \
--interval 2014-01-01-2019-05-15 \
--interval-start 2013-11-01 \
--partner-api-urls [] \
--additional-config '/edx/app/hadoop/edx-analytics-pipeline/tasks/local.cfg'
#--partner-short_codes [] \
#--expand-interval 0 w 2 d 0 h 0 m 0 s \
#--overwrite-mysql False \
#--overwrite-hive False \
#--use-temp-table-for-overwrite False \
#--enable-course-catalog False \
