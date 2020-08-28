tabItem("documentation",
        tags$head(tags$style(
          HTML('.content-wrapper, .right-side {
                                  background-color: white;
                                }')
        )),
        mainPanel(width = 12,
                  fluidRow(column(
                    width = 12,
                    align = "left",
                    h1("Documentation"),
                    p(
                      "Supporting documentation for the statistical methods implemented over the RISSQ and intructions for use"
                    )
                  ))))
