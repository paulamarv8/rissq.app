output$overview <- renderTable({

  # input$file1 will be NULL initially. After the user selects
  # and uploads a file, head of that data file by default,
  # or all rows if selected, will be shown.

  print("yeah")

  req(input$file1)
  req(input$file2)

  print("yeah2")

  # when reading semicolon separated files,
  # having a comma separator causes `read.csv` to error
  tryCatch(
    {
      df <- read.csv(input$file1$datapath,
                     header = input$header,
                     sep = input$sep,
                     quote = input$quote)

      metadataChar <- rissq.io::importCharacteristic(metapath = input$file2$datapath)
    },
    error = function(e) {
      # return a safeError if a parsing error occurs
      stop(safeError(e))
    }
  )

  output$overviewInfoMessage <- renderUI({return("")})
  output$overviewProcessTitle <- renderUI({return(metadataChar@name)})

  return(df)
})

output$overviewInfoMessage <- renderUI({
  return(HTML("
              <div style='margin-top:3em;margin-bottom:3em;margin-left:3em;color:#B02428;'>
                <i class='fa fa-exclamation-triangle'></i> Please load the metadata of the process and the datafiles on the I/O tab. Test files in documentation.
              </div>
              "))
  })
