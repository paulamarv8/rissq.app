app <- ShinyDriver$new("../../")
app$snapshotInit("test9")

app$setInputs(sidebarItemExpanded = "Documentation")
app$setInputs(dimmenu = "documentation")
app$snapshot()
