# Skip Test Lab (Labs 2.0): ticket 4281

Checks this statement from the Labs 2.0 docs:
"In 2.0, skipping is always enabled at every level (task, quiz, page, and chapter). There is no `skipping_enabled` toggle. When a user skips a task, its solve scripts run automatically."

Every setup, solve and cleanup script appends a line to `/root/skiptest/skip.log` in the container, so the log shows exactly which scripts ran.

## Structure

| Chapter / page | What to skip | Expected result |
|---|---|---|
| 1.1 | Task A (2 conditions, each with a solve script) | 2 SOLVE lines and both files created |
| 1.1 | Task B (no solve script) | Edge case: is skip still offered, and is the task marked complete? |
| 1.2 | Quiz (2 questions) | Quiz skipped, user can continue |
| 2.1 | The whole **page** | Does the task's solve script run? (SOLVE ... page skip) |
| 3.x | The whole **chapter** (a task and a quiz inside it) | Does the solve script run? Is the quiz marked skipped? |
| 4.1 | Nothing | Read the log and screenshot it |

## Test checklist (fill in)

- [ ] No `skipping_enabled` or similar toggle in lab settings (UI or HCL)
- [ ] Task skip works
- [ ] Task skip runs the solve scripts (SOLVE lines in the log)
- [ ] Cleanup runs after the solve script (CLEANUP line)
- [ ] Task without a solve script: skip behaviour = ______
- [ ] Quiz skip works
- [ ] Page skip works, and the page's task solve script ran: yes / no
- [ ] Chapter skip works, and the chapter's task solve script ran: yes / no
- [ ] Anything that differs from the docs goes to #ask-product and the Notion bug log

## Deploy

1. Push this folder to a GitHub repo (the folder contents at the repo root).
2. Connect the repo to Instruqt. The platform syncs on every `git push`.
3. Start the lab and work through the pages in order.

Validated locally with `instruqt lab validate` (CLI 2427-422d0f4).
