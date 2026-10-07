#!/bin/sh
mkdir -p /root/skiptest
echo "$(date '+%H:%M:%S') CLEANUP task_a/file_one" >> /root/skiptest/skip.log
