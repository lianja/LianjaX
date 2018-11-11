////////////////////////////////////////////////////////////////
// Event delegate for 'expanded' event
proc page1_Customers_expanded()
	Lianja.get("orders").show()
	Lianja.get("orderdetails").show()
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'collapsed' event
proc page1_Customers_collapsed()
	Lianja.get("orders").hide()
	Lianja.get("orderdetails").hide()
endproc
