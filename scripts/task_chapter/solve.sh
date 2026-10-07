#!/bin/sh
mkdir -p /root/skiptest/task_chapter
touch /root/skiptest/task_chapter/done
echo "$(date '+%H:%M:%S') SOLVE   task_chapter/file_done (chapter skip)" >> /root/skiptest/skip.log
