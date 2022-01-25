app <- ShinyDriver$new("../../")
app$snapshotInit("test3")

app$setInputs(sidebarItemExpanded = "Documentation")
app$snapshot()
