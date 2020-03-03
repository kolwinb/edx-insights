#!/bin/bash
source setup

InsertToMysqlLastCountryPerCourseTask --local-scheduler \
 --interval $(date +%Y-%m-%d -d "$from_date")-$(date +%Y-%m-%d -d "$to_date") \
 --course-country-output $INTERMEDIATE_OUTPUT_ROOT/$(date +%Y-%m-%d -d "$TO_DATE")/country_course \
 --n-reduce-tasks 1 \
 --overwrite
