//--------------------------------------------------------------------------
//
// Lianja custom javascript section
//
//--------------------------------------------------------------------------

// You can write to the console log from JavaScript like this
Lianja.writelog("Hello from JavaScript");

// you can extend the App Builder and add your own Tools written in JavaScript 
// using the application framework like this
//jstool = Lianja.addtool("container", "My JavaScript Tool");
//jstool.layout = "Vertical";
//jstool.backcolor = "blue";
//jstool.addobject("jslabel", "label");
//jslabel.caption = "Hello JavaScript developers";
//jslabel.backcolor = "darkblue";
//jslabel.forecolor = "white";
//jslabel.fixedheight = 30;

//--------------------------------------------------------------------------
// Step 1: create the custom section object
// Note that the createObject() function needs two args; objectname, classname
mysection = createobject("mysection", "section");
 
//--------------------------------------------------------------------------
// Step 2: create a "Pageframe" class and add it to the "Section"
mysection.addobject("ui_tabs", "pageframe"); 
      
//--------------------------------------------------------------------------
// Step 3: Add a "Page" to the "Pageframe" class and set some of its properties
ui_tabs.addobject("ui_tab_customers", "page");
ui_tab_customers.caption = "Customers";  
//ui_tab_customers.show( );
	
//--------------------------------------------------------------------------
// Step 4: Add a "Container" to the "Page" and set some of its properties
// the addobject() method takes the object name as the first arg then the 
// class name as the second.
ui_tab_customers.addobject("ui_cont", "container");	 
ui_cont.autosize = 1;
ui_cont.backcolor = "lightgray";
ui_cont.layout = "horizontal"; 
ui_cont.margin = 5;
ui_cont.spacing = 5;
 
//--------------------------------------------------------------------------
// Step 5: Add a "Listbox" to the "Container" and set some of its properties 
ui_cont.addobject("ui_listbox", "Listbox");
ui_listbox.fixedwidth = 200;

//--------------------------------------------------------------------------
// Step 6: You declare event callbacks for objects using javascript closures
// like this:
ui_listbox.click = function( )
{
    ui_grid.clear( ); 
    // note how the "additems" method of a "Grid", "Listbox" and "Combobox" can take 
    // a SQL SELECT statement as an argument
    if (ui_listbox.text == "All")
    {
        ui_grid.additems('select * from southwind!example where last_name != " "'); 
    } 
    else 
    {
        ui_grid.additems('select * from southwind!example where upper(left(last_name,1)) = "' + ui_listbox.text + '"');
    }
};

//--------------------------------------------------------------------------
// Step 7: Invoke the "Additems" method with a comma separated list of items
// to add to the Listbox
ui_listbox.additems("All,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z");   
ui_listbox.show( );
	
//--------------------------------------------------------------------------
// Step 8: Add a "Grid" to the "Container"
ui_cont.addobject("ui_grid", "grid");
ui_grid.show( );
ui_grid.rowheight = 20;
ui_grid.readonly = 1;
ui_grid.recordmark = 0;
ui_grid.closable = 0;
ui_grid.caption = "Sample data";
ui_grid.additems('select * from southwind!example where last_name != " "');
ui_grid.autofit( );

//--------------------------------------------------------------------------
// Step 9: Add a few more "Page" classes to the "Pageframe"
ui_tabs.addobject("ui_tab_orders", "page");
ui_tab_orders.caption = "Orders";
ui_tabs.addobject("ui_tab_shippers", "page");
ui_tab_shippers.caption = "Shippers";

//--------------------------------------------------------------------------
// Step 10: now we must return the section back to the Lianja. We accomplish
// this by assigning it to the "returnvalue" variable.
returnvalue = mysection;
