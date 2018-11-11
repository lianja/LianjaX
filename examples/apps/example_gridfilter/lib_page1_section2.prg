////////////////////////////////////////////////////////////////
// Event delegate for 'click' event
proc page1_section2_field1_click()
	Lianja.get("section1").grid.filter = "startsWith(customerid, 'B')"
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'click' event
proc page1_section2_field2_click()
	Lianja.get("section1").grid.filter = "startsWith(customerid, 'A')"
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'click' event
proc page1_section2_field3_click()
	Lianja.get("section1").grid.filter = ""
endproc
