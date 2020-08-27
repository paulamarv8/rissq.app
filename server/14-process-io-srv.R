output$ioData <- DT::renderDataTable({
  req(input$data)

  tryCatch(
    {
      sharedDataDF <<- read.csv(input$data$datapath,
                     header = input$header,
                     sep = input$sep,
                     quote = input$quote)
    },
    error = function(e) {
      stop(safeError(e))
    }
  )

  if(input$disp == "head") {
    return(head(sharedDataDF))
  }
  else {
    return(sharedDataDF)
  }

}, editable = TRUE)

proxy = dataTableProxy('ioData')

observeEvent(input$ioData_cell_edit, {
  info = input$ioData_cell_edit
  str(info)
  i = info$row
  j = info$col
  v = info$value
  sharedDataDF[i, j] <<- DT::coerceValue(v, sharedDataDF[i, j])
  replaceData(proxy, sharedDataDF, resetPaging = FALSE)  # important
})

output$ioMetadataProcess <- renderTable({
  req(input$metadata)

  # when reading semicolon separated files,
  # having a comma separator causes `read.csv` to error
  tryCatch(
    {
      sharedProcessDF <- readxl::read_excel(input$metadata$datapath,
                                      sheet = "process")

      sharedProcess <<- rissq.io::importProcess(input$metadata$datapath)
    },
    error = function(e) {
      # return a safeError if a parsing error occurs
      stop(safeError(e))
    }
  )

  output$ioProcesTitle <- renderUI(HTML("<h3>Process</h3><hr>"))

  return(sharedProcessDF)
})

output$ioMetadataCharacteristic <- renderTable({
  req(input$metadata)

  # when reading semicolon separated files,
  # having a comma separator causes `read.csv` to error
  tryCatch(
    {
      sharedCharacteristicDF <- readxl::read_excel(input$metadata$datapath,
                               sheet = "characteristic")

      sharedCharacteristic <<- rissq.io::importCharacteristic(input$metadata$datapath)

      sharedCharacteristicDFT <<- t(sharedCharacteristicDF[2])
      names(sharedCharacteristicDFT) <<- sharedCharacteristicDF[1]
    },
    error = function(e) {
      # return a safeError if a parsing error occurs
      stop(safeError(e))
    }
  )

  output$ioCharacteristicTitle <- renderUI(HTML("<h3>Characteristic</h3><hr>"))

  return(sharedCharacteristicDF)
})

output$ioMetadataAnalysis <- renderTable({
  req(input$metadata)

  # when reading semicolon separated files,
  # having a comma separator causes `read.csv` to error
  tryCatch(
    {
      sharedAnalysisDF <- readxl::read_excel(input$metadata$datapath,
                                      sheet = "analysis")
    },
    error = function(e) {
      # return a safeError if a parsing error occurs
      stop(safeError(e))
    }
  )

  output$ioAnalysisTitle <- renderUI(HTML("<h3>Analysis</h3><hr>"))

  return(sharedAnalysisDF)
})
