//--------------------------------------------------------------------------
//
// Lianja custom PHP section
//
//--------------------------------------------------------------------------

// Important note. In PHP to access "outer variables" from within class 
// methods you must declare then "global" and then specify "global" again
// within the class method
global $ui_grid;
global $ui_listbox;

// You can write to the console log from PHP like this 
Lianja::writeLog("Hello from PHP");

//--------------------------------------------------------------------------
// Step 1: Define the classes we need
// Note how the Visage App Framework classes are subclassed in PHP 
// using the __construct() magic method.
class mySection extends Lianja     
{
	function __construct()
	{
		parent::__construct("Section");
	}
    
    function add()
    {
        Lianja::showMessage("add() was called");
    }
						
    function delete()
    {
        Lianja::showMessage("delete() was called again");
    }
						
    function first()
    {
        //Lianja::showMessage("first() was called");
    }
						
    function previous()
    {
        Lianja::showMessage("previous() was called");
    }
						
    function next()
    {
        Lianja::showMessage("next() was called");
    }
						
    function last()
    {
        Lianja::showMessage("last() was called");
    }
						
    function watch()
    {
        Lianja::showMessage("watch() was called");
    }
						
    function edit()
    {
        Lianja::showMessage("edit() was called");
    }
						
    function save()
    {
        //Lianja::showMessage("save() was called");
    }
						
    function cancel()
    {
        Lianja::showMessage("cancel() was called");
    }
						
    function refresh()
    {
    	;
    }
}

//--------------------------------------------------------------------------
// Note how the click() event handler for the Listbox is defined in PHP 
// just as a normal class method.
class myListbox extends Lianja
{
	function __construct()
	{
		parent::__construct("Listbox");
 	}
    
    function click()
    {
		// Important note. In PHP to access "outer variables" from within class 
		// methods you must declare then "global" and then specify "global" again
		// within the class method
        global $ui_grid;
        global $ui_listbox;

        $ui_grid->clear();  
        // note how the "additems" method of a "Grid", "Listbox" and "Combobox" can take 
        // a SQL SELECT statement as an argument
        if ($ui_listbox->text == "All")
        {
            $ui_grid->additems('select * from southwind!example where last_name != " "');
        }
        else
        { 
            $ui_grid->additems('select * from southwind!example where upper(left(last_name,1)) = "' . $ui_listbox->text . '"');
        }
        $ui_grid->refresh();
        Lianja::writeLog("clicked again");
    }
}

//--------------------------------------------------------------------------
// Step 2: create the "Section" object
$mysection = Lianja::createObject("mySection"); 

//--------------------------------------------------------------------------
// Step 3: create a "Pageframe" class and add it to the "Section"
$mysection->addObject("ui_tabs", "Pageframe");
      
//--------------------------------------------------------------------------
// Step 4: Add a "Page" to the "Pageframe" class and set some of its properties
$ui_tabs->addobject("ui_tab_customers", "Page");
$ui_tab_customers->caption = "Customers";
	
//--------------------------------------------------------------------------
// Step 5: Add a "Container" to the "Page" and set some of its properties
// the addobject() method takes the object name as the first arg then the class name as the second.
$ui_tab_customers->addobject("ui_cont", "Container"); 	
$ui_cont->autosize = 1;
$ui_cont->backcolor = "lightgray";
$ui_cont->layout = "horizontal";
$ui_cont->margin = 5;
$ui_cont->spacing = 5;
	 
//--------------------------------------------------------------------------
// Step 6: Add a "Listbox" to the "Container" and set some of its properties
$ui_cont->addobject("ui_listbox", "myListbox");
$ui_listbox->fixedwidth = 200; 

//--------------------------------------------------------------------------
// Step 7: Invoke the "Additems" method with a comma separated list of items to add to the Listbox
$ui_listbox->additems("All,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z");
	
//--------------------------------------------------------------------------
// Step 8: Add a "Grid" to the "Container"
$ui_cont->addobject("ui_grid", "Grid");
$ui_grid->rowheight = 20;
$ui_grid->readonly = 1;
$ui_grid->recordmark = 0;
$ui_grid->closable = 0;
$ui_grid->caption = "Sample data";
$ui_grid->additems('select * from southwind!example where last_name != " "');
$ui_grid->autofit( );
$ui_grid->show();

//--------------------------------------------------------------------------
// Step 9: Add a few more "Page" classes to the "Pageframe"
$ui_tabs->addobject("ui_tab_orders", "Page");
$ui_tab_orders->caption = "Orders";
$ui_tabs->addobject("ui_tab_shippers", "Page");
$ui_tab_shippers->caption = "Shippers";

//--------------------------------------------------------------------------
// Step 10: now we must return the section back to the Lianja. We accomplish this by assigning
// it to the global "returnvalue" variable.
$returnvalue = $mysection;

