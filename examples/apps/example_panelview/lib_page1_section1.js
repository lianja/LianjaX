////////////////////////////////////////////////////////////////
// Event delegate for 'customsectionmenu' event
function page1_section1_customsectionmenu(menuitem)
{
	console.log(menuitem);
	if (menuitem === "panel1")
	{
		Lianja.showDocument("page:page1.section1?action=select&text=1");
	}
	else if (menuitem === "panel2")
	{
		Lianja.showDocument("page:page1.section1?action=select&text=2");
	}
	else if (menuitem === "panel3")
	{
		Lianja.showDocument("page:page1.section1?action=select&text=3");
	}
};
