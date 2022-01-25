app <- ShinyDriver$new("../../")
app$snapshotInit("test4.1")

app$setInputs(sidebarItemExpanded = "Lab")
app$setInputs(dimmenu = "process")
app$setInputs(tabSetOverview = "Data")
app$snapshot()
