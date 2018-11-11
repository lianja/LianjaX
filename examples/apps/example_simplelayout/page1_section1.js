//
// Lianja custom JavaScript section "page1_section1"
//
oSection = createobject("oSection", "section");

// top
oSection.addObject("cont","container");
cont.backcolor = "white";
cont.layout = "Vertical"
cont.addObject("labtitle", "label");
labtitle.caption = "EMPLOYEE DETAILS"; 
labtitle.backcolor = "lightblue";
labtitle.alignment = "center";
labtitle.fontsize = 40;
labtitle.fixedheight = 100;

// middle
cont.addObject("middlecont","container");
middlecont.layout = "H";
middlecont.margin = 5;
middlecont.backcolor = "orange";
middlecont.addObject("ebox", "editbox");

// bottom
cont.addObject("btncont","container");
btncont.backcolor = "lightgreen";
btncont.fixedheight = 100;
btncont.layout = "H";
btncont.spacing = 10;
btncont.addStretch();
btncont.addObject("btn1", "commandbutton"); 
btn1.caption = "Hello";
btn1.fixedwidth = 120;
btn1.fixedheight = 60;
btn1.fontsize = 20;
btn1.stylesheet = "btn btn-sm btn-block";
btncont.addSpacing(10);
btncont.addObject("btn2", "commandbutton"); 
btn2.caption = "World";
btn2.fixedwidth = 120;
btn2.fixedheight = 60;
btn2.stylesheet = "btn btn-sm btn-block";
btn2.fontsize = 20;
btncont.addStretch();
returnvalue = oSection;
