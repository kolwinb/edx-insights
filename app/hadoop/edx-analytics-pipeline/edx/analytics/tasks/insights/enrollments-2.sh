#CourseMetaSummaryEnrollmentDataTask \ not working
list=("CourseProgramMetadataDataTask" "CourseMetaSummaryEnrollmentTableTask") 

PYTHONPATH='.' luigi --module enrollments \
CourseMetaSummaryEnrollmentTableTask \
--mapreduce-engine hadoop \
--remote-log-level 1 \
--source '["hdfs://localhost:9000/data/"]' \
--expand-interval '2 days' \
--pattern '["tracking.log"]' \
--warehouse-path 'hdfs://localhost:9000/edx-analytics-pipeline/warehouse/' \
--interval-start '2014-06-01' \

