//
// Lianja custom section for page "page1" section "section1"
//
namespace example_drawable
public start_x, start_y
public image1
public cbOperation

define class page1_section1 as section
	proc init()
		// place your section "init" code here
	endproc
	
	proc add()
		// place your section "add" code here
	endproc
	
	proc delete()
		// place your "delete" code here
	endproc
	
	proc first()
		// place your "first" code here
	endproc
	
	proc previous()
		// place your move "previous" code here
	endproc
	
	proc next()
		// place your move "next" code here
	endproc
	
	proc last()
		// place your "last" code here
	endproc
	
	proc watch()
		// place your "watch" code here
	endproc
	
	proc refresh()
		// place your "refresh" code here
	endproc
	
	proc edit()
		// place your "edit" code here
	endproc
	
	proc search()
		// place your "search" code here
	endproc
	
	proc save()
		// place your "save" code here
	endproc
	
	proc cancel()
		// place your "cancel" code here
	endproc
enddefine

define class myimage as image
	proc mouseMove()
		if this.mouseDown
			if cbOperation.text = "rect"
				args =        str(start_x) 
				args += "," + str(start_y) 
				args += "," + str(mousex-start_x) 
				args += "," + str(mousey - start_y)
				args += "," + "yellow"
				args += "," + "3" 
				this.draw("myRect", "rect", args)
				this.draw("redraw")
			elseif cbOperation.text = "line"
				args =        str(start_x) 
				args += "," + str(start_y) 
				args += "," + str(mousex) 
				args += "," + str(mousey)
				args += "," + "yellow"
				args += "," + "3" 
				this.draw("myLine", "line", args)
				this.draw("redraw")
			elseif cbOperation.text = "fillrect"
				args =        str(start_x) 
				args += "," + str(start_y) 
				args += "," + str(mousex-start_x) 
				args += "," + str(mousey - start_y)
				args += "," + "red"
				this.draw("myFillRect", "fillrect", args)
				this.draw("redraw")
			elseif cbOperation.text = "text"
				args =        str(mousex) 
				args += "," + str(mousey) 
				args += "," + "Hello World"
				args += "," + "white"
				args += "," + "16"
				this.draw("myText", "text", args)
				this.draw("redraw")
			elseif cbOperation.text = "image"
				args =        str(mousex) 
				args += "," + str(mousey) 
				args += "," + str(80) 
				args += "," + str(80)
				args += "," + "c:\lianja\library\home.png"
				this.draw("myImage", "image", args)
				this.draw("redraw")
			endif
		endif
	endproc
	proc mouseDown()
		start_x = this.mousex
		start_y = this.mousey
		if cbOperation.text = "text"
			args =        str(start_x) 
			args += "," + str(start_y) 
			args += "," + "Hello World"
			args += "," + "white"
			args += "," + "16"
			this.draw("myText", "text", args)
			this.draw("redraw")
		elseif cbOperation.text = "image"
			args =        str(start_x) 
			args += "," + str(start_x) 
			args += "," + str(80) 
			args += "," + str(80)
			args += "," + "c:\lianja\library\home.png"
			this.draw("myImage", "image", args)
			this.draw("redraw")
		endif
	endproc
	proc mouseUp()
	endproc
enddefine

proc btnClearClick
	image1.draw("clear")
	image1.draw("redraw")
endproc

proc page1_section1
	page1_section1 = createobject("page1_section1")
	page1_section1.addObject("container1","container")
	container1.layout = "H"
	container1.backcolor = "lightblue"
	container1.addObject("image1","myimage")
	image1.picture = "c:\lianja\library\img_chania.jpg"
	image1.stretch = .f.
	container1.addObject("container2","container")
	container2.layout = "V"	
	container2.margin = 5
	container2.spacing = 5
	container2.fixedWidth = 100
	container2.addObject("cbOperation","combobox")
	cbOperation.addItem("rect")
	cbOperation.addItem("line")
	cbOperation.addItem("fillrect")
	cbOperation.addItem("text")
	cbOperation.addItem("image")
	container2.addObject("btnClear","commandbutton")
	btnClear.caption = "Clear"
	btnClear.click = btnClearClick
	container2.addStretch()
	container1.addObject("container3","container")
return page1_section1


