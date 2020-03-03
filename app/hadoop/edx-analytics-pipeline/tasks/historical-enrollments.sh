#!/bin/bash
source setup.sh

remote-task CourseEnrollmentEventsTask --local-scheduler \
  --host hadoop \
  --remote-name analyticstack \
  --host localhost \
  --interval $(date +%Y-%m-%d -d "$from_date")-$(date +%Y-%m-%d -d "$to_date") \
  --n-reduce-tasks 1 \
  --remote-log-level 1 \
