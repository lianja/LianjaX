////////////////////////////////////////////////////////////////
// Event delegate for 'dialogbutton' event
proc Customers_section1_field17_dialogbutton()
	m_recno = recno()
	m_select = select()
	select customers
	browse caption "Customers" noedit ;
		fields companyname:h="Company Name" size 400,400 title "Select a Customer"
	if _result != 0
		Lianja.getElementByID("Customers.section1").goto(_result)
	endif
	goto m_recno
	select m_select
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'customsearch' event
proc Customers_section1_customsearch()
	m_recno = recno()
	m_select = select()
	select customers
	browse caption "Customers" noedit ;
		fields companyname:h="Company Name" size 400,400 title "Select a Customer"
	select m_select
	if _result != 0
		Lianja.getElementByID("Customers.section1").goto(_result)
		return
	endif
	goto m_recno
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'changed' event
proc Customers_section1_field17_changed() 
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'custommenu' event
proc Customers_section1_custommenu(cAction)
	public m_customers_filter = cAction
	if cAction = "First"
		Lianja.showDocument("section:section1?action=first")
	elseif cAction = "Previous"
		Lianja.showDocument("section:section1?action=previous")
	elseif cAction = "Next"
		Lianja.showDocument("section:section1?action=next")
	elseif cAction = "Last"
		Lianja.showDocument("section:section1?action=last")
	elseif cAction = "High Credit Customers"
		Lianja.showDocument("page:report_credit_gt_5000")
	elseif cAction = "Over Credit Limit"
		Lianja.showDocument("page:report_make_customers")	
	elseif cAction = "Customer List"
		Lianja.showDocument("page:Client_Credit_Manager_all")		
	elseif cAction = "Help"
		Lianja.showHelp("About this App", "", "about")
	elseif cAction = "Customers"
		lianja.showDialogPanel("Customer List", "customerlist")		
	elseif cAction = "All"
		m_customers_filter = ''
		Lianja.getElementById("section1").filter = ''
	else
		Lianja.getElementById("section1").filter = 'startsWith(contacttitle, "&cAction")'
	endif
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'load' event
proc Customers_section1_load()
	//Lianja.getElementById("section1").filter = ''
	public m_customers_filter
	m_customers_filter = "All"
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'init' event
proc Customers_section1_init()
	public m_customers_filter
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'changed' event
proc Customers_section1_field18_changed()
	Lianja.console("data changed")
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'changed' event
proc Customers_section1_field15_changed()
	// insert your code here
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'activate' event
proc Customers_section1_activate()
	Lianja.console("Customers_section1_activate()")
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'deactivate' event
proc Customers_section1_deactivate()
	Lianja.console("Customers_section1_deactivate()")
endproc
