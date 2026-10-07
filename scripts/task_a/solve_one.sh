#!/bin/sh
mkdir -p /root/skiptest/task_a
touch /root/skiptest/task_a/one
echo "$(date '+%H:%M:%S') SOLVE   task_a/file_one" >> /root/skiptest/skip.log
