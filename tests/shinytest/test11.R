app <- ShinyDriver$new("../../")
app$snapshotInit("test11")

app$setInputs(sidebarItemExpanded = "Lab")
app$setInputs(dimmenu = "process-io")
app$uploadFile(metadata = "metadataBaseExample.xlsx")
app$snapshot()
