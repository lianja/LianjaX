////////////////////////////////////////////////////////////////
// Event delegate for 'timer' event
function page1_section1_timer()
{
	var currentdate = new Date();
	gadget1_time.text = "Current time is " + 
                    lpad(""+currentdate.getHours(),2,'0') + ":" + 
                    lpad(""+currentdate.getMinutes(),2,'0') + ":" + 
                    lpad(""+currentdate.getSeconds(),2,'0');
}
