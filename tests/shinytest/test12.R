app <- ShinyDriver$new("../../")
app$snapshotInit("test12")

app$setInputs(sidebarItemExpanded = "Lab")
app$setInputs(dimmenu = "process-io")
app$setInputs(tabSetIO = "Data")
app$uploadFile(data = "base.csv")
app$snapshot()
