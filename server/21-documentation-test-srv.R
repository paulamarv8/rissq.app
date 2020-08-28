# Downloadable csv of selected dataset ----
output$downloadTestMSA <- downloadHandler(

  filename = function(){
    paste0("data",".zip")
  },

  content = function(file) {

    fileZip <- switch(
      input$selectFiles,
      nested = 'data/nested.zip',
      crossed = 'data/crossed.zip',
      base = 'data/base.zip',
      template = 'data/template.zip'
    )

    fileZip = c(fileZip)

    zip(zipfile = file, files = fileZip)
  },
  contentType = "application/zip"
)
