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
