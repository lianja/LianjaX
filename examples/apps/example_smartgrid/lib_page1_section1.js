////////////////////////////////////////////////////////////////
// Custom display for column 'section1.column5'
function page1_section1_column5_customdisplay(controlsource, row, col)
{
	var grid = Lianja.get("page1.section1").grid;
	var employees = Lianja.getCursor("employees");
	dcont = createObject("dcont", "container");
	dcont.layout = "H";
	dcont.margin = 1;
	dcont.backcolor = "white";
	dcont.border = 1;
	dcont.bordercolor = "lightgray";
	dcont.raisedshadow = true;
	dcont.addObject("leftdcont", "container");
	leftdcont.layout = "V";
	leftdcont.addObject("labtitle", "label");
	labtitle.fixedheight = 20;
	labtitle.caption = "EMPLOYEE DETAILS";  
	labtitle.backcolor = "lightgray";
	labtitle.alignment = "center";
	leftdcont.addObject("lab", "label"); 
	lab.alignment = "center";
	lab.forecolor = "gray";
	lab.backcolor = "white";
	lab.fontbold = 1;
	lab.text = 	"<h3>" + employees.getData("titleofcourtesy") + " " + employees.getData("firstname") + " " + employees.getData("lastname") + "</h3>" +
				"<br>" + 
				employees.getData("address") + 
				"<br>" + 
				employees.getData("city") + 
				"<br>" + 
				employees.getData("region") + 
				"<br>" + 
				employees.getData("postalcode") + 
				"<br>" + 
				employees.getData("country") + 
				"<br>" +
				"Tel# " + employees.getData("homephone") +
				"<br>";
	lab.margin = 25;
	leftdcont.addObject("editbtncont", "container");
	editbtncont.layout = "H";
	editbtncont.backcolor = "white";
	editbtncont.addStretch();
	editbtncont.addObject("editbtn", "commandbutton");
	dcont.setItem("editbtn", editbtn);
	editbtn.setItem("dcont", dcont);
	editbtn.setItem("row", row);
	editbtn.setItem("col", col);
	editbtncont.fixedheight = 45;
	editbtncont.addStretch();
	editbtn.alignment = "center";
	editbtn.fixedwidth = 80;
	editbtn.caption = "EDIT";
	editbtn.stylesheet = "btn-success btn-sm";
	editbtn.click = function()
	{
		var row = this.getItem("row");
		var col = this.getItem("col");
		Lianja.get("page1.section1").grid.activateCell(row, col);
	};
	dcont.fixedheight = 260;
	return dcont;
};
 
  
////////////////////////////////////////////////////////////////
// Custom editor for column 'section1.column5'
function page1_section1_column5_customeditor(controlsource,row,col) 
{
	var employees = Lianja.getCursor("employees");
	econt = createObject("econt","container");
	econt.forecolor = "black";
	econt.layout = "Form";	
	econt.border = 1;
	econt.bordercolor = "lightslategray";
	econt.addRow("", "formheading", "label");
	formheading.caption = "EDIT EMPLOYEE DETAILS";
	formheading.fixedheight = 20;
	formheading.fontsize = 12;
	formheading.alignment = "center";
	formheading.backcolor = "lightslategray";
	formheading.forecolor = "white";
	econt.addRow("First Name:", "firstname", "textbox");
	firstname.controlsource = "employees.firstname";
	econt.addRow("Last Name:", "lastname", "textbox");
	lastname.controlsource = "employees.lastname";
	econt.addRow("Address:", "address", "textbox");
	address.controlsource = "employees.address";
	econt.addRow("City:", "city", "textbox");
	city.controlsource = "employees.city";
	econt.addRow("Region:", "region", "textbox"); 
	region.controlsource = "employees.region";
	econt.addRow("Postcode:", "postalcode", "textbox");
	postalcode.controlsource = "employees.postalcode";
	econt.addRow("Country:", "country", "textbox");
	country.controlsource = "employees.country";
	econt.backcolor = "lightgray";
	econt.addRow("", "buttons", "container");
	buttons.backcolor = "lightgray";
	buttons.layout = "Horizontal";
	buttons.spacing = 5;
	buttons.addObject("cancelbtn", "commandbutton"); 
	cancelbtn.caption = "Cancel";
	cancelbtn.stylesheet = "btn btn-sm btn-block btn-default";
	cancelbtn.click = function()
	{
		Lianja.get("page1.section1").grid.cancel();
	};
	buttons.addObject("savebtn", "commandbutton");
	savebtn.caption = "Save";
	savebtn.stylesheet = "btn btn-sm btn-block btn-default";
	savebtn.click = function()
	{
		Lianja.get("page1.section1").grid.save();
	};
	buttons.minheight = 34;
	econt.fixedheight = 260;
	return econt;
};


////////////////////////////////////////////////////////////////
// Custom display for column 'section1.COLUMN3'
function page1_section1_column3_customdisplay(controlsource,row,col)
{
    var data = [['Key', 'Value'],['Work',11], ['Eat',2], ['Commute',2], ['Watch TV',2], ['Sleep',7]]; 
    var title = "Assignments";   
    dcont = createObject("dcont", "container");
    dcont.layout = "V";
	dcont.margin = 1;
	dcont.backcolor = "white";
	dcont.border = 1;
	dcont.bordercolor = "lightgray";
	dcont.raisedshadow = true;
    dcont.backcolor = "white";
	dcont.addObject("labtitle", "label");
	labtitle.fixedheight = 20;
	labtitle.caption = "EMPLOYEE ASSIGNMENTS";  
	labtitle.backcolor = "lightgray";
	labtitle.alignment = "center";
    dcont.addObject("ochart", "chart");
    ochart.charttype = "googlechart.pie"; 
    ochart.charttitle = title;   
    ochart.chartdata = data;
    ochart.chartoptions = "";
	ochart.maxheight = 238;
	ochart.maxwidth = 411;
    ochart.refresh();
	dcont.maxwidth = 411;
	dcont.fixedheight = 260;
	return dcont;
};


////////////////////////////////////////////////////////////////
// Custom editor for column 'section1.column3'
function page1_section1_column3_customeditor(controlsource,row,col)
{
	// insert your code here
};
