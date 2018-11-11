namespace lianjademo

////////////////////////////////////////////////////////////////
// Event delegate for 'timer' event
if type("m_timer_count")='N'
    m_timer_count = m_timer_count + 1
else
	public m_timer_count
	m_timer_count = 1
endif
? "<h2><font color='black'>Lianja Demo App</font></h2>"
? "Author: Lianja Inc.<br>"
? "Tiles can contain live content<br>"
? "Time is now " + time() + "<hr>"
? "Click the tile to run the demo App<lianja:notifications='" + etos(m_timer_count) + "'>"
? replicate("<br>", 4)