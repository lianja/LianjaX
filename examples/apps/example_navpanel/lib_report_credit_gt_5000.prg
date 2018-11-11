////////////////////////////////////////////////////////////////
// Event delegate for 'footercustomgadget' event
proc report_credit_gt_5000_footercustomgadget()
	Lianja.console("Hello world")
	html = ""
	html += "<center>"
	html += ("This report was generated on " + tostring(date()) + " " + time())
	html += </center>"
return html

