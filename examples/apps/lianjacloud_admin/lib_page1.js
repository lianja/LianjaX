////////////////////////////////////////////////////////////////
// Event delegate for 'customheaderdisplay' event
function page1_customheaderdisplay()
{
	var cont = createObject("container");
	cont.layout = "h";
	cont.backcolor = "#fafafa";
	cont.paddingleft = 10; 
	cont.paddingright = 10; 

	cont.addObject("ph_image", "image");
	ph_image.stretch = true;
	ph_image.fixedwidth = 40;
	ph_image.fixedheight = 40;
	ph_image.paddingtop = 5;	
	ph_image.picture = "lib:/images/lianja512.png";
	
	cont.addObject("ph_caption", "label");
	ph_caption.caption = "<font color='black'>&nbsp;Lianja </font><font color='gray'>Cloud</font>";
	ph_caption.fontsize = "xx-large";
	ph_caption.alignment = "left";
	
	cont.addStretch();
	
	cont.addObject("cont2", "container");
	cont2.layout = "h";
	cont2.margintop = 20; 
	cont2.backcolor = "#fafafa";

	cont2.addObject("ph_caption2", "label");
	ph_caption2.caption = Lianja.evaluate("strftime('%Y-%m-%d %H:%M:%S UTC')") + "   |   <a href='javascript:Lianja.home()'>Home</a>  |    <a href='javascript:Lianja.logout()'>Sign Out</a>    "; 
	ph_caption2.alignment = "right";
	ph_caption2.forecolor = "gray";
	return cont;
};


////////////////////////////////////////////////////////////////
// Event delegate for 'timer' event
function page1_section3_timer()
{
	var connections = Lianja.evaluate("sysinfo('connections')");
	var maxconnections = Lianja.evaluate("sysinfo('maxconnections'");
	var imaxconnections = maxconnections;
	if (maxconnections == 0) 
	{
		maxconnections = "50";
		imaxconnections = 50;
	}
	oSystemOverview_count.caption = "<font size='6'>" + connections + "</font><font size='5'> / " + maxconnections + "</font>&nbsp;&nbsp;User Connections";
	oSystemOverview_hbar.setStretchFactor(0,connections);
	oSystemOverview_hbar.setStretchFactor(1,imaxconnections-connections);
};
