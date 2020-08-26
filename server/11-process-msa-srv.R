output$rarPlot <- renderPlot({

  # input$file1 will be NULL initially. After the user selects
  # and uploads a file, head of that data file by default,
  # or all rows if selected, will be shown.
  req(input$file1)
  req(input$file2)

  # when reading semicolon separated files,
  # having a comma separator causes `read.csv` to error
  tryCatch(
    {
      analisis <- rissq.io::importMSAnalysis(metadatapath = input$file2$datapath, data = input$file1$datapat)
    },
    error = function(e) {
      # return a safeError if a parsing error occurs
      stop(safeError(e))
    }
  )

  output$rarPlot <- renderPlot(rissq.msa::plotRar(analisis))

  return(df)
})
