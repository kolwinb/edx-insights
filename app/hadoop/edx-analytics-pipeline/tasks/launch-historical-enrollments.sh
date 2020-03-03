#!/bin/bash
source setup.sh

launch-task CourseEnrollmentEventsTask --local-scheduler \
  --interval $(date +%Y-%m-%d -d "$from_date")-$(date +%Y-%m-%d -d "$to_date") \
  --n-reduce-tasks 1 \
  --remote-log-level 1 \
