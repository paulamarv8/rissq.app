app <- ShinyDriver$new("../../")
app$snapshotInit("test2")

app$setInputs(sidebarItemExpanded = "Lab")
app$snapshot()
