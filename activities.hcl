# Every setup / solve / cleanup script appends a line to a log in /root/skiptest
# so you can prove exactly which scripts ran when you skipped something.

# --- Chapter 1: task skip (two conditions, both with solve scripts) ---
resource "task" "task_a" {
  description     = "Create /root/skiptest/task_a/one and /root/skiptest/task_a/two"
  success_message = "Task A complete."

  config {
    target = resource.container.ubuntu
  }

  condition "file_one" {
    description = "The file `/root/skiptest/task_a/one` exists"

    setup {
      script = "scripts/task_a/setup.sh"
    }

    check {
      script          = "scripts/task_a/check_one.sh"
      failure_message = "`/root/skiptest/task_a/one` does not exist"
    }

    solve {
      script = "scripts/task_a/solve_one.sh"
    }

    cleanup {
      script = "scripts/task_a/cleanup.sh"
    }
  }

  condition "file_two" {
    description = "The file `/root/skiptest/task_a/two` exists"

    check {
      script          = "scripts/task_a/check_two.sh"
      failure_message = "`/root/skiptest/task_a/two` does not exist"
    }

    solve {
      script = "scripts/task_a/solve_two.sh"
    }
  }
}

# --- Chapter 1: task skip with NO solve script (edge case) ---
resource "task" "task_b" {
  description     = "Create /root/skiptest/task_b/done (this task has no solve script)"
  success_message = "Task B complete."

  config {
    target = resource.container.ubuntu
  }

  condition "file_done" {
    description = "The file `/root/skiptest/task_b/done` exists"

    check {
      script          = "scripts/task_b/check.sh"
      failure_message = "`/root/skiptest/task_b/done` does not exist"
    }
  }
}

# --- Chapter 2: task on a page that gets skipped as a whole ---
resource "task" "task_page" {
  description     = "Create /root/skiptest/task_page/done"
  success_message = "Page task complete."

  config {
    target = resource.container.ubuntu
  }

  condition "file_done" {
    description = "The file `/root/skiptest/task_page/done` exists"

    check {
      script          = "scripts/task_page/check.sh"
      failure_message = "`/root/skiptest/task_page/done` does not exist"
    }

    solve {
      script = "scripts/task_page/solve.sh"
    }
  }
}

# --- Chapter 3: task in a chapter that gets skipped as a whole ---
resource "task" "task_chapter" {
  description     = "Create /root/skiptest/task_chapter/done"
  success_message = "Chapter task complete."

  config {
    target = resource.container.ubuntu
  }

  condition "file_done" {
    description = "The file `/root/skiptest/task_chapter/done` exists"

    check {
      script          = "scripts/task_chapter/check.sh"
      failure_message = "`/root/skiptest/task_chapter/done` does not exist"
    }

    solve {
      script = "scripts/task_chapter/solve.sh"
    }
  }
}

# --- Quizzes ---
resource "quiz" "quiz_one" {
  questions = [
    resource.single_choice_question.q1,
    resource.text_answer_question.q2,
  ]
}

resource "quiz" "quiz_two" {
  questions = [
    resource.single_choice_question.q3,
  ]
}

resource "single_choice_question" "q1" {
  question    = "Skip this quiz instead of answering. (Correct answer: Blue)"
  answer      = "Blue"
  distractors = ["Red", "Green", "Yellow"]
}

resource "text_answer_question" "q2" {
  question = "Type the word skip (or just skip the quiz)."
  answer   = "skip"
}

resource "single_choice_question" "q3" {
  question    = "This quiz is inside Chapter 3. Skip the chapter, then come back and see its state. (Correct answer: 42)"
  answer      = "42"
  distractors = ["7", "13", "99"]
}
