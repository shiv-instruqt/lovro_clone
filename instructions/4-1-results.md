# 4.1 Check the logs

Run:

```
cat /root/skiptest/skip.log
ls -R /root/skiptest
```

You should see:

| Line in skip.log | Proves |
|---|---|
| `SETUP task_a/file_one` | Setup ran when Task A became active |
| `SOLVE task_a/file_one` and `SOLVE task_a/file_two` | Task skip ran the solve scripts |
| `CLEANUP task_a/file_one` | Cleanup ran after the solve script |
| `SOLVE task_page/file_done (page skip)` | Page skip ran the solve scripts of tasks on that page |
| `SOLVE task_chapter/file_done (chapter skip)` | Chapter skip ran the solve scripts of tasks in that chapter |

Take a screenshot of this output for the ticket.
