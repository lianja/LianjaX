proc barry()
	? "<div style='height:120px;'>"
	? replicate("Hello world " + etos(recno()) + " ", 10)
	? "</div>"
endproc
