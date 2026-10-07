#!/bin/sh
mkdir -p /root/skiptest/task_page
touch /root/skiptest/task_page/done
echo "$(date '+%H:%M:%S') SOLVE   task_page/file_done (page skip)" >> /root/skiptest/skip.log
