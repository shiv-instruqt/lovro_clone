resource "lab" "skip_test" {
  title       = "Skip Test (Labs 2)"
  description = "Internal test lab to verify skipping at task, quiz, page and chapter level, and that solve scripts run on skip. Ref: ticket 4281."

  settings {
    timelimit {
      duration = "1h"
    }

    idle {
      enabled = true
      timeout = "15m"
    }
  }

  layout = resource.layout.two_column

  content {
    chapter "ch1_task_quiz" {
      title = "Chapter 1 - Task and quiz skip"

      page "p1_task" {
        title     = "1.1 Skip a task"
        reference = resource.page.task_skip
      }

      page "p2_quiz" {
        title     = "1.2 Skip a quiz"
        reference = resource.page.quiz_skip
      }
    }

    chapter "ch2_page" {
      title = "Chapter 2 - Page skip"

      page "p3_page_skip" {
        title     = "2.1 Skip this whole page"
        reference = resource.page.page_skip
      }

      page "p4_landing" {
        title     = "2.2 After page skip"
        reference = resource.page.after_page_skip
      }
    }

    chapter "ch3_chapter" {
      title = "Chapter 3 - Chapter skip"

      page "p5_chapter_skip" {
        title     = "3.1 Skip this whole chapter"
        reference = resource.page.chapter_skip
      }

      page "p6_chapter_quiz" {
        title     = "3.2 Quiz inside skipped chapter"
        reference = resource.page.chapter_quiz
      }
    }

    chapter "ch4_results" {
      title = "Chapter 4 - Results"

      page "p7_results" {
        title     = "4.1 Check the logs"
        reference = resource.page.results
      }
    }
  }
}
