#!/bin/bash
marker='hdfs://localhost:9000/edx-analytics-pipeline/marker/'
outputroot='hdfs://localhost:9000/edx-analytics-pipeline/problem-response-reports/output/'
function problemresponse()
{
PYTHONPATH='/edx/app/hadoop/pipeline/local/lib/python2.7/site-packages/edx/analytics/tasks/insights' luigi --module problem_response $1 --remote-log-level "DEBUG" --marker $marker --output-root $outputroot
}

function problemresponseworkflow()
{
PYTHONPATH='/edx/app/hadoop/edx-analytics-pipeline/edx/analytics/tasks' luigi --module insights.problem_response $1 --remote-log-level "DEBUG" --marker $marker --output-root $outputroot --overwrite
}


#problemresponse ProblemResponseReportTask
problemresponseworkflow ProblemResponseReportWorkflow
