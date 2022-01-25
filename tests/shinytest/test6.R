app <- ShinyDriver$new("../../")
app$snapshotInit("test6")

app$setInputs(sidebarItemExpanded = "Lab")
app$setInputs(dimmenu = "process-spc")
app$snapshot()
