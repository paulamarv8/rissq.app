app <- ShinyDriver$new("../../")
app$snapshotInit("test10")

app$setInputs(sidebarItemExpanded = "Documentation")
app$setInputs(dimmenu = "documentation-test")
app$snapshot()
