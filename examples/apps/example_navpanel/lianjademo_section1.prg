namespace lianjademo

//
// Visage custom section 
//
define class lianjademo_section as section
	//backcolor = rgb(67,66,66) 
	caption = "Hello world"   
	height = 500   
	picture = ":/images/recital_background.jpg"                    
	stretch = 1 
	hideheaderatruntime = .f.  
	//mysection = _visage.findSectionByName("zzz")  
	//_visage.selectPage("aaa")                       
	  
	proc init()
		//logf("init() was called\n")  
	endproc

	proc add() 
		//logf("add() was called\n")   
	endproc

	proc delete()
		//logf("delete() was called\n")  
	endproc

	proc top()
		//logf("top() was called\n")
	endproc 

	proc previous()
		//logf("previous() was called\n")
	endproc

	proc next()
		//logf("next() was called\n")
	endproc

	proc bottom()
		//logf("bottom() was called\n") 
	endproc

	proc watch()
		//logf("relateData() was called\n") 
	endproc

	proc refresh()
		//logf("custom refresh() was called\n")
	endproc

	proc edit()
		//logf("relateData() was called\n")
	endproc

	proc search()
		//logf("relateData() was called\n")
	endproc

	proc relateData()
		//logf("relateData() was called\n")
	endproc
enddefine

////////////////////////////////////////////////////////////////////////////////
define class commandbutton_getfile as CommandButton 
proc click
	local filename
    filename = getfile()
    if len(filename) > 0
		=messagebox("Filename selected is '" + filename + "'")
	endif
endproc
enddefine

////////////////////////////////////////////////////////////////////////////////
define class commandbutton_putfile as CommandButton
proc click
	local filename
    filename = putfile()
    if len(filename) > 0
		=messagebox("Filename selected is '" + filename + "'")
	endif
endproc
enddefine

////////////////////////////////////////////////////////////////////////////////
define class commandbutton_getdir as CommandButton
proc click
	local directory
    directory = getdir()
    if len(directory) > 0
		=messagebox("Directory selected is '" + directory + "'")
	endif
endproc
enddefine

////////////////////////////////////////////////////////////////////////////////
define class commandbutton_waitwindow as CommandButton
proc click
	wait window "This is wait window 1..." timeout 10
	wait window "This is wait window 2..." timeout 10
endproc
enddefine

////////////////////////////////////////////////////////////////////////////////
define class commandbutton_inputbox as CommandButton
proc click
	local data 
    data = inputbox("Enter a data value:", "inputbox", "")
    if len(data) > 0
		=messagebox("Value input was "+data)
	endif
endproc
enddefine

////////////////////////////////////////////////////////////////////////////////
define class commandbutton_getfont as CommandButton
proc click
	local font
    font = getfont()
    if len(font) > 0
		=messagebox("Font selected is '" + font + "'")
	endif
endproc
enddefine

////////////////////////////////////////////////////////////////////////////////
define class commandbutton_getcolor as CommandButton
proc click
	local color
    color = getcolor(0)
    if color != 0
		messagebox("You chose color code "+tran(color))
	endif
endproc
enddefine

////////////////////////////////////////////////////////////////////////////////
define class commandbutton_progressbar as CommandButton
proc click
	progressbar.minimum = 1
	progressbar.maximum = 100
	progressbar.value = 0
	for i=1 to 100
	    progressbar.value = i
		sleep 1
	endfor
endproc
enddefine

////////////////////////////////////////////////////////////////////////////////
define class commandbutton_showwindow as CommandButton
proc click
	define window mywindow from 0,0 to 24,80 title "Example window"
	activate window mywindow
	define menu mymenu
	define pad mymenupad of mymenu prompt "File"
	on pad mymenupad of mymenu activate popup filemenu

	define popup filemenu
	define bar 1 of filemenu prompt "Menuitem 1"
	define bar 2 of filemenu prompt "Menuitem 2"
	on bar 2 of filemenu activate popup mysubmenu
		define popup mysubmenu
		define bar 1 of mysubmenu prompt "Submenu 1"
		define bar 2 of mysubmenu prompt "Submenu 2"
		define bar 3 of mysubmenu prompt "quit"
	    on selection bar 3 of mysubmenu quit
	define bar 3 of filemenu prompt "quit"
	on selection bar 3 of filemenu quit

	activate menu mymenu
	show window mywindow
endproc
enddefine

