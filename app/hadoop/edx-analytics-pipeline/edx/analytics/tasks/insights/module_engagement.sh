list=("ModuleEngagementTableTask" "ModuleEngagementPartitionTask" "ModuleEngagementMysqlTask" " ModuleEngagementIntervalTask" "ModuleEngagementSummaryRecord" "ModuleEngagementSummaryRecordBuilder" "ModuleEngagementSummaryDataTask" "ModuleEngagementSummaryTableTask" "ModuleEngagementSummaryPartitionTask" "ModuleEngagementSummaryMetricRangeRecord" "ModuleEngagementSummaryMetricRangesDataTask" "ModuleEngagementSummaryMetricRangesTableTask" "ModuleEngagementSummaryMetricRangesPartitionTask" "ModuleEngagementSummaryMetricRangesMysqlTask" "ModuleEngagementUserSegmentRecord" "ModuleEngagementUserSegmentDataTask" "ModuleEngagementUserSegmentTableTask" "ModuleEngagementUserSegmentPartitionTask" "ModuleEngagementRosterRecord" "ModuleEngagementRosterTableTask" "ModuleEngagementRosterPartitionTask" "ModuleEngagementRosterIndexTask" "ModuleEngagementWorkflowTask" )



for f in ${list[@]}
do
echo $f
PYTHONPATH='.' luigi --module module_engagement $f --local-scheduler --warehouse 'hdfs://localhost:9000/edx-analytics-pipeline/warehouse/' --overwrite 
done
