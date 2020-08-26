tabItem("process",
        tags$head(tags$style(
          HTML('.content-wrapper, .right-side {
                                  background-color: white;
                                }')
        )),
        div(style = "background-color:white;",
            fluidRow(
              column(
                width = 12,
                align = "left",
                h1("Process overview"),
                p(
                  "Information resume and specification for the process/product to be controlled with RISSQ tools"
                ),
                uiOutput('overviewInfoMessage')
              )
            ),
            fluidRow(
              column(width = 8,
                     align = "left",
                     h2(uiOutput(
                       'overviewProcessTitle'
                     ))),
              column(width = 4,
                     align = "left",
                     tableOutput('overview'))
            )))
