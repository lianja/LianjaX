////////////////////////////////////////////////////////////////
// Event delegate for 'linkclick' event
function customers_section3_linkclick()
{
	var myorders = Lianja.getCursor("orders");
	var myorderid = myorders.getData("orderid");
	Lianja.writeLog(etos(myorderid));
};
