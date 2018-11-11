////////////////////////////////////////////////////////////////
// Event delegate for 'header' event
proc Client_Credit_Manager_all_section1_header()
	local m_libpath = libPath()
	? "<table cellspacing='10' style='background-color:white;height:100px;text-align:center;vertical-align:middle;width:100%;'>"
	? "<tr>"
	? "<td style='border:1px solid lightgray;border-radius:5px;width:50%;padding:5px;text-align:left;vertical-align:top;'>"
	? "<table>"
	? "<tr>"
	? "<td style='text-align:left;vertical-align:top;'>"
	? "<img src='&m_libpath/images/lianja512.png' style='width:80px;height:80px;'/>"
	? "</td>"
	? "<td>"
	? "<b>Lianja Inc</b><br>35 Village Road<br>Suite 100<br>Middleton<br>MA 01949<br>USA"
	? "</td>"
	? "</tr>"
	? "</table>"
	? "</td>"
	? "<td style='border:1px solid lightgray;border-radius:5px;text-align:left;width:50%;padding:5px;vertical-align:top;'>"
	? "<b>CLIENT CREDIT LIST</b><br>"
	? "User: " + username() + "<br>"
	? "Date: " + etos(date()) + "<br>"
	? "Time: " + time() + "<br>"
	? "</td>"
	? "</tr>"
	? "</table>"
endproc


////////////////////////////////////////////////////////////////
// Event delegate for 'footer' event
proc Client_Credit_Manager_all_section1_footer()
	? "<center><hr size='1' style='background:lightgray;width:80%;'/></center>"
	? "<br><center>This report was generated on " + etos(date()) + " at " + time() + " for " + username() + "</center>"
endproc
