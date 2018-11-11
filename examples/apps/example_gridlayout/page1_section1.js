//
// Lianja custom JavaScript section "page1_section1"
//
oSection = createobject("oSection", "section");
oSection.addObject("oCont", "container");
oCont.layout = "Grid";

oCont.addObject("oCont1", "container", 0, 0);
oCont1.backcolor = "gold"; 
oCont1.fixedheight = 150;
oCont1.fixedwidth = 250;

oCont.addObject("oCont2", "container", 0, 1);
oCont2.backcolor = "orange"; 

oCont.addObject("oCont2", "container", 0, 2);
oCont2.backcolor = "darkorange"; 
oCont2.fixedwidth = 250;

oCont.addObject("oCont3", "container", 1, 0, 1, 3);
oCont3.layout = "Grid";

oCont3.addObject("oCont4", "container", 0, 0);
oCont4.backcolor = "lightgreen"; 
oCont4.layout = "Grid";

oCont4.addObject("oCont4_1", "container", 0, 0, 1, 2);
oCont4_1.backcolor = "lightgray"; 
oCont4_1.layout = "Grid";
oCont4_1.addObject("oCont4_1_1", "container", 0, 0);
oCont4_1_1.backcolor = "lightgray"; 
oCont4_1.addObject("oCont4_1_2", "container", 0, 1);
oCont4_1_2.backcolor = "gray"; 

oCont4.addObject("oCont4_2", "container", 2, 0, 1, 2);
oCont4_2.backcolor = "gold";
oCont4_2.fixedheight = 80; 

oCont4.addObject("oCont4_3", "container", 3, 0, 1, 2);
oCont4_3.backcolor = "orange";
oCont4_3.fixedheight = 60; 

oCont4.addObject("oCont4_4", "container", 4, 0, 1, 2);
oCont4_4.backcolor = "darkorange";
oCont4_4.fixedheight = 80; 

returnvalue = oSection;
