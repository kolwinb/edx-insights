list=("PullCourseListApiData" "CourseMetaSummaryEnrollmentDataTask" "CourseListApiDataTask")


function listapidata()
{
PYTHONPATH='.' luigi --module course_list PullCourseListApiData --warehouse-path "hdfs://localhost:9000/edx-analytics-pipeline/warehouse/" --api-root-url "https://study.vhec.lk/api/courses/v1/courses" 
}

function apidatatask()
{
PYTHONPATH='.' luigi --module course_list CourseListApiDataTask --warehouse-path "hdfs://localhost:9000/edx-analytics-pipeline/warehouse/" --mapreduce-engine "hadoop" --remote-log-level "DEBUG" --output-root "hdfs://localhost:9000/edx-analytics-pipeline/event-export/output"
}


apidatatask

#--additional-config "/edx/app/hadoop/edx-analytics-pipeline/tasks/override.cfg"
#--n-reduce-tasks 1 \
#--mapreduce-engine hadoop \
#--pattern tracking.log \
#--destination "hdfs://localhost:9000/edx-analytics-pipeline/warehouse/" \
#--credentials "/edx/etc/edx-analytics-pipeline/input.json" \
#--database "edxapp"
#--date-interval 2012-06
#--source 'hdfs://localhost:9000/data/'  \
#--local-scheduler \

