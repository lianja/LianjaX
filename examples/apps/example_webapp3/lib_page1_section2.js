////////////////////////////////////////////////////////////////
// Event delegate for 'click' event
function page1_section2_field23_click()
{
	m_companyname.text = "";
	m_companyregion.text = "";
	Lianja.get("page1.section1").filter = "";
	Lianja.showDocument("page:page1.section1?action=first");
}


////////////////////////////////////////////////////////////////
// Event delegate for 'click' event
function page1_section2_field77_click()
{
	if (m_orderdate.text.length == 0 && m_shipvia.text.length == 0)
	{
		messageBox("No order selection filter criteria has been specified.", "Order selection criteria");
		return;
	}
	messageBox("You specified orderdate="+m_orderdate.text+", shipvia="+m_shipvia.text, "Order selection criteria");
}


////////////////////////////////////////////////////////////////
// Event delegate for 'click' event
function page1_section2_field78_click()
{
	m_orderdate.text = "";
	m_shipvia.text = "";
	Lianja.get("page1.section1").filter = "";
	Lianja.showDocument("page:page1.section1?action=first");
}


////////////////////////////////////////////////////////////////
// Event delegate for 'custommenu' event
function page1_section2_custommenu(caption)
{
	messageBox("You selected "+caption);
}


////////////////////////////////////////////////////////////////
// Event delegate for 'changed' event
function page1_section2_m_companyname_changed()
{
	if (m_companyname.text.length == 1 && m_companyregion.text.length == 0)
	{
		messageBox("No customer search criteria has been specified.", "Customer search criteria");
		return;
	}

	if (m_companyregion.text.length > 0)
	{
		Lianja.showDocument("page:page1.section1?action=filter&text=region eq '" + m_companyregion.text+"'");
	}
	else if (m_companyname.text.length > 0)
	{
		Lianja.showDocument("page:page1.section1?action=search&text=" + m_companyname.text);
	}
}
