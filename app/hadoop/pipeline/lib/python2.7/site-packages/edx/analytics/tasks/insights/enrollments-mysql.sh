#CourseMetaSummaryEnrollmentDataTask \ not working
list=("EnrollmentByGenderDataTask" "EnrollmentByGenderMysqlTask")
PYTHONPATH='.' luigi --module enrollments \
EnrollmentByGenderMysqlTask \
--interval-start '2014-06-01' \
--remote-log-level 1 \
--source '["hdfs://localhost:9000/data/"]' \
--pattern '[".*tracking.log.*"]' \
--warehouse-path 'hdfs://localhost:9000/edx-analytics-pipeline/warehouse/' \
--interval '2015-01-01-2019-05-18' \
--overwrite-n-days 2 \
--n-reduce-task "20" \
--mapreduce-engine "hadoop" \
--database "reports" \
--credentials "/edx/etc/edx-analytics-pipeline/output.json" \
#--worker-keep-alive \
