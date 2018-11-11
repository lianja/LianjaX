////////////////////////////////////////////////////////////////
// Event delegate for 'resized' event
function page1_section1_resized()
{
	var ht = Lianja.get("page1.section1").height;
	var TOP = 50;
	var HEIGHT = 140;
	var SPACING = 20;
	var MARGIN = 50;
	var NBUTTONS = 3;
	var GROUPHEIGHT = NBUTTONS * (HEIGHT+SPACING);
	var nexty;
		
	if (ht == 0) return;
	
	// Note that the object is created using the ID attribute of the UI element
	btn1.left = MARGIN;
	btn1.top = (ht - GROUPHEIGHT) / 2;
	btn1.right = MARGIN;
	btn1.height = HEIGHT;
	nexty = btn1.top + HEIGHT + SPACING;
	        
	btn2.left = MARGIN;
	btn2.top = nexty;
	btn2.right = MARGIN;
	btn2.height = HEIGHT;
	nexty = btn2.top + HEIGHT + SPACING;
	        
	btn3.left = MARGIN;
	btn3.top = nexty;
	btn3.right = MARGIN;
	btn3.height = HEIGHT;
};


