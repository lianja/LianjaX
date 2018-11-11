////////////////////////////////////////////////////////////////
// Event delegate for 'custommenu' event
function page1_section1_custommenu(caption)
{
	// Register a new user 
	if (caption == "Register")
	{
		// serialize the Canvas section as a JSON object
		var data = Lianja.get("page1.section1").getJSON();
		// base64 encode the JSON object 
		var b64data = base64_encode(data);
		// call the server-side procedure that handles user registration
		var result = Lianja.evaluate("registeruser('" + b64data + "')");
		if (result == "Ok")
		{
			Lianja.showSuccessMessage("Added new user successfully.", "User Registration");
		}
		else
		{
			Lianja.showErrorMessage(result, "User Registration Failed", "User Registration");
		}
	}
	// Reset the Canvas section fields
	else if (caption == "Reset")
	{
		Lianja.get("page1.section1").clear();
	}
}
