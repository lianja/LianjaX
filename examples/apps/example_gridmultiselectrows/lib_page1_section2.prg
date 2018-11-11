////////////////////////////////////////////////////////////////
// Event delegate for 'selectionchanged' event
proc page1_section2_selectionchanged(arg)
	// 'arg' is a comma separated list of items selected
	// It can be used directly with a ListBox to load the selected items
	Lianja.writeOutput("selectionChanged() arg="+arg)
endproc
