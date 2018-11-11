//
// Lianja custom javascript gadget "gadget1"
//
gadget1_gadget = createobject("gadget1_gadget", "gadget");
gadget1_gadget.addObject("gadget1_cont", "container");
gadget1_cont.backcolor = "lightblue";
gadget1_cont.addObject("gadget1_time", "label");
gadget1_time.move(10, 10);
gadget1_time.fontsize = 'x-large';
gadget1_time.resize(350, 48);
var currentdate = new Date();
gadget1_time.text = "Current time is " + 
                    lpad(""+currentdate.getHours(),2,'0') + ":" + 
                    lpad(""+currentdate.getMinutes(),2,'0') + ":" + 
                    lpad(""+currentdate.getSeconds(),2,'0');
gadget1_time.backcolor = "black";
gadget1_time.forecolor = "red";
gadget1_time.alignment = "center";
gadget1_time.fontshadow = false;
returnvalue = gadget1_gadget;
