tabItem("process-msa",
        tags$head(tags$style(
          HTML('.content-wrapper, .right-side {
                                  background-color: white;
                                  min-height:120vh;
                                  heigth:auto;
                                }
               .content {
                  min-height:120vh;
                  heigth:auto;
               }')
        )),
        mainPanel(width = 12,
                  fluidRow(column(
                    width = 12,
                    align = "left",
                    h1("Process measure system analysis"),
                    p("Tools and method to perform an msa analysis")
                  )),
                  fluidRow(
                    column(
                      width = 12,
                      align = "left",
                      sidebarLayout(sidebarPanel(
                        h3("Name: "),
                        textOutput("msaName"),
                        hr(),

                        fluidRow(
                          column(
                            width = 1,
                            h4("Id:")
                          ),
                          column(
                            width = 11,
                            h4(uiOutput("msaId"))
                          )
                        ),

                        h4("Description: "),
                        textOutput("msaDescription"),
                        hr(),

                        textInput("inputTolerance", "Tolerance"),
                        verbatimTextOutput("msaTolerance"),

                        textInput("inputSigma", "Sigma"),
                        verbatimTextOutput("msaSigma"),

                        textInput("inputAlphaLim", "AlphaLim"),
                        verbatimTextOutput("msaAlphaLim"),

                        textInput("inputDigits", "Digits"),
                        verbatimTextOutput("msaDigits"),

                        textInput("inputMethod", "Method"),
                        verbatimTextOutput("msaMethod"),

                        actionButton("runMSA", "Run analysis")
                      ),
                      mainPanel(
                        fluidRow(
                          column(
                            width = 12,
                            verbatimTextOutput("showRAR")
                          )
                        ),
                        fluidRow(
                          column(
                            width = 12,
                            plotOutput("plotRAR")
                          )
                        )
                      ))
                    )
                  )))
