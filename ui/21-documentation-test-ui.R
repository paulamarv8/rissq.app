tabItem("documentation-test",
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
                      h1("Test files"),
                      p(
                        "Test files, metadata and data for nested, crossed and base Measure System Analysis. Also templates to fil with your data."
                      ),
                      sidebarLayout(
                        sidebarPanel(
                          radioButtons(
                            "selectFiles",
                            label = h3("Select files to download"),
                            choices = list(
                              "Nested Analysis" = "nested",
                              "Crossed Analysis" = "crossed",
                              "Base Analysis" = "base",
                              "Empty template" = "template"
                            ),
                            selected = 1
                          ),
                          p("All files includes metadata and data."),

                          hr(),
                          downloadButton("downloadTestMSA", "Download files")
                        ),
                        mainPanel()
                      )

                    )
                  )))
