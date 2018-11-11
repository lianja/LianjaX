////////////////////////////////////////////////////////////////
// Event delegate for 'click' event
function page1_section1_field14_click(caption)
{
	messageBox("You clicked: "+caption);
};


////////////////////////////////////////////////////////////////
// Event delegate for 'customdisplay' event
function page1_section1_field13_customdisplay()
{
	var cont = createObject("container");
	cont.backcolor = "lightgreen";
	cont.margintop = 10;
	return cont;
};


////////////////////////////////////////////////////////////////
// Event delegate for 'customdisplay' event
function page1_section1_field12_customdisplay()
{
	var text = "<h2>Hello world at " + time() + "</h2>";
	text += "<h3>This is a another line</h3>";
	return text;
};
