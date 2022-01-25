app <- ShinyDriver$new("../../")
app$snapshotInit("test8.1")

app$setInputs(sidebarItemExpanded = "Lab")
app$setInputs(dimmenu = "process-io")
app$setInputs(tabSetIO = "Data")
app$snapshot()
