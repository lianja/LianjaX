#
# Lianja custom Python section showing how to access the lianja database engine.
#
# if you just output html text the custom section is automatically rendered as a webview.
#
# You can import any Python modules that you have on your system (Google Python API too)
#
# todo: notice how you can tag items todo in your source files
# fixme: and also tag things that need fixed in your code
#

import Lianja
import time

# Notice how the output of the "print" command will be redirected into the WebView section.
print "<html>"
print "<head>"
print "<style>"
print ".tablecaption { background: gray; font-weight: bold; color: white; height:26px; }"
print ".smallfont { font-size:small; }"
print "body { padding: 0px; margin: 0px; border: 1px solid lightgray; border-top: 1px solid white;}"
print "</style>"
print "</head>"
print "<body>"

# you can write to the console log like this
Lianja.writeLog("Generating Python data report")

# open the southwind database (optional second argument is a "gateway connection string")
# in the format "servertype@nodename:login/password"
# 
# "servertype" can be any of the following: (requires Lianja server installed on "nodename")
# 
# 	MySQL  		(remote MySQL connections)
#	PostgreSQL 	(remote PostGreSQL connections)
#	Oracle 		(remote Oracle connections)
#	Recital 	(remote Recital connections)
#	ODBC 		(remote ODBC connections)
#
# "nodename" can be "localhost", "127.0.0.1" or any machine on the internet
db = Lianja.openDatabase("southwind") 

# open a recordset
rs = db.openRecordSet("select * from example")

# main table
print "<table cellpadding=\"5\">"
print "<caption class=\"tablecaption\">Example Python Report</caption>"

# column headings
rs.movefirst()
print "<tr bgcolor=\"lightgray\" class=\"smallfont\">"
for j in range( rs.fcount() ):
	print "<th><font color=\"white\">" + rs.fields(j).name + "</font></th>"
print "</tr>"

# Traverse the recordset and write the output into the Webview section.
for i in range( rs.reccount() ):
	if ((i%2) == 0):
		rowcolor = "#f1f6fe"
		altcolor = "#FFFFFF"
	else:
		rowcolor = "#FFFFFF"       	
		altcolor = "#f1f6fe"
 	print "<tr bgcolor=\"" + rowcolor + "\" color=\"darkgray\" class=\"smallfont\" valign=top>"
	for j in range( rs.fcount() ):
		if rs.fields(j).name in [ "LIMIT", "BALANCE", "AVAILABLE" ]:
			print "<td align=right>$%.2f</td>" % rs.fields(j).value
		else:
			print "<td>%s</td>" % rs.fields(j).value
	print "</tr>"
	rs.movenext()

# end of table
print "</table>"

# Close the RecordSet	
rs.close() 

# End of report
print "<hr>Report complete at <b>" + time.asctime() + "</b>" 

# Close off HTML tags
print "</body>"
print "</html>"
 

