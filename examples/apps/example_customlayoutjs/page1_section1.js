//
// Lianja custom JavaScript section "page1_section1"
//
var HEIGHT = 140;
oSection = createObject("oSection", "section");
oSection.backcolor = "#fafafa";

// add a vertical container
oSection.addObject("oVcont", "container");
oVcont.layout = "Vertical";
oVcont.marginleft = 50;
oVcont.marginright = 50;

// add the top divider panel
oVcont.addObject("oVcont_top", "container");
oVcont_top.backcolor = "#fafafa";
oVcont_top.fixedheight = 50;

// add the middle panel to contain the buttons
oVcont.addObject("oVcont_middle", "container");
oVcont_middle.spacing = 20;
oVcont_middle.layout = "Vertical";

// add the buttons
oVcont_middle.addObject("oVcont_btn1", "commandbutton");
oVcont_btn1.fixedheight = HEIGHT;
oVcont_btn1.caption = "Button 1";
oVcont_btn1.fontsize = 24;

oVcont_middle.addObject("oVcont_btn2", "commandbutton");
oVcont_btn2.fixedheight = HEIGHT;
oVcont_btn2.caption = "Button 2";
oVcont_btn2.fontsize = 24;

oVcont_middle.addObject("oVcont_btn3", "commandbutton");
oVcont_btn3.fixedheight = HEIGHT;
oVcont_btn3.caption = "Button 3";
oVcont_btn3.fontsize = 24;

// add the bottom divider panel
oVcont.addObject("oVcont_bottom", "container");
oVcont_bottom.fixedheight = 50;

// now we need to return the section container
returnvalue = oSection;
