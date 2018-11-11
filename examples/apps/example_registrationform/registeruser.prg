//
// New user registation server-side procedure.
//
// Client call:
// 		Lianja.evaluate("registeruser( data )")
//
// Returns:
//		"Ok" on success
//  	error message on failure
//
lparameter m_data
local m_objdata
local m_exists
local m_exclusive

// data is sent base64 encoded so need to decode it
m_data = base64_decode(m_data)

// the data is a serialized JSON encoded object shared between the client and the server
m_objdata = json_decode(m_data)

// The 'objdata' properties correspond to the 'Name' for each field in the form
if not isServer()
	? m_objdata
endif

// validate the form data
if len(alltrim(m_objdata.m_reg_name))==0
	return "You must specify a Name"
endif
if len(alltrim(m_objdata.m_reg_username))==0
	return "You must specify a Username"
endif
if len(alltrim(m_objdata.m_reg_email))==0
	return "You must specify a contact E-mail"
endif
if len(alltrim(m_objdata.m_reg_password))==0
	return "You must specify a Password"
endif
if alltrim(m_objdata.m_reg_password)!=alltrim(m_objdata.m_reg_confirm_password)
	return "Passwords do not match"
endif

// now make sure the user does not already exist in system!sysroles table
m_username = sqllookup("system!sysroles", "username", "'" + m_objdata.m_reg_username + "'", "username", "''")
if len(m_username)>0
	return "The username already exists"
endif

if len(alltrim(m_objdata.m_reg_tenancy))=0
	m_objdata.m_reg_tenancy = "*"
endif

if not columnexists('system', 'sysroles', 'name')
	m_exclusive = set("exclusive")
	set exclusive on
	alter table system!sysroles add column name char(80)
    alter table system!sysroles move (name,2)
    set exclusive &m_exclusive
endif

// now add the new user to system!sysroles table
insert into system!sysroles;
	(name,username,email,password,domain,roles);
 	values(m_objdata.m_reg_name,m_objdata.m_reg_username, m_objdata.m_reg_email, md5(m_objdata.m_reg_password), m_objdata.m_reg_tenancy, m_objdata.m_reg_roles)

return "Ok"
