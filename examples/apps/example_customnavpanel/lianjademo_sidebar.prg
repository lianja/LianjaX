namespace lianjademo

//
// Lianja custom right sidebar gadget
//
define class lianjademo_sidebar as gadget  
	proc refresh()
		m_select = select()
		if select("orders") > 0 and select("customers") > 0
			select orders
			m_count = cntvalues(.t., customers->customerid)
		else
			m_count = 0
		endif
		if select("order_details") > 0 and m_count > 0
			select order_details
			m_total = sumvalues(order_details->unitprice*order_details->quantity)
			m_total = currency(m_total)
			m_min = minvalues(order_details->unitprice*order_details->quantity)
			m_min = currency(m_min)
			m_max = maxvalues(order_details->unitprice*order_details->quantity)
			m_max = currency(m_max)
		else
			m_total = 0
			m_min = 0
			m_max = 0
		endif
		select &m_select
		this.ui_webview.html = ;
			'<body style="background-color:#f9f9f9;padding:0px; overflow:hidden;font-size:small;">';
			+ '<div style="background-color:#f5f5f5;-webkit-border-radius:5px; border:1px solid lightgray; padding 0px; overflow:hidden;font-size:small;height:100%;">';
			+ '<table border=0px cellpadding="0px" cellspacing="0px" width="165px" height="100%">';
			+ '<tr style="font-size:small;">';
			+ '<td style="text-align:center;">';
	    	+ "<b><font color=darkgray>Total Orders</b></font><br/><font color=gray>&m_count</font><hr size=1px color=lightgray>";
			+ "</td>";
			+ "</tr>";
			+ '<tr style="font-size:small;">';
			+ '<td style="text-align:center;">';
	    	+ "<b><font color=darkgray>Min Order Value</b></font><br/><font color=gray>&m_min</font><hr size=1px color=lightgray>";
			+ "</td>";
			+ "</tr>";
			+ '<tr style="font-size:small;">';
			+ '<td style="text-align:center;">';
	    	+ "<b><font color=darkgray>Max Order Value</b></font><br/><font color=gray>&m_max</font><hr size=1px color=lightgray>";
			+ "</td>";
			+ "</tr>";
			+ '<tr style="font-size:small;">';
			+ '<td style="text-align:center;">';
	    	+ "<b><font color=darkgray>Total Order Value</b></font><br/><font color=gray>&m_total</font><br/>";
			+ "</td>";
			+ "</tr>";
			+ "</table>";
			+ "</div>";
			+ "</body>"
	endproc
enddefine

proc lianjademo_sidebar 
	gadget = createobject("lianjademo_sidebar")
	gadget.addObject("ui_webview", "webview")
return gadget


















