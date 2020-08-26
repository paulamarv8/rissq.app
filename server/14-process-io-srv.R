output$ioData <- DT::renderDataTable({
  req(input$data)

  tryCatch(
    {
      df <- read.csv(input$data$datapath,
                     header = input$header,
                     sep = input$sep,
                     quote = input$quote)
    },
    error = function(e) {
      stop(safeError(e))
    }
  )



  if(input$disp == "head") {
    return(head(df))
  }
  else {
    return(df)
  }

})

output$ioMetadataProcess <- renderTable({
  req(input$metadata)

  # when reading semicolon separated files,
  # having a comma separator causes `read.csv` to error
  tryCatch(
    {
      dfProcess <- readxl::read_excel(input$metadata$datapath,
                                      sheet = "process")
    },
    error = function(e) {
      # return a safeError if a parsing error occurs
      stop(safeError(e))
    }
  )

  output$ioProcesTitle <- renderUI(HTML("<h3>Process</h3><hr>"))

  return(dfProcess)
})

output$ioMetadataCharacteristic <- renderTable({
  req(input$metadata)

  # when reading semicolon separated files,
  # having a comma separator causes `read.csv` to error
  tryCatch(
    {
      dfCharateristic <- readxl::read_excel(input$metadata$datapath,
                               sheet = "characteristic")
    },
    error = function(e) {
      # return a safeError if a parsing error occurs
      stop(safeError(e))
    }
  )

  output$ioCharacteristicTitle <- renderUI(HTML("<h3>Characteristic</h3><hr>"))

  return(dfCharateristic)
})

output$ioMetadataAnalysis <- renderTable({
  req(input$metadata)

  # when reading semicolon separated files,
  # having a comma separator causes `read.csv` to error
  tryCatch(
    {
      dfAnalysis <- readxl::read_excel(input$metadata$datapath,
                                      sheet = "analysis")
    },
    error = function(e) {
      # return a safeError if a parsing error occurs
      stop(safeError(e))
    }
  )

  output$ioAnalysisTitle <- renderUI(HTML("<h3>Analysis</h3><hr>"))

  return(dfAnalysis)
})
