//
// Lianja custom JavaScript section "page1_section3"
//
oSection = createObject("oSection", "section");
oSection.addObject("oGrid", "grid");
oGrid.initObject( 
	{
		readonly: true,
		recordmark: false,
		hideheaders: true,
		columns: [ 
			{ caption: 'column1', controlsource: 'column1', backcolor: 'lightgreen'},
	    	{ caption: 'column2', controlsource: 'column2'}	
		]
	}
);
oGrid.click = function() { Lianja.writeOutput("click row: "+oGrid.activerow); };
oGrid.dblclick = function() { Lianja.writeOutput("dblclick row: "+oGrid.activerow); };
oGrid.setJSON([ { column1: 'hello', column2: 'world' }, {column1: 'hello', column2: 'again'} ]);
returnvalue = oSection;
