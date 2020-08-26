tabItem(
  "process-msa",
  tags$head(tags$style(
    HTML('.content-wrapper, .right-side {
                                  background-color: white;
                                }')
  )),
  div(
    style="background-color:white;",
    fluidRow(
      column(
        width = 12,
        align="left",
        h1("Process measure system analysis"),
        p("Tools and method to perform an msa analysis")
      )
    ),
    fluidRow(
      column(
        width = 12,
        align="center",
        plotOutput('rarPlot')
      )
    )
  )
)
