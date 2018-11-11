////////////////////////////////////////////////////////////////
// Event delegate for 'dialogbutton' event
// todo: this is a task
proc Customers_section1_field17_dialogbutton() 
	Lianja.showQueryPickerPanel()	
	MessageBox( "You selected '" + Lianja.getDialogResult() + "'")
	
//	m_select = select()
//	select customers
//	m_recno = recno() 
//	browse caption "Customers" noedit ;
//		fields companyname:h="Company Name" size 400,400 title "Select a Customer"
//	if _result != 0
//		Lianja.getElementByID("Customers.section1").goto(_result)
//	endif
//	goto m_recno
//	select m_select

//	myform = createObject("Form")
//	myform.resize(600, 500)
//	myform.addObject("mycont", "Container")
//	mycont.autosize = 1
//	mycont.layout = "V"
//	select * from customers into cursor mycust // This could be a parameterized multi-table join
//	mygrid = mycont.browse("browse noedit noactionbar", "mycust") // last 2 args are optional
//	// note that the grid object is returned from browse() so you can set properties and call methods on it
//	myform.showDropDown("customers.section1.field17", 400, 360)	
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'customsearch' event
proc Customers_section1_customsearch()
	m_select = select()
	select customers
	m_recno = recno()
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


////////////////////////////////////////////////////////////////
// Event delegate for 'linkclick' event
proc Customers_section1_field17_linkclick(controlsource, text)
	MessageBox("You clicked on '"+text+"'")
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'ready' event
proc Customers_section1_ready()
	// insert your code here
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'gotfocus' event
proc Customers_section1_field16_gotfocus()
	Lianja.writeOutput("Customers_section1_field16_gotfocus()")
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'hotkey' event
proc Customers_section1_hotkey(keyid)
	if keyid = "F9"
		Lianja.console("hotkey:"+keyid)
		return .t.
	else
		return .f.
	endif
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'interactivechange' event
proc Customers_section1_field18_interactivechange()
	// insert your code here
endproc
