//
// Visage custom section for gadget "gadget6"
//
define class mygadget as gadget
	proc refresh()
		// place your "refresh" code here 
	endproc
enddefine

proc lianjademo_gadget1 
	mygadget = createobject("mygadget") 
	//mygadget.stylesheet = "QTreeView::branch:has-children {image: url(:/images/none)}" +;
	//		             "QTreeView::branch:open {image: url(:/images/none)}"
	mygadget.addobject("tree1", "tree")
	tree1.columncount = 3
	tree1.rootisdecorated = .f.
	tree1.sortingenabled = .t.
	tree1.headerlabels = "Item|Quantity|Cost"
	tree1.backcolor(0, "white")
	tree1.backcolor(1, "lightgreen")
	tree1.backcolor(2, "lightblue")
	tree1.alignment(0, 0)
	tree1.alignment(1, 0)
	tree1.alignment(2, 1)

	tree1.addobject("treeitem1", "treeitem", ":/images/projects", "Meat")
	myarray = array()
	myarray[] = "Beef|1kg|$5.00"
	myarray[] = "Lamb|1Kg|$10.00"
	myarray[] = "Chicken|1kg|$2.00" 
	myarray[] = "Lamb|1kg|$2.00" 
	myarray[] = "Turkey|1kg|$2.00" 
	myarray[] = "||----------" 
	treeitem1.additems(myarray)

	tree1.addobject("treeitem2", "treeitem", ":/images/projects", "Fruit")
	treeitem2.additem("Apples|150|$2.50")
	treeitem2.additem("Oranges|300|$3.50")
	treeitem2.additem("Bananas|500|$1.50") 
	treeitem2.additem("||----------") 
	
	tree1.expandall
return mygadget
