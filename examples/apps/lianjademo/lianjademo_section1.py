#--------------------------------------------------------------------------
#
# Lianja custom Python section
#
#--------------------------------------------------------------------------
import sys
#import time
import Lianja

# You can write to the console log from Python like this
Lianja.writeLog("Hello from Python")

# you can extend the App Builder and add your own Tools written in Python 
# using the application framework like this
#pytool = Lianja.addTool("container", "My Python Tool")
#pytool.layout = 2
#pytool.backcolor = "beige"
#pytool.addobject("pylabel", "label")
#pylabel.caption = "Hello Python developers"
#pylabel.fixedheight = 30
#pylabel.backcolor = "green"
#pylabel.forecolor = "white"
#pylabel.height = 30

#--------------------------------------------------------------------------
# Step 1: Define the classes we need
# Note that all Lianja Framework classes can be subclassed in Python
class mySection(Lianja.Section): 
    def add(self):
        Lianja.showMessage("add() was called")
						
    def delete(self):
        Lianja.showMessage("delete() was called") 
						
    def first(self):
        pass
						
    def previous(self):
        Lianja.showMessage("previous() was called")
						
    def next(self):
        Lianja.showMessage("next() was called")
	
    def last(self):
        Lianja.showMessage("last() was called")
					
    def watch(self):
        Lianja.showMessage("watch() was called")
						
    def edit(self):
        Lianja.showMessage("edit() was called")
						
    def save(self):
        pass
						
    def cancel(self):
        Lianja.showMessage("cancel() was called")
						
    def refresh(self):
        pass

#--------------------------------------------------------------------------
# Note how the click() event handler for the Listbox is defined in Python
class myListbox(Lianja.Listbox):
    def click(self):
        ui_grid.clear( )
        # note how the "additems" method of a "Grid", "Listbox" and "Combobox" can take 
        # a SQL SELECT statement as an argument
        if ui_listbox.text == "All":
            ui_grid.additems('select * from southwind!example where last_name != " "')
        else: 
            ui_grid.additems('select * from southwind!example where upper(left(last_name,1)) = "' + ui_listbox.text + '"')

#--------------------------------------------------------------------------
# Step 2: create the "Section" object
# Note that the createObject() method needs two args; objectname, classname
mysection = Lianja.createObject("mysection", "mySection") 
#mysection.caption = "This is a custom Python section"

#--------------------------------------------------------------------------
# Step 3: create a "Pageframe" class and add it to the "Section"
mysection.addObject("ui_tabs", "Pageframe")
      
#--------------------------------------------------------------------------
# Step 4: Add a "Page" to the "Pageframe" class and set some of its properties
ui_tabs.addobject("ui_tab_customers", "Page")
ui_tab_customers.caption = "Customers"
	
#--------------------------------------------------------------------------
# Step 5: Add a "Container" to the "Page" and set some of its properties
# the addobject() method takes the object name as the first arg then the class name as the second.
ui_tab_customers.addobject("ui_cont", "Container") 	
ui_cont.autosize = 1
ui_cont.backcolor = "lightgray"
ui_cont.layout = "horizontal"
ui_cont.margin = 5
ui_cont.spacing = 5
	 
#--------------------------------------------------------------------------
# Step 6: Add a "Listbox" to the "Container" and set some of its properties
ui_cont.addobject("ui_listbox", "myListbox")
ui_listbox.fixedwidth = 200

#--------------------------------------------------------------------------
# Step 7: Invoke the "Additems" method with a comma separated list of items to add to the Listbox
ui_listbox.additems("All,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z")
	
#--------------------------------------------------------------------------
# Step 8: Add a "Grid" to the "Container"
ui_cont.addobject("ui_grid", "Grid")
ui_grid.rowheight = 20
ui_grid.readonly = 1
ui_grid.recordmark = 0
ui_grid.closable = 0
ui_grid.caption = "Sample data"
ui_grid.additems('select * from southwind!example where last_name != " "')
ui_grid.autofit( )
ui_grid.show()

#--------------------------------------------------------------------------
# Step 9: Add a few more "Page" classes to the "Pageframe"
ui_tabs.addobject("ui_tab_orders", "Page")
ui_tab_orders.caption = "Orders"
ui_tabs.addobject("ui_tab_shippers", "Page")
ui_tab_shippers.caption = "Shippers"

#--------------------------------------------------------------------------
# Step 10: now we must return the section back to the Lianja. We accomplish this by assigning
# it to the global "returnvalue" variable.
returnvalue = mysection
