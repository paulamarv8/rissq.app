output$msaName <- renderText({
  req(input$metadata)
  req(input$data)

  tryCatch({
    sharedMSA <<-
      rissq.io::importMSAnalysis(input$metadata$datapath, input$data$datapath)
  },
  error = function(e) {
    stop(safeError(e))
  })

  return(sharedMSA@name)
})

output$msaId <- renderUI({
  return(HTML("<h4>ID: </h4>"))
})

output$msaDescription <- renderText({
  req(input$metadata)
  req(input$data)

  return(sharedMSA@description)
})

output$msaTolerance <- renderText({
  sharedMSA@tolerance <- input$inputTolerance
  return(input$inputTolerance)
  })

output$msaSigma <- renderText({
  sharedMSA@sigma <- input$inputSigma
  return(input$inputSigma)
})

output$msaAlphaLim <- renderText({
  sharedMSA@alphaLim <- input$inputAlphaLim
  return(input$inputAlphaLim)
})

output$msaDigits <- renderText({
  sharedMSA@digits <- input$inputDigits
  return(input$inputDigits)
})

output$msaMethod <- renderText({
  sharedMSA@method <- input$inputMethod
  return(input$inputMethod)
})

output$msaTolerance <- renderText({
  req(input$metadata)
  req(input$data)

  return(sharedMSA@tolerance)
})

output$msaSigma <- renderText({
  req(input$metadata)
  req(input$data)

  return(sharedMSA@sigma)
})

output$msaAlphaLim <- renderText({
  req(input$metadata)
  req(input$data)

  return(sharedMSA@alphaLim)
})

output$msaDigits <- renderText({
  req(input$metadata)
  req(input$data)

  return(sharedMSA@digits)
})

output$msaMethod <- renderText({
  req(input$metadata)
  req(input$data)

  return(sharedAnalysisDF[[8,2]])
})

observe({
  req(input$metadata)
  req(input$data)

  id <- sharedAnalysisDF[[1,2]]
  tolerance <- sharedAnalysisDF[[4,2]]
  sigma <- sharedAnalysisDF[[5,2]]
  alphaLim <- sharedAnalysisDF[[6,2]]
  digits <- sharedAnalysisDF[[7,2]]
  method <- sharedAnalysisDF[[8,2]]

  # This will change the value of input$inText, based on x
  updateTextInput(session, "inputTolerance", value = tolerance)
  updateTextInput(session, "inputSigma", value = sigma)
  updateTextInput(session, "inputAlphaLim", value = alphaLim)
  updateTextInput(session, "inputDigits", value = digits)
  updateTextInput(session, "inputMethod", value = method)

  output$msaId <- renderUI({
    return(HTML(paste("<h4>ID: ",id, "</h4>")))
  })
})

observeEvent(input$runMSA, {
  sharedMSA@data@data <<- sharedDataDF
  sharedMSA <<- anovaMSA(sharedMSA)
  sharedMSA <<- rar(sharedMSA)

  output$summaryRAR <- renderPrint({
    summary(sharedMSA)
  })

  output$showRAR <- renderPrint({
    show(sharedMSA)
  })

  output$plotRAR <- renderPlot({
    return(rissq.msa::plotRar(sharedMSA))
  })
})


output$reportMSA <- downloadHandler(

  filename = function() {
    paste('reportMSA', sep = '.', switch(
      input$format,
      PDF = 'pdf',
      HTML = 'html'
    ))
  },

  content = function(file) {

    tempReport <- tempfile(fileext = ".Rmd")

    template <- switch(
      input$format,
      PDF = 'www/reports/pdfReportMSA.Rmd',
      HTML = 'www/reports/htmlReportMSA.Rmd'
    )

    file.copy(template, tempReport, overwrite = TRUE)

    # Set up parameters to pass to Rmd document
    params <- list(analysis = sharedMSA)

    rmarkdown::render(tempReport,
                      output_file = file,
                      params = params,
                      envir = new.env(parent = globalenv()))

  }

)
