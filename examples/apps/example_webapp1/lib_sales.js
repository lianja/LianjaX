////////////////////////////////////////////////////////////////
// Event delegate for 'activate' event
function Sales_activate()
{
	Lianja.writeLog("sales_activate() was called");
}


////////////////////////////////////////////////////////////////
// Event delegate for 'gestureswipeleft' event
function Sales_gestureswipeleft()
{
	console.log("page swipe left");
}


////////////////////////////////////////////////////////////////
// Event delegate for 'gestureswiperight' event
function Sales_gestureswiperight()
{
	console.log("page swipe right");
}


////////////////////////////////////////////////////////////////
// Event delegate for 'customsectionmenu' event
function Sales_section1_customsectionmenu(item)
{
	Lianja.writeLog("Clicked "+item);
}


////////////////////////////////////////////////////////////////
// Event delegate for 'dblclick' event
function Sales_section1_dblclick()
{
	Lianja.showDialogPanel("EMPLOYEE INFORMATION", "lib:/showdialogpanel_employee.rsp?employeeid={employees.employeeid}", 500);
}


////////////////////////////////////////////////////////////////
// Event delegate for 'customsectionmenu' event
function Sales_section2_customsectionmenu(item)
{
	if (item === 'Add')
	{
		Lianja.showDocument("page:sales?action=add");
	}
	else if (item === 'Delete')
	{
		Lianja.showDocument("page:sales?action=delete");
	}
	else if (item === 'Edit')
	{
		Lianja.showDocument("page:sales?action=edit");
	}
	else if (item === 'Save')
	{
		Lianja.showDocument("page:sales?action=save");
	}
	else if (item === 'Cancel')
	{
		Lianja.showDocument("page:sales?action=cancel");
	}
	else if (item === 'Map')
	{
		Lianja.showDialogPanel("CUSTOMER LOCATION", "lib:/showdialog_map.rsp?address={customers.address}+{customers.city}+{customers.country}", 500);
	}
	else if (item === 'Employee')
	{
		Lianja.showDialogPanel("EMPLOYEE INFORMATION", "lib:/showdialogpanel_employee.rsp?employeeid={employees.employeeid}", 500);
	}
	else if (item === "Print")
	{
		Lianja.print("app:/test.pdf");
	}
}


////////////////////////////////////////////////////////////////
// Event delegate for 'changed' event
function Sales_section2_field62_changed()
{
	var text = Lianja.getElementByID("sales.section2.field62").text;
	Lianja.writeOutput("Sales_section2_field62_changed() was called");
}


////////////////////////////////////////////////////////////////
// Event delegate for 'changed' event
function Sales_section2_field61_changed()
{
	Lianja.writeOutput("Sales_section2_field61_changed() was called");
}


////////////////////////////////////////////////////////////////
// Event delegate for 'datachanged' event
function Sales_section2_field62_datachanged()
{
	Lianja.writeOutput("Sales_section2_field62_datachanged() was called");
}


////////////////////////////////////////////////////////////////
// Event delegate for 'gestureswipeleft' event
function Sales_section2_gestureswipeleft()
{
	Lianja.writeOutput("Section swipeleft");
}


////////////////////////////////////////////////////////////////
// Event delegate for 'gestureswiperight' event
function Sales_section2_gestureswiperight()
{
	Lianja.writeOutput("Section swiperight");
}


////////////////////////////////////////////////////////////////
// Event delegate for 'linkclick' event
function Sales_section2_field59_linkclick(controlsource, text)
{
	messageBox("You clicked '" + text + "'");
}

////////////////////////////////////////////////////////////////
// Event delegate for 'linkclick' event
function Sales_section3_linkclick(controlsource, text)
{
	messageBox("You clicked '"+controlsource+"', text='"+text+"'");
}

////////////////////////////////////////////////////////////////
// Event callback from Query Picker
function myCallback(key, value)
{
	messageBox("You chose '"+value+"'");
}

////////////////////////////////////////////////////////////////
// Event delegate for 'dialogbutton' event
function Sales_section2_field58_dialogbutton()
{
	Lianja.showQueryPickerPanel("Browse Orders", "myCallback()", "southwind", "order_details", "showcolumns=true");
};


////////////////////////////////////////////////////////////////
// Event delegate for 'print' event
function Sales_print()
{
	Lianja.showMessage("You clicked the page print icon")
};


////////////////////////////////////////////////////////////////
// Event delegate for 'print' event
function Sales_section2_print()
{
	Lianja.showMessage("You clicked the section print icon")
};
