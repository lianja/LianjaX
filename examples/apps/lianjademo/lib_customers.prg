////////////////////////////////////////////////////////////////
// Event delegate for 'customsearch' event
proc Customers_customsearch() 
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
// Event delegate for 'timer' event
proc Customers_timer()
	Lianja.showNotification("Hello " + user() + ", you have some new notifications.<hr>The timer has expired at ";
	 + time();
	 + '<br>Notice how you can format the notification messages using <b>HTML</b> tags<br>';
	 + "and separate them like this.";
	 + '<hr>Click <a href="page:customers.section1?action=search&text=Bon appette">here</a> to select the customer <b>Bon appette</b>.';
	 + '<hr>Click <a href="page:employees">here</a> to select the employees page.';
	 , .f., 3)
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'init' event
proc Customers_init()
	// insert your code here
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'custommenu' event
proc Customers_custommenu(action)
	MessageBox("You clicked the custom options menu '"+action+"'")
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'click' event
proc Customers_section2_click()
	//Lianja.console("Row was clicked")
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'dblclick' event
proc Customers_section2_dblclick()
	//Lianja.console("Row was double clicked")
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'ready' event
proc Customers_section3_ready()
	Lianja.console("section3::ready()")
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'load' event
proc Customers_section3_load()
	Lianja.console("section3::load()")
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'init' event
proc Customers_section3_init()
	Lianja.console("section3::init()")
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'parentdatachanged' event
proc Customers_section2_parentdatachanged()
	Lianja.console("section2::parentdatachanged()")
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'linkclick' event
proc Customers_section2_linkclick(controlsource, text)
	MessageBox("You clicked '" + text + "' with freight " + etos(currency(orders.freight)) + "'")
endproc

////////////////////////////////////////////////////////////////
// Custom grid cell
proc render_cell()
	private m_container
	private m_label
	m_container = createObject("container")
	m_container.backcolor = "lightgreen"
	m_label = createObject("label")
	m_container.addObject(m_label)
	m_label.text = "Record " + alltrim(str(recno()))
	m_label.top = 4
	m_label.left = 4
	m_label.width = 80
	return m_container
endproc

////////////////////////////////////////////////////////////////
// Event delegate for 'activate' event
proc Customers_activate()
	Lianja.console("customers::activate()")
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'deactivate' event
proc Customers_deactivate()
	Lianja.console("customers::deactivate()")
endproc

////////////////////////////////////////////////////////////////
// Event delegate for 'load' event
proc Customers_load()
	// insert your code here
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'visiblewhen' event
proc Customers_visiblewhen()
	// insert your code here
endproc

////////////////////////////////////////////////////////////////
// Event delegate for 'ready' event
proc Customers_ready()
	// insert your code here
endproc
 
////////////////////////////////////////////////////////////////
// Event delegate for 'unload' event
proc Customers_unload()
	// insert your code here
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'destroy' event
proc Customers_destroy()
	// insert your code here
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'hotkey' event
proc Customers_hotkey()
	// insert your code here
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'statechanged' event
proc Customers_statechanged(cState)
	// insert your code here
endproc
