////////////////////////////////////////////////////////////////
// Update the total as data is entered
proc updateTotal()
	m_itemcost = Lianja.getElementByID("ItemQuantity").value
	m_itemcount = Lianja.getElementByID("ItemCost").value
	m_subtotal = Lianja.getElementByID("ItemTotal")
	m_result = transform(val(m_itemcost) * val(m_itemcount), "$99,999,999.99")
	m_subtotal.value = str_replace("$.", "$0.", str_replace(" ", "", m_result))
endproc

////////////////////////////////////////////////////////////////
// Event delegate for 'load' event
proc page1_section2_load()
	public m_total_amount
	m_total_amount = 0
	updateTotal()
	m_totals = Lianja.getelementByID("CartTotal")
	if vartype(m_totals) != 'O'
		return
	endif
	m_totals_result = transform(m_total_amount, "$99,999,999.99")
	m_totals.value = str_replace("$.", "$0.", str_replace(" ", "", m_totals_result))
endproc

////////////////////////////////////////////////////////////////
// Event delegate for 'load' event
proc page1_section2_SupWebview_load()
	Lianja.getElementByID("SupWebview").url = "http://www.lianja.com"
endproc

////////////////////////////////////////////////////////////////
// Event delegate for 'interactivechange' event
proc page1_section2_SupList_interactivechange()
	m_details = Lianja.getElementByID("SupDetails")
	m_text = Lianja.getElementByID("SupList").value
	select customers
	set order to tag COMPANYNAME_SEARCH
	seek lower(trim(m_text))
	m_text = "<h1><font color='red'>" + m_text + "</font></h1>"
	m_text =  m_text + "<hr>" + customers.contactname + "<br>" ;
		  	+ customers.companyname + "<br>" ;
			+ customers.address + "<br>" ;
			+ customers.region + "<br>" ;
			+ customers.city + "<br>" ;
			+ customers.country + "<hr>" ;
			+ etos(customers.notes)
	m_details.value = m_text
	m_webview = Lianja.getElementByID("SupWebview")
	if startsWith(customers.companyname, "Que Delicia")
		m_webview.html = "Adult content censored!"	
	else
		m_webview.url = "https://www.google.com/search?q=" + customers.companyname
	endif
	m_webview.refresh()
	m_first = .f.
endproc

////////////////////////////////////////////////////////////////
// Event delegate for 'interactivechange' event
proc page1_section2_ItemQuantity_interactivechange()
	updateTotal()
endproc

////////////////////////////////////////////////////////////////
// Event delegate for 'interactivechange' event
proc page1_section2_ItemCost_interactivechange()
	updateTotal()
endproc

////////////////////////////////////////////////////////////////
// Event delegate for 'click' event
proc page1_section2_AddBtn_click()
	m_row = Lianja.getelementByID("SupList").activeRow
	if m_row = 0
		Lianja.showMessage("You must select a supplier first")
		return
	endif
	m_customer = Lianja.getElementByID("SupList").value
	m_total = Lianja.getElementByID("ItemTotal")
	if Lianja.getElementByID("ItemCost").value=="" or Lianja.getElementByID("ItemQuantity").value==""
		Lianja.showMessage("You must specify item cost and quantity")
		return
	endif
	m_totals = Lianja.getelementByID("CartTotal")
	m_item = m_customer + "|" + m_total.value
	m_itemcost = Lianja.getElementByID("ItemCost").value
	m_itemcount = Lianja.getElementByID("ItemQuantity").value
	m_total_amount = val(m_itemcost) * val(m_itemcount) + m_total_amount
	m_totals_amount = transform(m_total_amount, "$99,999,999.99")
	m_totals.caption = str_replace("$.", "$0.", str_replace(" ", "", m_totals_amount))
	m_totals_result = transform(m_total_amount, "$99,999,999.99")
	m_total.value = str_replace("$.", "$0.", str_replace(" ", "", m_totals_result))
	Lianja.getelementByID("Cart").addItems(m_item)
	Lianja.getElementByID("ItemCost").value = ""
	Lianja.getElementByID("ItemQuantity").value = ""
	updateTotal()
endproc

////////////////////////////////////////////////////////////////
// Event delegate for 'click' event
proc page1_section2_RemoveBtn_click()
	m_row = Lianja.getelementByID("Cart").activeRow
	if m_row = 0
		return
	endif
	m_gridrow = Lianja.getelementByID("Cart")
	m_value = m_gridrow.item(m_gridrow.activerow, 2)
	m_value = str_replace("$", "", m_value)
	m_value = str_replace(",", "", m_value)
	m_value = val(m_value)
	m_total_amount = m_total_amount - m_value
	m_totals_result = transform(m_total_amount, "$99,999,999.99")
	m_totals = Lianja.getelementByID("CartTotal")
	m_totals.value = str_replace("$.", "$0.", str_replace(" ", "", m_totals_result))
	Lianja.getelementByID("Cart").removeItem(m_row)
endproc

////////////////////////////////////////////////////////////////
// Event delegate for 'click' event
proc page1_section2_ResetBtn_click()
	Lianja.getelementByID("Cart").clear()
	Lianja.getElementByID("ItemCost").value = ""
	Lianja.getElementByID("ItemQuantity").value = ""
	m_total_amount = 0
	m_totals = Lianja.getelementByID("CartTotal")
	m_totals_result = transform(m_total_amount, "$99,999,999.99")
	m_totals.value = str_replace("$.", "$0.", str_replace(" ", "", m_totals_result))
	m_webview = Lianja.getElementByID("SupWebview")
	m_webview.url = "http://www.lianja.com"
	m_webview.refresh()
endproc

////////////////////////////////////////////////////////////////
// Event delegate for 'click' event
proc page1_section2_CheckoutBtn_click()
	Lianja.showMessage("The receipt has been printed")
endproc

////////////////////////////////////////////////////////////////
// Event delegate for 'click' event
proc page1_section2_ReportBtn_click()
	Lianja.showMessage("This is just an example of what you can do.<br>You can activate another page and display a report.")
endproc

////////////////////////////////////////////////////////////////
// Event delegate for 'activate' event
proc page1_section2_activate()
	// insert your code here
endproc
