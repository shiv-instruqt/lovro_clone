resource "layout" "two_column" {
  column {
    width = 60

    tab "terminal" {
      target = resource.terminal.shell
    }
  }

  column {
    width = 40

    instructions {}
  }
}
