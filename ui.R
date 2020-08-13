## ui.R ##
library(shiny)

header <- dashboardHeader(
  title = "RISSQ"
)

sidebar <- dashboardSidebar(
  sidebarMenu(
    id = "dimmenu",
    menuItem("Home", tabName = "home", icon = icon("home"))
  )
)

body <- dashboardBody(
  tags$head(
    tags$link(
      rel = "shortcut icon",
      type = "image/png",
      href = "img/rissq.png"
    ),
    tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
    tags$link(rel = "stylesheet", href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700")
  ),
  tabItems(

    #Home tabs
    source("ui/01-home-ui.R", local = TRUE)$value
  )
)

dashboardPage(
  header,
  sidebar,
  body,
  skin = "blue"
)
