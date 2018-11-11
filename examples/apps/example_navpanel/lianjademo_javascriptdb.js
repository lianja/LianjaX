//
// Lianja custom JavaScript section showing how to access the lianja database engine.
//
// if you just output html text the custom section is automatically rendered as a webview
//

// Notice how the output of the "print()" function will be redirected into the WebView section.

// You can write JavaScript libraries and load them like this:
// require_once("filename.js");

// todo: notice how you can tag items todo in your source files
// fixme: and also tag things that need fixed in your code

print("<html>");
print("<head>");
print("<style>");
print(".tablecaption { background: gray; font-weight: bold; color: white; height:26px; }");
print(".smallfont { font-size:small; }");
print("body { padding: 0px; margin: 0px; border: 1px solid lightgray; border-top: 1px solid white;}");
print("</style>");
print("</head>");
print("<body>");

// You can write to the console log like this
Lianja.writeLog("Generating JavaScript data report");

// open the southwind database (optional second argument is a "gateway connection string")
// in the format "servertype@nodename:login/password"
// 
// "servertype" can be any of the following: (requires Lianja server installed on "nodename")
// 
// 	MySQL  		(remote MySQL connections)
//	PostgreSQL 	(remote PostGreSQL connections)
//	Oracle 		(remote Oracle connections)
//	Recital 	(remote Recital connections)
//	ODBC 		(remote ODBC connections)
//
// "nodename" can be "localhost", "127.0.0.1" or any machine on the internet
db = Lianja.openDatabase("southwind");

// Open a recordset
rs = db.openRecordSet("select * from example");

// main table
print("<table cellpadding=\"5\">"); 
print("<caption class=\"tablecaption\">Example JavaScript Report</caption>");

// print table headings 
rs.movefirst(); 
print("<tr bgcolor=\"lightgray\" class=\"smallfont\">");
for (j=0; j<rs.fcount(); ++j)
{
	print("<th><font color=\"white\">" + rs.fields(j).name + "</font></th>");
}
print("</tr>");

// Traverse the recordset and write the output into the Webview section.
for (i=0; i<rs.reccount(); ++i)
{
	if ((i%2) == 0)
	{
    	rowcolor = "#f1f6fe";
    	altcolor = "#FFFFFF";
	}
	else
	{
		rowcolor = "#FFFFFF";        	
		altcolor = "#f1f6fe";
	}
 	print("<tr bgcolor=\"" + rowcolor + "\" color=\"darkgray\" class=\"smallfont\" valign=top>");
	for (j=0; j<rs.fcount(); ++j)
	{
		name = rs.fields(j).name;
		value = rs.fields(j).value;
		if (['LIMIT', 'AVAILABLE', 'BALANCE'].indexOf(name) >= 0)
		{
			print("<td align=right>$" + value.toFixed(2) + "</td>");
		}
		else
		{
			print("<td>" + value + "</td>");
		}
	}
	print("</tr>");
	rs.movenext(); 
}

// end of table
print("</table>");

// Close the recordset	
rs.close(); 

// end of report
print("<hr>Report complete at <b>" + new Date() + "</b>"); 

// Close off HTML tags
print("</body>");
print("</html>");
