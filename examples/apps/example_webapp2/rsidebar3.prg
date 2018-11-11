para p_customerid

private m_total2009 = 0
private m_total2010 = 0
private m_total2011 = 0

procedure calcTotals
	m_total2009 = m_total2009 + sumvalues(unitprice*quantity-discount, year(orders.orderdate)=2009)
	m_total2010 = m_total2010 + sumvalues(unitprice*quantity-discount, year(orders.orderdate)=2010)
	m_total2011 = m_total2011 + sumvalues(unitprice*quantity-discount, year(orders.orderdate)=2011)
endproc

if not isServer()
	// if tables not yet open just return
	if not used("order_details") or not used("orders") or not used("customers")
		return "0,0,0"
	endif
	// save data context
	save recordview
	p_customerid = customers.customerid
else
	if empty("p_customerid")
		return "0,0,0"
	endif	
	open database southwind
	use order_details order orderid in 0
	use orders order customerid in 0 current	
endif
	
// foreach order lookup the order details and total them up
select orders
seek p_customerid
scan rest while customerid = p_customerid
	select order_details
	seek orders.orderid
	calctotals()
	select orders
endscan

if not isServer()
	// restore data context
	restore recordview 
endif

// format the result and return it to be substituted into the google charts uri
return alltrim(str(m_total2009)) + "," + alltrim(str(m_total2010)) + "," + alltrim(str(m_total2011))
