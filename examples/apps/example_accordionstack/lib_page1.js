////////////////////////////////////////////////////////////////
// Event delegate for 'ready' event
function page1_ready()
{
	//Lianja.showDocument("section:section2?action=Hide")
	//Lianja.showDocument("section:section3?action=Hide")
	//Lianja.showDocument("section:section4?action=Hide")
};

////////////////////////////////////////////////////////////////
function showSection(selitem)
{
	Lianja.writeLog("showSection() '"+selitem+"'");
	if (selitem == "Photo")
	{
		Lianja.showDocument("section:section1?action=select");
	}
	else if (selitem == "Details")
	{
		Lianja.showDocument("section:section2?action=select");
	}
	else if (selitem == "Notes")
	{
		Lianja.showDocument("section:section4?action=select");
	}
};

////////////////////////////////////////////////////////////////
// Event delegate for 'custommenu' event
function page1_section3_custommenu(selitem)
{
	showSection(selitem);
};

