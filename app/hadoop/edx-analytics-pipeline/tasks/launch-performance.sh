#remote-task AnswerDistributionWorkflow --host localhost --user edx --remote-name analyticstack --skip-setup --wait
launch-task AnswerDistributionWorkflow \
  --local-scheduler  \
  --remote-log-level 1 \
  --name "pt_1449177792" \
  --src ["hdfs://localhost:9000/data/"] \

#  --dest "hdfs://localhost:9000/tmp/pipeline-task-scheduler/AnswerDistributionWorkflow/1449177792/dest" \
#  --output-root "hdfs://localhost:9000/tmp/pipeline-task-scheduler/AnswerDistributionWorkflow/1449177792/course" \
#  --include ["/edx/var/log/tracking/*tracking.log*.gz"] \
#  --base-input-format "org.edx.hadoop.input.ManifestTextInputFormat"  \
#  --lib-jar ["hdfs://localhost:9000/edx-analytics-pipeline/site-packages/edx-analytics-hadoop-util.jar"] \
#  --n-reduce-tasks 1 \
#  --marker "hdfs://localhost:9000/tmp/pipeline-task-scheduler/AnswerDistributionWorkflow/1449177792/marker" \
#  --credentials "/edx/etc/edx-analytics-pipeline/output.json" 

#8  --override-config "./override.cfg" \

#  --skip-setup --wait 
