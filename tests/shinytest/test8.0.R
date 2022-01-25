app <- ShinyDriver$new("../../")
app$snapshotInit("test8.0")

app$setInputs(sidebarItemExpanded = "Lab")
app$setInputs(dimmenu = "process-io")
app$snapshot()
