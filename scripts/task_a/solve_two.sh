#!/bin/sh
mkdir -p /root/skiptest/task_a
touch /root/skiptest/task_a/two
echo "$(date '+%H:%M:%S') SOLVE   task_a/file_two" >> /root/skiptest/skip.log
