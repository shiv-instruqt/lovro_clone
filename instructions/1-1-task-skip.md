# 1.1 Skip a task

Every setup, solve and cleanup script in this lab writes a line to `/root/skiptest/skip.log`. Watch it in the terminal while you test:

```
tail -f /root/skiptest/skip.log
```

**Test A: skip a task that has solve scripts.** Do not create any files. Skip Task A.
Expected: two `SOLVE task_a/...` lines appear in the log, and both files exist.

<instruqt-task id="task_a"></instruqt-task>

**Test B: skip a task that has no solve script.** Skip Task B.
Note whether skip is offered, whether the task is marked complete, and that no SOLVE line appears.

<instruqt-task id="task_b"></instruqt-task>

After skipping, run `ls -R /root/skiptest` to confirm which files the solve scripts created.
