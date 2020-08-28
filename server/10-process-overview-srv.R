output$overviewData <- DT::renderDataTable({
  req(input$data)

  return(sharedDataDF)

}, editable = TRUE)

proxyOverviewData = dataTableProxy('overviewData')

observeEvent(input$overviewData_cell_edit, {
  info = input$overviewData_cell_edit

  if (info$value != "") {
    str(info)
    i = info$row
    j = info$col
    v = info$value
    sharedDataDF[i, j] <<- DT::coerceValue(v, sharedDataDF[i, j])
    replaceData(proxyOverviewData, sharedDataDF, resetPaging = FALSE)
    replaceData(proxy, sharedDataDF, resetPaging = FALSE)
  }

})

output$overviewProcessCharacteristics <- DT::renderDataTable({
  req(input$metadata)

  return(sharedCharacteristicDFT)

}, editable = TRUE)

proxyOverviewCharacteristic = dataTableProxy('overviewProcessCharacteristics')

observeEvent(input$overviewProcessCharacteristics_cell_edit, {
  info = input$overviewProcessCharacteristics_cell_edit

  if (info$value != "") {
    str(info)
    i = info$row
    j = info$col
    v = info$value
    sharedDataDF[i, j] <<- DT::coerceValue(v, sharedDataDF[i, j])
    replaceData(proxyOverviewCharacteristic, sharedCharacteristicDFT, resetPaging = FALSE)  # important
  }

})

output$overviewProcessName <- renderText({

  req(input$metadata)

  output$overviewInfoMessage <- renderUI({return("")})

  return(sharedProcess@name)
})

output$overviewProcessId <- renderText({

  req(input$metadata)

  output$overviewInfoMessage <- renderUI({return("")})

  return(sharedProcess@id)
})

output$overviewProcessDescription <- renderText({

  req(input$metadata)

  output$overviewInfoMessage <- renderUI({return("")})

  return(sharedProcess@description)
})

output$overviewInfoMessage <- renderUI({
  return(HTML("
              <div style='margin-top:3em;margin-bottom:3em;margin-left:3em;color:#B02428;'>
                <i class='fa fa-exclamation-triangle'></i> Please load the metadata of the process and the datafiles on the I/O tab. Test files in documentation.
              </div>
              "))
  })
