////////////////////////////////////////////////////////////////
// Event delegate for 'customsectionmenu' event
function page1_section1_customsectionmenu(text)
{
	if (text === "Employees")
	{
		Lianja.showDocument("page:Employees");
	}
	else if (text === "Appointments")
	{
		Lianja.showDocument("page:Appointments");
	}
	else if (text === "Details")
	{
		Lianja.showDocument("page:Details");
	}
};
