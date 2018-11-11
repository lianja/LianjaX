namespace lianjademo

//
// Lianja custom section for gadget "gadget5"
//
list   status 
// namespace gadgets
public lianjademo_gadget_grid

define class lianjademo_gadget2 as gadget
	proc refresh()
		// place your "refresh" code here 
	endproc
enddefine

define class cls_listbox as listbox
	proc click()
		lianjademo_gadget_grid.clear
		if trim(this.text) = "All"
			lianjademo_gadget_grid.additems('select * from example where last_name != " "') 
		else
			lianjademo_gadget_grid.additems('select * from example where upper(left(last_name,1)) = "' + trim(this.text) + '"') 
		endif
	endproc
enddefine

proc lianjademo_gadget2 
	lianjademo_gadget2 = createobject("lianjademo_gadget2")
	
	lianjademo_gadget2.addobject("tabs2", "pageframe")

	tabs2.addobject("ui_tab_customers", "page") 
	ui_tab_customers.caption = "Customers"
	ui_tab_customers.show
	
	ui_tab_customers.addobject("ui_cont", "container") 	
	ui_cont.autosize = .t.
	ui_cont.backcolor = "lightgray"
	ui_cont.layout = "horizontal"
	ui_cont.margin = 5 
	ui_cont.spacing = 5
	ui_cont.show
	 
	ui_cont.addobject("ui_listbox", "cls_listbox")
	ui_listbox.fixedwidth = 200
	ui_listbox.additems("All,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z")
	ui_listbox.show
	
	ui_cont.addobject("ui_grid", "grid")
	ui_grid.show
	ui_grid.rowheight = 20 
	ui_grid.readonly = .t.
	ui_grid.recordmark = .f.
	ui_grid.closable = .f.
	ui_grid.caption = "Sample customer data"
	ui_grid.additems('select * from example where last_name != " "') 
	lianjademo_gadget_grid = ui_grid

	tabs2.addobject("ui_tab_orders", "page")
	ui_tab_orders.caption = "Orders"

	tabs2.addobject("ui_tab_shippers", "page")
	ui_tab_shippers.caption = "Shippers"
	return lianjademo_gadget2
endproc
	
