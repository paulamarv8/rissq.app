## ui.R ##
library(shiny)

header <- dashboardHeader(
  title = "RISSQ"
)

sidebar <- dashboardSidebar(
  sidebarMenu(
    id = "dimmenu",
    menuItem("Home", tabName = "home", icon = icon("home")),

    menuItem("Lab", tabName = "lab", icon = icon("money-bill-alt"),
             menuSubItem("Process Overview", tabName = "process", icon = icon("lightbulb")),
             menuSubItem("Measure System Analysis", tabName = "process-msa", icon = icon("compass")),
             menuSubItem("Statistical Process Control", tabName = "process-spc", icon = icon("play-circle")),
             menuSubItem("Aceptance Sampling", tabName = "process-as", icon = icon("compass")),
             menuSubItem("I/O", tabName = "process-io", icon = icon("compass"))
    ),

    menuItem("Documentation", tabName = "documentation", icon = icon("money-bill-alt"))
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
    source("ui/01-home-ui.R", local = TRUE)$value,

    source("ui/10-process-overview-ui.R", local = TRUE)$value,
    source("ui/11-process-msa-ui.R", local = TRUE)$value,
    source("ui/12-process-spc-ui.R", local = TRUE)$value,
    source("ui/13-process-as-ui.R", local = TRUE)$value,
    source("ui/14-process-io-ui.R", local = TRUE)$value,

    source("ui/20-documentation-ui.R", local = TRUE)$value
  )
)

dashboardPage(
  header,
  sidebar,
  body,
  skin = "blue"
)
