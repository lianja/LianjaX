////////////////////////////////////////////////////////////////
// Event delegate for 'click' event
function page1_section1_field2_click()
{
	var result = Lianja.evaluate("mylib::getText()");
	field1.text = result;
};


////////////////////////////////////////////////////////////////
// Event delegate for 'click' event
function page1_section1_field4_click()
{
	var result = Lianja.evaluateJavaScript("myfunc()");
	field3.text = result;
};

