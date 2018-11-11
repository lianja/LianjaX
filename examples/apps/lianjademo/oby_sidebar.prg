//
// Counts the number of orders for the current customer using fast navigational data access
//
// This procedure is embedded in the google charts uri in the right sidebar content #1 as {oby_sidebar()}
// 
// Note that you can embed any custom code into any uri (webview etc) by enclosing any expression in { } tags.
// 
// todo: notice how you can tag items todo in your source files
// fixme: and also tag things that need fixed in your code 
//
private m_count2009 = 0
private m_count2010 = 0
private m_count2011 = 0

// if tables not yet open just return
if select("customers") = 0 or select("orders") = 0
	return "0,0,0"
endif

// save data context
save recordview

// count all orders for the current customer
select orders
m_count2009 = cntvalues(year(orderdate)=2009, customers->customerid)
m_count2010 = cntvalues(year(orderdate)=2010, customers->customerid)
m_count2011 = cntvalues(year(orderdate)=2011, customers->customerid)

// restore data context
restore recordview

// format the result and return it to be substituted into the google charts uri
return alltrim(str(m_count2009)) + "," + alltrim(str(m_count2010)) + "," + alltrim(str(m_count2011))
