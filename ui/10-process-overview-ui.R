tabItem("process",
        tags$head(tags$style(
          HTML('.content-wrapper, .right-side {
                                  background-color: white;
                                }')
        )),
        mainPanel(width = 12,
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
                  fluidRow(tabsetPanel(
                    tabPanel("Process metadata",
                             div(style = 'padding:2em;',
                                 fluidRow(
                                   column(
                                     style = 'padding=2em;',
                                     width = 12,
                                     fluidRow(h3("Name: "),
                                              textOutput("overviewProcessName")),
                                     fluidRow(h4("Id: "),
                                              textOutput("overviewProcessId")),
                                     fluidRow(
                                       h4("Description: "),
                                       textOutput("overviewProcessDescription")
                                     ),
                                     fluidRow(
                                       h3("Characteristics: "),
                                       DT::DTOutput("overviewProcessCharacteristics")
                                     )
                                   )
                                 ))),
                    tabPanel("Data",
                             div(style = "padding:2em;",
                                 fluidRow(
                                   column(
                                     style = 'padding=2em;',
                                     width = 12,
                                     DT::DTOutput("overviewData")
                                   )
                                 )))
                  ))))
