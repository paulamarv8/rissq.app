tabItem("process-io",
        tags$head(tags$style(
          HTML('.content-wrapper, .right-side {
                                  background-color: white;
                                }')
        )),
        mainPanel(width = 12,
                  fluidRow(column(
                    width = 12,
                    align = "left",
                    h1("Process input/output"),
                    p(
                      "Import and export data from externals files using the standarised templates."
                    )
                  )),
                  tabsetPanel(
                    tabPanel("Process metadata",
                             div(style = 'padding:2em;',
                                 fluidRow(
                                   column(
                                     style = 'padding=2em;',
                                     width = 12,
                                     sidebarLayout(sidebarPanel(
                                       fileInput('metadata', 'Choose file to upload',
                                                 accept = c('xlsx')),
                                       tags$hr(),
                                       p(
                                         "Please remember to follow the template specified in the documentation."
                                       )
                                     ),
                                     mainPanel(fluidRow(
                                       column(
                                         width = 4,
                                         uiOutput('ioProcesTitle'),
                                         tableOutput('ioMetadataProcess')
                                       ),
                                       column(
                                         width = 4,
                                         uiOutput('ioCharacteristicTitle'),
                                         tableOutput('ioMetadataCharacteristic')
                                       ),
                                       column(
                                         width = 4,
                                         uiOutput('ioAnalysisTitle'),
                                         tableOutput('ioMetadataAnalysis')
                                       ),
                                     )))
                                   )
                                 ))),
                    tabPanel("Data",
                             div(style = "padding:2em;",
                                 fluidRow(
                                   column(
                                     style = 'padding=2em;',
                                     width = 12,
                                     # Sidebar layout with input and output definitions ----
                                     sidebarLayout(
                                       # Sidebar panel for inputs ----
                                       sidebarPanel(
                                         # Input: Select a file ----
                                         fileInput(
                                           "data",
                                           "Choose CSV File",
                                           multiple = FALSE,
                                           accept = c("text/csv",
                                                      "text/comma-separated-values,text/plain",
                                                      ".csv")
                                         ),

                                         # Horizontal line ----
                                         tags$hr(),

                                         # Input: Checkbox if file has header ----
                                         checkboxInput("header", "Header", TRUE),

                                         # Input: Select separator ----
                                         radioButtons(
                                           "sep",
                                           "Separator",
                                           choices = c(
                                             Comma = ",",
                                             Semicolon = ";",
                                             Tab = "\t"
                                           ),
                                           selected = ","
                                         ),

                                         # Input: Select quotes ----
                                         radioButtons(
                                           "quote",
                                           "Quote",
                                           choices = c(
                                             None = "",
                                             "Double Quote" = '"',
                                             "Single Quote" = "'"
                                           ),
                                           selected = '"'
                                         ),

                                         # Horizontal line ----
                                         tags$hr(),

                                         # Input: Select number of rows to display ----
                                         radioButtons(
                                           "disp",
                                           "Display",
                                           choices = c(Head = "head",
                                                       All = "all"),
                                           selected = "head"
                                         )

                                       ),

                                       # Main panel for displaying outputs ----
                                       mainPanel(width = 8,
                                                 DT::dataTableOutput("ioData"))

                                     )
                                   )
                                 )))
                  )))