////////////////////////////////////////////////////////////////////////////////
define class commandbutton_getwindow as CommandButton
proc click
	define window mygetwindow from 0,0 to 24,80 title "GET window" 
	activate window mygetwindow
	clear
	@0,0 say "01234567890123456789012345678901234567890123456789012345678901234567890123456789"
	@1,4 say "Character"
	@2,4 get m_var1 default "Visage"
	@3,4 say "Numeric"
	@4,4 get m_var2 default 0
	@5,4 say "Date"
	@6,4 get m_var3 default date()
	@7,4 say "Logical"
	@8,4 get m_var4 default .t.
	@9,4 to 15,79
	@17,4 fill to 20,79 color b/g
	@17,14 clear to 21,69 
	@22,4 to 22,79 color g+/w
	@23,4 to 24,4 color g+/w
	for i=1 to 24
	    @i,0 say str(i, 2) color r/w
	endfor
	show window mygetwindow
	read modal
	release window mygetwindow
endproc
enddefine

proc lianjademo_section1 
	lianjademo_section = createobject("lianjademo_section")
	lianjademo_section.caption = "Recital Visage Custom section (framework example test)"
	lianjademo_section.addobject("tabs", "pageframe")
	tabs.addobject("tab4", "page")
	tab4.caption = "Image view" 
	tab4.picture = ":/images/lianja_wallpaper"  
	tab4.addobject("cont2", "container") 
	cont2.autosize = .t.
	cont2.picture = ":/images/lianja_wallpaper"  
	cont2.addobject("lab1", "label") 
	lab1.caption = "This is a transparent label"
	lab1.top = 50
	lab1.left = 50
	lab1.fontsize = 16
	lab1.transparent = .t.
	lab1.adjustsize
	tabs.addobject("tab5", "page")
	tab5.caption = "Webview" 
	tab5.addobject("webcont", "webview") 
	webcont.autosize = .t.
	webcont.html = "<h1>This is an html container</h1><br>You can assign html into it or specify a url. The WebView container also handles javascript which can be executed inside it and the result returned back" 
	//-----
	tabs.addobject("page0", "page")		&& functions
	page0.caption = "Functions"
	page0.show
	tabs.addobject("page1", "page")		&& Checkbox
	page1.caption = "Checkbox"
	page1.show
	tabs.addobject("page2", "page")		&& Combobox
	page2.caption = "Combobox"
	page2.show
	tabs.addobject("page3", "page")		&& Commandbutton
	page3.caption = "Commandbutton"
	page3.show
	tabs.addobject("page4", "page")		&& Commandgroup
	page4.caption = "Commandgroup"
	page4.show
	tabs.addobject("page5", "page")		&& Container
	page5.caption = "Container"
	page5.show
	tabs.addobject("page6", "page")		&& Control 
	page6.caption = "Control"
	page6.show
	tabs.addobject("page7", "page")		&& Datetextbox
	page7.caption = "Datetextbox"
	page7.show
	tabs.addobject("page8", "page")		&& Editbox
	page8.caption = "Editbox"
	page8.show
	tabs.addobject("page9", "page")		&& Grid
	page9.caption = "Grid"
	page9.show
	tabs.addobject("page11", "page")	&& Label
	page11.caption = "Label"
	page11.show
	tabs.addobject("page12", "page")	&& Line
	page12.caption = "Line"
	page12.show
	tabs.addobject("page13", "page")	&& Listbox
	page13.caption = "Listbox"
	page13.show
	tabs.addobject("page14", "page")	&& Optionbutton
	page14.caption = "Optionbutton"
	page14.show
	tabs.addobject("page15", "page")	&& Optiongroup
	page15.caption = "Optiongroup"
	page15.show
	tabs.addobject("page18", "page")	&& Popupmenu
	page18.caption = "Popupmenu"
	page18.show
	tabs.addobject("page19", "page")	&& shape
	page19.caption = "Shape"
	page19.show
	tabs.addobject("page20", "page")	&& spinner
	page20.caption = "Spinner"
	page20.show
	tabs.addobject("page21", "page")	&& splitter
	page21.caption = "Splitter"
	page21.show
	tabs.addobject("page22", "page")	&& textbox
	page22.caption = "Textbox"
	page22.show
	tabs.addobject("page23", "page")	&& timer
	page23.caption = "Timer"
	page23.show
	tabs.addobject("page24", "page")	&& toolbar
	page24.caption = "Toolbar"
	page24.show
	tabs.addobject("page25", "page")	&& tree
	page25.caption = "Tree"
	page25.show	
	
	// Functions
	page0.addobject("btngetcolor", "commandbutton_getcolor")
	btnGetColor.top = 20
	btnGetColor.left = 20
	btnGetColor.width = 120
	btnGetColor.height = 25
	btnGetColor.caption = "getcolor()"
	btnGetColor.show
	
	page0.addobject("btngetfile", "commandbutton_getfile")
	btnGetFile.top = 50
	btnGetFile.left = 20
	btnGetFile.width = 120
	btnGetFile.height = 25
	btnGetFile.caption = "getfile()"
	btnGetFile.show
	
	page0.addobject("btnputfile", "commandbutton_putfile")
	btnPutFile.top = 80
	btnPutFile.left = 20
	btnPutFile.width = 120
	btnPutFile.height = 25
	btnPutFile.caption = "putfile()"
	btnPutFile.show
	
	page0.addobject("btngetfont", "commandbutton_getfont")
	btnGetfont.top = 110
	btnGetfont.left = 20
	btnGetfont.width = 120
	btnGetfont.height = 25
	btnGetfont.caption = "getfont()"
	btnGetfont.show
	
	page0.addobject("btngetdir", "commandbutton_getdir")
	btnGetdir.top = 140
	btnGetdir.left = 20
	btnGetdir.width = 120
	btnGetdir.height = 25
	btnGetdir.caption = "getdir()"
	btnGetdir.show
	
	page0.addobject("btninputbox", "commandbutton_inputbox")
	btninputbox.top = 170
	btninputbox.left = 20
	btninputbox.width = 120
	btninputbox.height = 25
	btninputbox.caption = "inputbox()"
	btninputbox.show
	
	page0.addobject("btnwaitwindow", "commandbutton_waitwindow")
	btnwaitwindow.top = 200
	btnwaitwindow.left = 20
	btnwaitwindow.width = 120
	btnwaitwindow.height = 25
	btnwaitwindow.caption = "wait window"
	btnwaitwindow.show
	
	// Checkbox
	checkbox = createobject("checkbox")
	checkbox.caption = "Checkbox"
	checkbox.top = 20
	checkbox.left = 20
	checkbox.width = 120
	checkbox.height = 25
	checkbox.tooltiptext = "Checkbox"
	//checkbox.message = "Checkbox"
	checkbox.show
	page1.addobject(checkbox)
	
	// Combobox
	Combobox = createobject("Combobox")
	Combobox.top = 20
	Combobox.left = 20
	Combobox.width = 120
	Combobox.height = 25
	Combobox.tooltiptext = "Combobox"
	Combobox.additem("One")
	Combobox.additem("Two")
	Combobox.additem("Three")
	//Combobox.message = "Combobox"
	Combobox.show
	page2.addobject(Combobox)
	
	// Commandbutton
	Commandbutton = createobject("Commandbutton")
	Commandbutton.caption = "Commandbutton"
	Commandbutton.top = 20
	Commandbutton.left = 20
	Commandbutton.width = 120
	Commandbutton.height = 25
	Commandbutton.tooltiptext = "Commandbutton"
	//Commandbutton.message = "Commandbutton"
	Commandbutton.show
	page3.addobject(Commandbutton)
	
	// Commandgroup
	Commandgroup = createobject("Commandgroup")
	Commandgroup.top = 20
	Commandgroup.left = 20
	Commandgroup.width = 350
	Commandgroup.height = 25
	Commandgroup.tooltiptext = "Commandgroup"
	Commandgroup.buttoncount = 2
	Commandgroup.backcolor = rgb(78, 78, 78)
	//Commandgroup.message = "Commandgroup"
	Commandgroup.show
	Commandgroup.buttons(1).caption = "Button1"
	Commandgroup.buttons(1).show
	Commandgroup.buttons(2).caption = "Button2"
	Commandgroup.buttons(2).show
	page4.addobject(Commandgroup)
	
	// Container
	container = createobject("container")
	container.top = 20
	container.gradient = 1
	container.gradientfromcolor = rgb(0, 0, 0)
	container.gradienttocolor = rgb(200, 200, 200)	
	container.show
	page5.layout = 1
	page5.addobject(container)
	
	// Control
	control = createobject("control")
	control.gradient = 3
	control.gradientfromcolor = rgb(0, 0, 0)
	control.gradienttocolor = rgb(200, 200, 200)	
	control.show
	page6.layout = 1
	page6.addobject(control)
	
	// Datetextbox
	Datetextbox = createobject("Datetextbox")
	Datetextbox.top = 20
	Datetextbox.left = 20
	Datetextbox.width = 120
	Datetextbox.height = 25
	Datetextbox.tooltiptext = "Datetextbox"
	Datetextbox.text = etos(date())
	Datetextbox.show
	page7.addobject(Datetextbox)
	
	// Datetimetextbox
	Datetimetextbox = createobject("Datetimetextbox")
	Datetimetextbox.top = 80
	Datetimetextbox.left = 20
	Datetimetextbox.width = 160
	Datetimetextbox.height = 25
	Datetimetextbox.tooltiptext = "Datetimetextbox"
	//Datetimetextbox.minvalue = ""
	//Datetimetextbox.maxvalue = ""
	Datetimetextbox.text = etos(date())
	//Datetimetextbox.message = "Datetimetextbox"
	Datetimetextbox.show
	page7.addobject(Datetimetextbox)
	
	// Editbox
	Editbox = createobject("Editbox")
	Editbox.autosize = .t.
	Editbox.top = 20
	Editbox.left = 20
	Editbox.width = 300
	Editbox.height = 200
	Editbox.text = "This an example of an editbox"
	Editbox.show
	page8.addobject(Editbox)
	
	// Grid
	Grid = createobject("Grid")
	//Grid.autosize = .t.
	grid.columncount = 10
	grid.rowcount = 100
	grid.recordsourcetype = -1;
	// change column headings like this
	//grid.column1.header1.caption = "ColumnA"
	//grid.column2.header1.caption = "B"
	//grid.column3.header1.caption = "C"
	//grid.column4.header1.caption = "D"
	// etc...
	grid.alternatingrowcolors = .t.
	grid.rowheight = 20
	grid.readonly = .t.
	Grid.show
	Grid_container = createobject("Container")
	Grid_container.layout = 1
	page9.layout = 1
	page9.addobject(Grid_container)
	Grid_container.addobject(Grid)
	
	// Label
	Label = createobject("Label")
	Label.top = 20
	Label.left = 20
	Label.width = 200
	Label.height = 25
	Label.caption = 'This is a gradient label'
	Label.fontbold = .t.
	Label.indent = 4
	Label.forecolor = rgb(255, 255, 255)
	Label.gradient = 2
	Label.gradientfromcolor = rgb(0, 0, 0)
	Label.gradienttocolor = rgb(200, 200, 200)	
	Label.show
	page11.addobject(Label)
	
	// Line
	Line = createobject("Line")
	Line.top = 20
	Line.left = 20
	Line.width = 150
	Line.height = 4
	Line.lineslant = "-"
	Line.forecolor = rgb(255, 255, 255)
	Line.show
	page12.addobject(Line)
	Line2 = createobject("Line")
	Line2.top = 80
	Line2.left = 20
	Line2.width = 4
	Line2.height = 50
	Line2.lineslant = "|"
	Line2.forecolor = rgb(255, 255, 255)
	Line2.show
	page12.addobject(Line2)
	Line3 = createobject("Line")
	Line3.top = 140
	Line3.left = 20
	Line3.width = 150
	Line3.height = 50
	Line3.lineslant = "/"
	Line3.forecolor = rgb(255, 255, 255)
	Line3.show
	page12.addobject(Line3)
	Line4 = createobject("Line")
	Line4.top = 220
	Line4.left = 20
	Line4.width = 150
	Line4.height = 50
	Line4.lineslant = "\"
	Line4.forecolor = rgb(255, 255, 255)
	Line4.show
	page12.addobject(Line4)
	
	// Listbox
	Listbox = createobject("Listbox")
	Listbox.top = 20
	Listbox.left = 20
	Listbox.width = 120
	Listbox.height = 100
	Listbox.tooltiptext = "Listbox"
	Listbox.additem("One")
	Listbox.additem("Two")
	Listbox.additem("Three")
	//Listbox.message = "Combobox"
	Listbox.show
	page13.addobject(Listbox)
	
	// Optionbutton
	Optionbutton = createobject("Optionbutton")
	Optionbutton.caption = "Optionbutton"
	Optionbutton.top = 20
	Optionbutton.left = 20
	Optionbutton.width = 120
	Optionbutton.height = 25
	Optionbutton.tooltiptext = "Optionbutton"
	//Optionbutton.message = "Checkbox"
	Optionbutton.show
	page14.addobject(Optionbutton)
	
	// Optiongroup
	Optiongroup = createobject("Optiongroup")
	Optiongroup.caption = "Optiongroup"
	Optiongroup.top = 20
	Optiongroup.left = 20
	Optiongroup.width = 200
	Optiongroup.height = 100
	Optiongroup.tooltiptext = "Optiongroup"
	//Optiongroup.message = "Optiongroup"
	Optiongroup.show
	page15.addobject(Optiongroup)
	optiongroup.buttoncount = 2
	
	Optiongroup.buttons(1).caption = "OptionButton1"
	Optiongroup.buttons(1).show
	Optiongroup.buttons(2).caption = "OptionButton2"
	Optiongroup.buttons(2).show
	Optiongroup.value = 2
	
	// Shapes
	square = createobject("shape")
	square.top = 20
	square.left = 20
	square.width = 50
	square.height = 50
	square.forecolor = rgb(255,0,0)
	square.fillColor = rgb(0, 255, 0)
	square.show
	page19.addobject(square)
	
	rsquare = createobject("shape")
	rsquare.top = 90
	rsquare.left = 20
	rsquare.width = 50
	rsquare.height = 50
	rsquare.curvature = 30
	rsquare.forecolor = rgb(255,0,0)
	rsquare.fillColor = rgb(0, 255, 0)
	rsquare.show
	page19.addobject(rsquare)
	
	esquare = createobject("shape")
	esquare.top = 180
	esquare.left = 20
	esquare.width = 50
	esquare.height = 50
	esquare.curvature = 99
	esquare.forecolor = rgb(255,0,0)
	esquare.fillColor = rgb(0, 255, 0)
	esquare.show
	page19.addobject(esquare)
	
	// Spinner
	spinner = createobject("spinner")
	spinner.top = 20
	spinner.left = 20
	spinner.width = 100
	spinner.height = 25
	spinner.spinnerlowvalue = 1
	spinner.spinnerhighvalue = 10
	spinner.keyboardhighvalue = 10
	spinner.keyboardlowvalue = 1
	spinner.increment = 1
	spinner.value = 5
	spinner.show
	page20.addobject(spinner)
	
	// Splitter
	Splitter = createobject("Splitter")
	Splitter.orientation = 0
	Splitter.autosize = .t.
	Splitter.show
	page21.addobject(Splitter)
	
	Splitter_left = createobject("container")
	splitter_left.backcolor = rgb(255, 255, 255)
	Splitter_left.width = 150
	splitter_left.show
	Splitter.addobject(splitter_left)
	
	// Splitter
	Splitter2 = createobject("Splitter")
	Splitter2.orientation = 1
	Splitter2.width = 600
	Splitter2.show
	splitter.addobject(Splitter2)
	
	Splitter2_left = createobject("container")
	splitter2_left.backcolor = rgb(255, 255, 255)
	splitter2_left.show
	Splitter2.addobject(splitter2_left)
	
	Splitter2_right = createobject("container")
	splitter2_right.backcolor = rgb(255, 255, 255)
	splitter2_right.show
	Splitter2.addobject(splitter2_right)
	
	// Textbox
	Textbox = createobject("Textbox")
	Textbox.top = 20
	Textbox.left = 20
	Textbox.width = 100
	Textbox.height = 25
	Textbox.value = 5
	Textbox.stylesheet = "color: rgb(127,0,63);background-color: rgb(255, 255, 241); selection-color: white; selection-background-color: rgb(191, 31, 127); border: 2px groove gray; border-radius: 10px; padding: 2px 4px;"
	Textbox.show
	page22.addobject(Textbox)
	
	// Tree
	Tree = createobject("Tree")
	Tree.top = 0
	Tree.left = 0
	Tree.width = 200
	Tree.autoheight = .t.
	Tree.tooltiptext = "Tree"
	Tree.message = "Tree"
	Tree.show
	page25.addobject(Tree)
	
	fruit = Tree.additem("", "Fruit")
	fruit.additem("", "Apple")
	fruit.additem("", "Orange")
	fruit.additem("", "Banana")
	
	vegetables = Tree.additem("", "Vegetables")
	vegetables.additem("", "Potato")
	vegetables.additem("", "Cabbage")
	vegetables.additem("", "Carrot")
	
	Tree.expandall
	
	// Add pages to the Pageframe
	tabs.addobject(page0)
	tabs.addobject(page1)
	tabs.addobject(page2)
	tabs.addobject(page3)
	tabs.addobject(page4)
	tabs.addobject(page5)
	tabs.addobject(page6)
	tabs.addobject(page7)
	tabs.addobject(page8)
	tabs.addobject(page9)
	tabs.addobject(page11)
	tabs.addobject(page12)
	tabs.addobject(page13)
	tabs.addobject(page14)
	tabs.addobject(page15)
	tabs.addobject(page18)
	tabs.addobject(page19)
	tabs.addobject(page20)
	tabs.addobject(page21)
	tabs.addobject(page22)
	tabs.addobject(page23)
	tabs.addobject(page24)
	tabs.addobject(page25)

return lianjademo_section




