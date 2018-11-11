////////////////////////////////////////////////////////////////
// Event delegate for 'load' event
proc page1_load()
	public m_first
	m_first = .t.
	m_products = Lianja.getElementByID("SupList")
	if vartype(m_products) != 'O'
		return
	endif
	m_products.addItems("select companyname from customers")
	m_total = Lianja.getElementByID("ItemTotal")
	m_result = transform(0, "$99,999,999.00")
	m_total.value = str_replace("$.", "$0.", str_replace(" ", "", m_result))
endproc
