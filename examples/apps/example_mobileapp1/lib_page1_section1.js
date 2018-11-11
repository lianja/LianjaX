////////////////////////////////////////////////////////////////
// Event delegate for 'customsectionmenu' event
function page1_section1_customsectionmenu(arg)
{
	if (arg === "Customers")
	{
		Lianja.showDocument("page:customers");
	}
	else if (arg === "Orders")
	{
		Lianja.getElementByID("orders.section1").filter = "customerid='{CUSTOMERS.CUSTOMERID}'";
		Lianja.showDocument("page:orders");
	}
	else if (arg === "Order Details")
	{
		Lianja.getElementByID("orderdetails.section1").filter = "orderid={orders.orderid}";
		Lianja.showDocument("page:orderdetails");
	}
};


////////////////////////////////////////////////////////////////
// Event delegate for 'custommenu' event
function customers_section1_custommenu(arg)
{
	if (arg === "Location")
	{
		Lianja.showDialogPanel("CUSTOMER LOCATION", "lib:/showdialog_map.rsp?address={customers.address}+{customers.city}+{customers.country}", 500, 500, false, false);
	}
	else if (arg === "List")
	{
		Lianja.showDialogPanel("CUSTOMER LIST", "customerlist.rsp", 500);
	}
	else if (arg === "Reset")
	{
		Lianja.showDocument("page:customers?action=search&text=");
	}
};
