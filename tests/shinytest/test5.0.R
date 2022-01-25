app <- ShinyDriver$new("../../")
app$snapshotInit("test5.0")

app$setInputs(sidebarItemExpanded = "Lab")
app$setInputs(dimmenu = "process-msa")
app$snapshot()
