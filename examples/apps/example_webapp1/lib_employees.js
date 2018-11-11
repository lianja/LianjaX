////////////////////////////////////////////////////////////////
// Event delegate for 'click' event
function Employees_catalogview_click(data)
{
	Lianja.showDialogPanel("EMPLOYEE INFORMATION", "lib:/showdialogpanel_employee.rsp?employeeid="+data, 500);
};


////////////////////////////////////////////////////////////////
// Event delegate for 'dblclick' event
function Employees_catalogview_dblclick(data)
{
	Lianja.showDialogPanel("EMPLOYEE INFORMATION", "lib:/showdialogpanel_employee.rsp?employeeid="+data, 500);
};


