// initialization
set perfmeter on
set strescape off

// Form
if type("lianja") = 'O' and .f.
	_visage.addobject("form", "container", "Visage Demo")
else
	form = createobject('Form')  		&& Create a Form
	form.statusbar = .t.
	form.message = "Form"
	form.width = 600
	form.height = 600
	form.caption = "Recital Visage Demo"
	form.exitonclose = .t.
	form.scrollbars = 3
	//form.actionbar = .t.

	// Menubar
	menubar = createobject("menubar")
	form.addobject(menubar)

	// Menus
	menu_file = createobject("menu")
	menu_file.caption = "File"
	menubar.addobject(menu_file)

	menu_file_exit = createobject("menuitem")
	menu_file_exit.caption = "\<Exit"
	menu_file_exit.command = "quit"
	menu_file.addobject(menu_file_exit)

	menu_edit = createobject("menu")
	menu_edit.caption = "Edit"
	menubar.addobject(menu_edit)
endif

// Pageframe
tabs = createobject("pageframe")
tabs.autosize = .t.
//tabs.backcolor = rgb(0xed, 0xe9, 0xe3)

// Pages
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
tabs.addobject("page10", "page")	&& Image
page10.caption = "Image"
page10.show
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
tabs.addobject("page26", "page")	&& webview
page26.caption = "Webview"
page26.show
tabs.addobject("page27", "page")	&& Window
page27.caption = "Window"
page27.show
tabs.addobject("page28", "page")	&& Progressbar
page28.caption = "Progressbar"
page28.show

// Functions
page0.addobject("btngetcolor", "commandbutton_getcolor")
btnGetColor.top = 20
btnGetColor.left = 20
btnGetColor.width = 120
btnGetColor.height = 25
btnGetColor.caption = "getcolor()"
btnGetColor.show

page0.addobject("btngetfile", "commandbutton_getfile")
btnGetFile.top = 80
btnGetFile.left = 20
btnGetFile.width = 120
btnGetFile.height = 25
btnGetFile.caption = "getfile()"
btnGetFile.show

page0.addobject("btnputfile", "commandbutton_putfile")
btnPutFile.top = 140
btnPutFile.left = 20
btnPutFile.width = 120
btnPutFile.height = 25
btnPutFile.caption = "putfile()"
btnPutFile.show

page0.addobject("btngetfont", "commandbutton_getfont")
btnGetfont.top = 200
btnGetfont.left = 20
btnGetfont.width = 120
btnGetfont.height = 25
btnGetfont.caption = "getfont()"
btnGetfont.show

page0.addobject("btngetdir", "commandbutton_getdir")
btnGetdir.top = 260
btnGetdir.left = 20
btnGetdir.width = 120
btnGetdir.height = 25
btnGetdir.caption = "getdir()"
btnGetdir.show

page0.addobject("btninputbox", "commandbutton_inputbox")
btninputbox.top = 320
btninputbox.left = 20
btninputbox.width = 120
btninputbox.height = 25
btninputbox.caption = "inputbox()"
btninputbox.show

page0.addobject("btnwaitwindow", "commandbutton_waitwindow")
btnwaitwindow.top = 380
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
combobox = createobject("combobox")
combobox.top = 20
combobox.left = 20
combobox.width = 120
combobox.height = 25
combobox.tooltiptext = "combobox"
combobox.additem("One")
combobox.additem("Two")
combobox.additem("Three")
//combobox.message = "combobox"
combobox.show
page2.addobject(combobox)

// Commandbutton
commandbutton = createobject("commandbutton")
commandbutton.caption = "commandbutton"
commandbutton.top = 20
commandbutton.left = 20
commandbutton.width = 120
commandbutton.height = 25
commandbutton.tooltiptext = "commandbutton"
//commandbutton.message = "commandbutton"
commandbutton.show
page3.addobject(commandbutton)

// Commandgroup
commandgroup = createobject("commandgroup")
commandgroup.top = 20
commandgroup.left = 20
commandgroup.width = 350
commandgroup.height = 25
commandgroup.tooltiptext = "commandgroup"
commandgroup.buttoncount = 2
commandgroup.backcolor = rgb(78, 78, 78)
//commandgroup.message = "commandgroup"
commandgroup.show
commandgroup.buttons(1).caption = "Button1"
commandgroup.buttons(1).show
commandgroup.buttons(2).caption = "Button2"
commandgroup.buttons(2).show
page4.addobject(commandgroup)

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
control.gradient = 2
control.gradientfromcolor = rgb(0, 0, 0)
control.gradienttocolor = rgb(200, 200, 200)	
control.show
page6.layout = 1
page6.addobject(control)

