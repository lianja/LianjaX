para p_customerid

private m_count2009 = 0
private m_count2010 = 0
private m_count2011 = 0

if not isServer()
	// if tables not yet open just return
	if not used("customers") or not used("orders")
		return "0,0,0"
	endif
	// save data context
	save recordview
else
	if empty("p_customerid")
		return "0,0,0"
	endif	
	open database southwind
	use orders order customerid in 0
	use customers order customerid in 0 current
	seek p_customerid
	if not found()
		return "0,0,0"
	endif		
endif

// count all orders for the current customer
select orders
m_count2009 = cntvalues(year(orderdate)=2009, customers.customerid)
m_count2010 = cntvalues(year(orderdate)=2010, customers.customerid)
m_count2011 = cntvalues(year(orderdate)=2011, customers.customerid)

if not isServer()
	// restore data context
	restore recordview
endif

// format the result and return it to be substituted into the google charts uri
return alltrim(str(m_count2009)) + "," + alltrim(str(m_count2010)) + "," + alltrim(str(m_count2011))
