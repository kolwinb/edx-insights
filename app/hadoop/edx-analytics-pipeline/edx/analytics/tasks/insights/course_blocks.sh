list=("CourseListApiDataTask" "PullCourseBlocksApiData" "CourseBlocksApiDataTask" "PullCourseListApiData")


function courseblockrecords()
{
#PYTHONPATH='.' luigi --module course_blocks CourseBlockRecords --mapreduce-engine hadoop --warehouse-path 'hdfs://localhost:9000/edx-analytics-pipeline/warehouse/'  --remote-log-level "DEBUG"  --output-root 'hdfs://localhost:9000/edx-analytics-pipeline/event-export/output/'
PYTHONPATH='/edx/app/hadoop/edx-analytics-pipeline' luigi --module edx.analytics.tasks.insights.course_blocks CourseListApiDataTask --mapreduce-engine hadoop --warehouse-path 'hdfs://localhost:9000/edx-analytics-pipeline/warehouse/'  --remote-log-level "DEBUG"  --output-root 'hdfs://localhost:9000/edx-analytics-pipeline/event-export/output/'
}

function pullcourseblocksapidata()
{
PYTHONPATH='.' luigi --module course_blocks PullCourseBlocksApiData --warehouse-path 'hdfs://localhost:9000/edx-analytics-pipeline/warehouse/' --input-root 'hdfs://localhost:9000/edx-analytics-pipeline/event-import/input/'  
}

function courselistapidatatask()
{
PYTHONPATH='.' luigi --module course_blocks CourseListApiDataTask --mapreduce-engine hadoop --warehouse-path 'hdfs://localhost:9000/edx-analytics-pipeline/warehouse/'  --remote-log-level "DEBUG"  --output-root 'hdfs://localhost:9000/edx-analytics-pipeline/event-export/output/'
}



function pullcourselistapidata()
{
PYTHONPATH='.' luigi --module course_blocks PullCourseListApiData --warehouse-path 'hdfs://localhost:9000/edx-analytics-pipeline/warehouse/' --api-root-url 'https://study.vhec.lk/api/v0/' 

}

#courseblockrecords
#pullcourseblocksapidata
courselistapidatatask
#pullcourselistapidata