// Datetextbox
datetextbox = createobject("datetextbox")
datetextbox.top = 20
datetextbox.left = 20
datetextbox.width = 120
datetextbox.height = 25
datetextbox.tooltiptext = "datetextbox"
datetextbox.text = etos(date())
datetextbox.show
page7.addobject(datetextbox)

// Datetimetextbox
datetimetextbox = createobject("datetimetextbox")
datetimetextbox.top = 80
datetimetextbox.left = 20
datetimetextbox.width = 160
datetimetextbox.height = 25
datetimetextbox.tooltiptext = "datetimetextbox"
//datetimetextbox.minvalue = ""
//datetimetextbox.maxvalue = ""
datetimetextbox.text = etos(date())
//datetimetextbox.message = "datetimetextbox"
datetimetextbox.show
page7.addobject(datetimetextbox)

// Editbox
editbox = createobject("editbox")
editbox.top = 20
editbox.left = 20
editbox.width = 300
editbox.height = 200
editbox.text = "This an example of an editbox"
editbox.show
page8.addobject(editbox)

// Grid
Grid = createobject("Grid")
Grid.autosize = .t.
grid.columncount = 10
grid.rowcount = 100
grid.column1.header1.caption = "Hello world"
grid.alternatingrowcolors = .t.
grid.rowheight = 20
//grid.readonly = .t.
Grid.show
page9.addobject(Grid)

// Image
image = createobject("image")
image.autosize = .t.
image.picture = "/usr/recital/images/recital_10_background.jpg"
image.stretch = 1
image.show
page10.addobject(image)

// Label
label = createobject("label")
label.top = 20
label.left = 20
label.width = 200
label.height = 25
label.caption = 'This is a gradient label'
label.fontbold = .t.
label.indent = 4
label.forecolor = rgb(255, 255, 255)
label.gradient = 2
label.gradientfromcolor = rgb(0, 0, 0)
label.gradienttocolor = rgb(200, 200, 200)	
label.show
page11.addobject(label)

// Line
line = createobject("line")
line.top = 20
line.left = 20
line.width = 150
line.height = 4
line.lineslant = "-"
line.forecolor = rgb(255, 255, 255)
line.show
page12.addobject(line)
line2 = createobject("line")
line2.top = 80
line2.left = 20
line2.width = 4
line2.height = 50
line2.lineslant = "|"
line2.forecolor = rgb(255, 255, 255)
line2.show
page12.addobject(line2)
line3 = createobject("line")
line3.top = 140
line3.left = 20
line3.width = 150
line3.height = 50
line3.lineslant = "/"
line3.forecolor = rgb(255, 255, 255)
line3.show
page12.addobject(line3)
line4 = createobject("line")
line4.top = 220
line4.left = 20
line4.width = 150
line4.height = 50
line4.lineslant = "\"
line4.forecolor = rgb(255, 255, 255)
line4.show
page12.addobject(line4)

// Listbox
listbox = createobject("listbox")
listbox.top = 20
listbox.left = 20
listbox.width = 120
listbox.height = 100
listbox.tooltiptext = "listbox"
listbox.additem("One")
listbox.additem("Two")
listbox.additem("Three")
//listbox.message = "combobox"
listbox.show
page13.addobject(listbox)

// Optionbutton
optionbutton = createobject("optionbutton")
optionbutton.caption = "optionbutton"
optionbutton.top = 20
optionbutton.left = 20
optionbutton.width = 120
optionbutton.height = 25
optionbutton.tooltiptext = "optionbutton"
//optionbutton.message = "Checkbox"
optionbutton.show
page14.addobject(optionbutton)

// Optiongroup
optiongroup = createobject("optiongroup")
optiongroup.caption = "optiongroup"
optiongroup.top = 20
optiongroup.left = 20
optiongroup.width = 200
optiongroup.height = 100
optiongroup.tooltiptext = "optiongroup"
//optiongroup.message = "optiongroup"
optiongroup.show
page15.addobject(optiongroup)
optiongroup.buttoncount = 2

optiongroup.buttons(1).caption = "optionbutton1"
optiongroup.buttons(1).show
optiongroup.buttons(2).caption = "optionbutton2"
optiongroup.buttons(2).show
optiongroup.value = 2

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
splitter = createobject("splitter")
splitter.orientation = 0
splitter.autosize = .t.
splitter.show
page21.addobject(splitter)

splitter_left = createobject("container")
splitter_left.backcolor = rgb(255, 255, 255)
splitter_left.width = 150
splitter_left.show
splitter.addobject(splitter_left)

// splitter
splitter2 = createobject("splitter")
splitter2.orientation = 1
splitter2.width = 600
splitter2.show
splitter.addobject(splitter2)

