app <- ShinyDriver$new("../../")
app$snapshotInit("test5.1")

app$setInputs(sidebarItemExpanded = "Lab")
app$setInputs(dimmenu = "process-msa")
app$setInputs(tabSetMSA = "Graph")
app$snapshot()
