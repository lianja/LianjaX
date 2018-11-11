proc oc_getBackColor()
	if lower(title) = "sales representative"
		return "lightgreen"
	elseif lower(title) = "vice president, sales"
		return "lightpink"
	elseif lower(title) = "sales manager"
		return "lightblue"
	elseif lower(title) = "inside sales coordinator"
		return "beige"
	else
		return ""
	endif
endproc

proc oc_getForeColor()
	if lower(title) = "sales representative"
		return "gray"
	elseif lower(title) = "sales manager"
		return "black"
	else
		return ""
	endif
endproc	

