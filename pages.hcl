resource "page" "task_skip" {
  title = "Skip a task"
  file  = "instructions/1-1-task-skip.md"

  activities = {
    "task_a" = resource.task.task_a
    "task_b" = resource.task.task_b
  }
}

resource "page" "quiz_skip" {
  title = "Skip a quiz"
  file  = "instructions/1-2-quiz-skip.md"

  activities = {
    "quiz_one" = resource.quiz.quiz_one
  }
}

resource "page" "page_skip" {
  title = "Skip this whole page"
  file  = "instructions/2-1-page-skip.md"

  activities = {
    "task_page" = resource.task.task_page
  }
}

resource "page" "after_page_skip" {
  title = "After page skip"
  file  = "instructions/2-2-after-page-skip.md"
}

resource "page" "chapter_skip" {
  title = "Skip this whole chapter"
  file  = "instructions/3-1-chapter-skip.md"

  activities = {
    "task_chapter" = resource.task.task_chapter
  }
}

resource "page" "chapter_quiz" {
  title = "Quiz inside skipped chapter"
  file  = "instructions/3-2-chapter-quiz.md"

  activities = {
    "quiz_two" = resource.quiz.quiz_two
  }
}

resource "page" "results" {
  title = "Check the logs"
  file  = "instructions/4-1-results.md"
}
