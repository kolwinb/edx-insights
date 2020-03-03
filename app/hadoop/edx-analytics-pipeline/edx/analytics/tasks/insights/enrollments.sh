#source setup.conf

#CourseMetaSummaryEnrollmentDataTask \ not working
list=("ImportEnrollmentsIntoMysql" "CourseEnrollmentEventsTask" "CourseEnrollmentTask" "CourseMetaSummaryEnrollmentTableTask" "CourseMetaSummaryEnrollmentPartitionTask" "CourseMetaSummaryEnrollmentDataTask" "CourseMetaSummaryEnrollmentIntoMysql" "DaysEnrolledForEvents" "ExternalCourseEnrollmentPartitionTask" "CourseEnrollmentSummaryTask" "CourseEnrollmentSummaryTableTask" "CourseEnrollmentSummaryPartitionTask" "EnrollmentByGenderHiveTableTask" "EnrollmentByGenderHiveTableTask" "EnrollmentByGenderHivePartitionTask" "EnrollmentByGenderDataTask" "EnrollmentByGenderMysqlTask" "EnrollmentByBirthYearTaskTableTask" "EnrollmentByBirthYearPartitionTask" "EnrollmentByBirthYearDataTask" "EnrollmentByBirthYearToMysqlTask" "EnrollmentByEducationLevelTableTask" "EnrollmentByEducationLevelPartitionTask" "EnrollmentByEducationLevelDataTask" "EnrollmentByEducationLevelMysqlTask" "EnrollmentByModeTableTask" "EnrollmentByModePartitionTask" "EnrollmentByModeDataTask" "EnrollmentByModeDataTask" "EnrollmentByModeTask" "EnrollmentDailyTableTask" "EnrollmentDailyPartitionTask" "EnrollmentDailyDataTask" "EnrollmentDailyMysqlTask" "CourseProgramMetadataTableTask" "CourseProgramMetadataPartitionTask" "CourseProgramMetadataDataTask" "CourseProgramMetadataInsertToMysqlTask" "CourseGradeByModeTableTask" "CourseGradeByModePartitionTask" "CourseGradeByModeDataTask" )

function enrollmentsintomysql()
{
PYTHONPATH='.' luigi --module enrollments $1 --interval-start '2019-04-01' --remote-log-level "DEBUG" --source '["hdfs://localhost:9000/data/"]' --pattern '[".*tracking.log.*"]' --warehouse-path 'hdfs://localhost:9000/edx-analytics-pipeline/warehouse' --interval '2019-04-01-2019-05-22' --overwrite-n-days 2  --mapreduce-engine "hadoop" --overwrite  --enable-course-catalog --api-root-url "https://study.vhec.lk/api/courses/v1/courses/" --n-reduce-task 25

#PYTHONPATH='/edx/app/hadoop/edx-analytics-pipeline' luigi --module edx.analytics.tasks.insights.enrollments $1 --interval-start '2019-04-01' --remote-log-level "DEBUG" --source '["hdfs://localhost:9000/data/"]' --pattern '[".*tracking.log.*"]' --warehouse-path 'hdfs://localhost:9000/edx-analytics-pipeline/warehouse' --interval '2019-04-01-2019-05-21' --overwrite-n-days 2 --n-reduce-task "20" --mapreduce-engine "hadoop" --overwrite  --enable-course-catalog 
#--expand-interval='0 w 2 d 0 h 0 m 0 s' \
}

function eventtask()
{
PYTHONPATH='.' luigi --module enrollments $1 --source '["hdfs://localhost:9000/data"]' --pattern '[".*tracking.log.*"]' --warehouse-path 'hdfs://localhost:9000/edx-analytics-pipeline/warehouse' --interval '2018-01-01-2019-05-18'  --n-reduce-task "20" --overwrite-n-days "2" --mapreduce-engine "hadoop" --remote-log-level "DEBUG" --output-root hdfs://localhost:9000/edx-analytics-pipeline/event-export-by-course/output/ 
#--expand-interval='0 w 2 d 0 h 0 m 0 s' 
}

function metasummaryintomysql()
{
PYTHONPATH='.' luigi --module enrollments $1 --source '["hdfs://localhost:9000/data"]' --pattern '[".*tracking.log.*"]' --warehouse-path 'hdfs://localhost:9000/edx-analytics-pipeline/warehouse' --interval '2018-01-01-2019-05-18'  --n-reduce-task "20" --overwrite-n-days "2" --mapreduce-engine "hadoop" --remote-log-level "DEBUG" --api-root-url "https://study.vhec.lk/api/courses/v1/courses/"
#--expand-interval='0 w 2 d 0 h 0 m 0 s' 
}


function pathselection()
{
PYTHONPATH='.' luigi --module enrollments $1 --source '["hdfs://localhost:9000/data"]' --pattern '[".*tracking.log.*"]' --warehouse-path 'hdfs://localhost:9000/edx-analytics-pipeline/warehouse' --interval '2018-01-01-2019-05-18'  --n-reduce-task "20" --overwrite-n-days "2" --mapreduce-engine "hadoop" --remote-log-level "DEBUG" --output-root hdfs://localhost:9000/edx-analytics-pipeline/event-export-by-course/output/
#--expand-interval='0 w 2 d 0 h 0 m 0 s' 
}

function datatask()
{
PYTHONPATH='.' luigi --module enrollments $1 --source '["hdfs://localhost:9000/data"]' --pattern '[".*tracking.log.*"]' --warehouse-path 'hdfs://localhost:9000/edx-analytics-pipeline/warehouse' --interval '2018-01-01-2019-05-18'  --n-reduce-task "20" --overwrite-n-days "2" --mapreduce-engine "hadoop" --api-root-url "https://study.vhec.lk/api/courses/v1/courses/"
#--expand-interval='0 w 2 d 0 h 0 m 0 s' 
}

enrollmentsintomysql ImportEnrollmentsIntoMysql
#eventtask CourseMetaSummaryEnrollmentDataTask
#metasummaryintomysql CourseMetaSummaryEnrollmentIntoMysql
#datatask CourseMetaSummaryEnrollmentDataTask

