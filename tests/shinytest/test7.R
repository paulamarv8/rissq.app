app <- ShinyDriver$new("../../")
app$snapshotInit("test7")

app$setInputs(sidebarItemExpanded = "Lab")
app$setInputs(dimmenu = "process-as")
app$snapshot()
