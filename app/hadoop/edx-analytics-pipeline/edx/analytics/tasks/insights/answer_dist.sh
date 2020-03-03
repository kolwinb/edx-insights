#working but not update

PYTHONPATH='.' luigi --module answer_dist \
AnswerDistributionWorkflow \
--mapreduce-engine hadoop \
--remote-log-level 1 \
--database reports \
--credentials "/edx/etc/edx-analytics-pipeline/output.json" \
--name answer \
--src '["hdfs://localhost:9000/data"]' \
--dest "hdfs://localhost:9000/tmp/pipeline-task-scheduler/AnswerDistributionWorkflow" \
--overwrite \
--output-root 'hdfs://localhost:9000/edx-analytics-pipeline/event-export-by-course/output/' \
--marker "hdfs://localhost:9000/edx-analytics-pipeline/marker/" \
#AnswerDistributionPerCourseMixin \

#ProblemCheckEventMixin \
