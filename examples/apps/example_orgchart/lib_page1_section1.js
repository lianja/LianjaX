////////////////////////////////////////////////////////////////
// Event delegate for 'click' event
function page1_section1_click(text)
{
	Lianja.showDocument("page:page1?action=search&text="+text.toLowerCase());
};


////////////////////////////////////////////////////////////////
// Event delegate for 'dblclick' event
function page1_section1_dblclick(text)
{
	messageBox("you double clicked: "+text);
};
