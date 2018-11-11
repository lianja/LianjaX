//
// Sums up the orders for the current customer using fast navigational data access
//
// This procedure is embedded in the google charts uri in the right sidebar content #2 as {orevenue_sidebar()}
// 
// Note that you can embed any custom code into any uri (webview etc) by enclosing any expression in { } tags.
//
// todo: notice how you can tag items todo in your source files
// fixme: and also tag things that need fixed in your code
//
private m_total2009 = 0
private m_total2010 = 0
private m_total2011 = 0

// 
// procedure to sum the order_detail amounts
//
// Note the use of sumvalues() which sums up the given expression for all occurrences of 
// the the current key. 
// 
// These additional functions with the same arguments perform other aggregate functions on data:
//
// sumvalues(expression as numeric [, filter as logical, [key as character|numeric|date [, tag as character] ] )
// avgvalues(expression as numeric [, filter as logical, [key as character|numeric|date [, tag as character] ] )
// minvalues(expression as numeric [, filter as logical, [key as character|numeric|date [, tag as character] ] )
// maxvalues(expression as numeric [, filter as logical, [key as character|numeric|date [, tag as character] ] )
// cntvalues(filter as logical, [key as character|numeric|date [, tag as character] ] )
// allvalues(expression as numeric [, filter as logical, [key as character|numeric|date [, tag as character] ] )
//
// For external data sources connected via a gateway you can also use the sqlvalues() function.
// e.g.
//
// set gateway to "mysql@127.0.0.1:username/password-mydatabasename"
// cresult = sqlvalues("SELECT sum(amount),sum(cost),sum(quantity) WHERE year(orderdate)=2009")
// set gateway to
//
procedure calcTotals
	m_total2009 = m_total2009 + sumvalues(order_details->unitprice*order_details->quantity, year(orders->orderdate)=2009)
	m_total2010 = m_total2010 + sumvalues(order_details->unitprice*order_details->quantity, year(orders->orderdate)=2010)
	m_total2011 = m_total2011 + sumvalues(order_details->unitprice*order_details->quantity, year(orders->orderdate)=2011)
endproc

// if tables not yet open just return zeros
if select("order_details") = 0 or select("orders") = 0
	return "0,0,0"
endif

// save data context
save recordview 

// foreach order lookup the order details and total them up
select orders
seek customers->customerid
scan rest while customerid = customers->customerid
	select order_details
	seek orders->orderid
	calctotals()
	select orders
endscan

// restore data context
restore recordview 

// format the result and return it to be substituted into the google charts uri
return alltrim(str(m_total2009)) + "," + alltrim(str(m_total2010)) + "," + alltrim(str(m_total2011))
