////////////////////////////////////////////////////////////////
// Handlers for the Search Panel
function sp_search_handler()
{
	Lianja.showDocument("section:section1?action=search&text="+sp_textbox.text);
};

function sp_reset_handler()
{
	Lianja.showDocument("section:section1?action=search&text=");
	sp_textbox.text = "";
};


////////////////////////////////////////////////////////////////
// Event delegate for 'searchpanel' event
function Customers_section1_searchpanel()
{
	sp_container = createObject("container");
	sp_container.fixedheight = 30;
	sp_container.layout = "H";
	sp_container.spacing = 5;
	sp_container.addObject("sp_label", "label");
	sp_label.text = "Company Name";
	sp_label.alignment = "center";
	sp_container.addObject("osp_textbox", "textbox");
	sp_textbox = osp_textbox;
	sp_container.addObject("sp_search", "commandbutton");
	sp_search.text = "Search";
	sp_search.click = sp_search_handler;
	sp_container.addObject("sp_reset", "commandbutton");
	sp_reset.text = "Reset";
	sp_reset.click = sp_reset_handler ;
	Lianja.get("Customers.section1").addSearchPanel(sp_container);
};
 

////////////////////////////////////////////////////////////////
// Event delegate for 'customsectionmenu' event
function Customers_section1_customsectionmenu(cMenuitem)
{
	if (cMenuitem == "Contacts")
	{
		Lianja.showDialogPanel("Contact List", "customerlist.rsp", -500);	
	}
	else if (cMenuitem == "Reset")
	{
		Lianja.showDocument("section:section1?action=search&text=");
	}
	else if (cMenuitem == "First")
	{
		Lianja.showDocument("page:Customers?action=first");
	}
	else if (cMenuitem == "Previous")
	{
		Lianja.showDocument("page:Customers?action=previous");
	}
	else if (cMenuitem == "Next")
	{
		Lianja.showDocument("page:Customers?action=next");
	}
	else if (cMenuitem == "Last")
	{
		Lianja.showDocument("page:Customers?action=last");
	}
		else if (cMenuitem == "High Credit Customers")
	{
		Lianja.showDocument("page:report_credit_gt_5000");
	}
	else if (cMenuitem == "Over Credit Limit")
	{
		Lianja.showDocument("page:report_make_customers");
	}
	else if (cMenuitem == "Search")
	{
		Lianja.showDocument("section:section1?action=togglesearchpanel");
	}
	else if (cMenuitem == "Customer List")
	{
	Lianja.showDocument("page:Client_Credit_Manager_all");
	}
	else if (cMenuitem === 'Map')
	{
		// title, filename, width, height, buttons, ontop, modal, action, text, resizable, onok, oncancel
		Lianja.showDialogPanel("Customer Location", "lib:/showdialog_map.rsp?address={customers.address}+{customers.city}+{customers.country}", 500);
	}
	else if (cMenuitem == "All")
	{
		Lianja.get("Customers.section1").filter = '';
		Lianja.get("Customers.section1").refresh();
	}
	else
	{
		Lianja.get("Customers.section1").filter = 'startsWith(contacttitle, "'+cMenuitem+'")';
		Lianja.get("Customers.section1").refresh();
	}
};


////////////////////////////////////////////////////////////////
// Event delegate for 'customfooterdisplay' event
function Customers_customfooterdisplay()
{
	var cont = createObject("container");
	cont.backcolor = "green";
	cont.layout = "H";
	//cont.addStretch();
	cont.addObject("lab", "label");
	lab.text = "This is a custom footer on " + dtoc(date()) + " at " + time();
	lab.forecolor = "white";
	lab.alignment = "center";
	//cont.addStretch();	
	return cont;
};


////////////////////////////////////////////////////////////////
// Event delegate for 'customheaderdisplay' event
function Customers_customheaderdisplay()
{
	var cont = createObject("container");
	cont.backcolor = "orange";
	cont.layout = "H";
	//cont.addStretch();
	cont.addObject("lab", "label");
	lab.text = "This is a custom header on " + dtoc(date()) + " at " + time();
	lab.forecolor = "white";
	lab.alignment = "center";
	lab.fontsize = "x-large";
	//cont.addStretch();	
	return cont;
};
