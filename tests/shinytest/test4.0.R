app <- ShinyDriver$new("../../")
app$snapshotInit("test4.0")

app$setInputs(sidebarItemExpanded = "Lab")
app$setInputs(dimmenu = "process")
app$snapshot()