splitter2_left = createobject("container")
splitter2_left.show
splitter2.addobject(splitter2_left)

splitter2_right = createobject("container")
splitter2_right.backcolor = rgb(255, 255, 255)
splitter2_right.show
splitter2.addobject(splitter2_right)

// Textbox
textbox = createobject("textbox")
textbox.top = 20
textbox.left = 20
textbox.width = 100
textbox.height = 25
textbox.value = 5
textbox.stylesheet = "color: rgb(127,0,63);background-color: rgb(255, 255, 241); selection-color: white; selection-background-color: rgb(191, 31, 127); border: 2px groove gray; border-radius: 10px; padding: 2px 4px;"
textbox.show
page22.addobject(textbox)

// Tree
tree = createobject("tree")
tree.top = 0
tree.left = 0
tree.width = 200
tree.autoheight = .t.
tree.tooltiptext = "tree"
tree.message = "tree"
tree.show
page25.addobject(tree)

fruit = tree.additem("", "Fruit")
fruit.additem("", "Apple")
fruit.additem("", "Orange")
fruit.additem("", "Banana")

vegetables = tree.additem("", "Vegetables")
vegetables.additem("", "Potato")
vegetables.additem("", "Cabbage")
vegetables.additem("", "Carrot")

tree.expandall

// Webview
webview = createobject("webview")
webview.url = "http://www.recital.com"
webview.autosize = .t.
webview.top = 0
webview.show
page26.addobject(webview)

// Window
page27.addobject("btnshowwindow", "commandbutton_showwindow")
btnshowwindow.top = 20
btnshowwindow.left = 20
btnshowwindow.width = 150
btnshowwindow.height = 25
btnshowwindow.caption = "show window"
btnshowwindow.show

page27.addobject("btngetwindow", "commandbutton_getwindow")
btngetwindow.top = 60
btngetwindow.left = 20
btngetwindow.width = 150
btngetwindow.height = 25
btngetwindow.caption = "get window"
btngetwindow.show

// Progressbar
page28.addobject("btnprogressbar", "commandbutton_progressbar")
btnprogressbar.top = 20
btnprogressbar.left = 20
btnprogressbar.width = 160
btnprogressbar.height = 25
btnprogressbar.caption = "Show progressbar"
btnprogressbar.show

page28.addobject("progressbar", "progressbar")
progressbar.top = 60
progressbar.left = 20
progressbar.width = 160
progressbar.height = 25
progressbar.minimum = 1
progressbar.maximum = 100
progressbar.text = "This is a progressbar"
progressbar.show

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
tabs.addobject(page10)
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
tabs.addobject(page26)
tabs.addobject(page27)
tabs.addobject(page28)

// add the Pageframe to the form
form.addobject(tabs)

// display the form
tabs.show
form.show

// Enter event loop
read events

////////////////////////////////////////////////////////////////////////////////
define class commandbutton_getcolor as commandbutton
proc click
	local color
    color = getcolor(0)
	if messagebox("Change backcolor of form", 4 + 32) = 6
		thisform.backcolor = color
	endif
endproc
enddefine

////////////////////////////////////////////////////////////////////////////////
define class commandbutton_getfile as commandbutton
proc click
	local filename
    filename = getfile()
	=messagebox("Filename selected is '" + filename + "'")
endproc
enddefine

////////////////////////////////////////////////////////////////////////////////
define class commandbutton_putfile as commandbutton
proc click
	local filename
    filename = putfile()
	=messagebox("Filename selected is '" + filename + "'")
endproc
enddefine

////////////////////////////////////////////////////////////////////////////////
define class commandbutton_getdir as commandbutton
proc click
	local directory
    directory = getdir()
	=messagebox("Directory selected is '" + directory + "'")
endproc
enddefine

////////////////////////////////////////////////////////////////////////////////
define class commandbutton_waitwindow as commandbutton
proc click
	wait window "This is a wait window..."
endproc
enddefine

////////////////////////////////////////////////////////////////////////////////
define class commandbutton_inputbox as commandbutton
proc click
	local data
    data = inputbox("Enter a data value:", "inputbox", "")
	=messagebox("Value entered was '" + data + "'")
endproc
enddefine

////////////////////////////////////////////////////////////////////////////////
define class commandbutton_getfont as commandbutton
proc click
	local font
    font = getfont()
	=messagebox("Font selected is '" + font + "'")
endproc
enddefine

////////////////////////////////////////////////////////////////////////////////
define class commandbutton_progressbar as commandbutton
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
define class commandbutton_showwindow as commandbutton
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
define class commandbutton_getwindow as commandbutton
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


