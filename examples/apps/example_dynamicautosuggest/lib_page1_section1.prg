////////////////////////////////////////////////////////////////
// Event delegate for 'interactivechange' event
proc page1_section1_field3_interactivechange()
	m_field = Lianja.get("page1.section1.field3")
	if len(m_field.value)!=0
		m_sql = "select last_name from example where last_name like '" + m_field.value + "%'"
	else
		m_sql = ""
	endif
	m_field.autosuggest = m_sql
endproc
