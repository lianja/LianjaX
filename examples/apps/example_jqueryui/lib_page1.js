////////////////////////////////////////////////////////////////
// Event delegate for 'navtreeselection' event
function page1_navtreeselection(title, key)
{
	Lianja.showDialog("CUSTOMER LOCATION", "lib:/showdialog_map.rsp?address="+key, 500, 500, false, false);
};
