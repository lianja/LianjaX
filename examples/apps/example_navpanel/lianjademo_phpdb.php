// Lianja custom PHP section showing how to access the lianja database engine.
//
// if you just output html text the custom section is automatically rendered as a webview
//
// Notice how the output of the "echo" command will be redirected into the WebView section.
//
// todo: notice how you can tag items todo in your source files
// fixme: and also tag things that need fixed in your code

echo "<html>";
echo "<head>";
echo "<style>";
echo ".tablecaption { background: gray; font-weight: bold; color: white; height:26px; }";
echo ".smallfont { font-size:small; }";
echo "body { padding: 0px; margin: 0px; border: 1px solid lightgray; border-top: 1px solid white;}";
echo "</style>";
echo "</head>";
echo "<body>"; 

// You can write to the console log like this
Lianja::writeLog("Generating PHP data report");

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
$db = Lianja::openDatabase("southwind");

// Open a recordset
$rs = $db->openRecordSet("select * from example"); 

// main table
echo "<table cellpadding='5'>"; 
echo "<caption class='tablecaption'>Example PHP Report</caption>";

// print table headings 
$rs->movefirst(); 

echo "<tr bgcolor='lightgray' class='smallfont'>";
for ($j=0; $j<$rs->fcount(); ++$j) 
{
	echo "<th><font color='white'>" . $rs->fields($j)->name . "</font></th>";
}
echo "</tr>";


// Traverse the recordset and write the output into the Webview section.
for ($i=0; $i<$rs->reccount(); ++$i)
{
	if (($i%2) == 0)
	{
    	$rowcolor = "#f1f6fe";
    	$altcolor = "#FFFFFF";
	}
	else
	{
		$rowcolor = "#FFFFFF";        	
		$altcolor = "#f1f6fe";
	}
 	echo "<tr bgcolor='" . $rowcolor . "' color='darkgray' class='smallfont' valign=top>";
	for ($j=0; $j<$rs->fcount(); ++$j)
	{
		$name = $rs->fields($j)->name;
		$value = $rs->fields($j)->value;
		if (in_array($name, array('LIMIT', 'AVAILABLE', 'BALANCE')))
		{
			echo "<td align=right>$" . sprintf("%-8.2f", $value) . "</td>";
		}
		else
		{
			echo "<td>" . $value . "</td>";
		}
	}
	echo "</tr>";
	$rs->movenext(); 
}

// end of table
echo "</table>";


// Close the recordset	
$rs->close(); 

// end of report
echo "<hr>Report complete at <b>" . date("r", time()) . "</b>"; 

// Close off HTML tags
echo "</body>";
echo "</html>";


