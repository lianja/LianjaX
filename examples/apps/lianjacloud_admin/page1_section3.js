//
// Lianja custom JavaScript section "page1_section3"
//
oSection = createobject("oSection", "section");
oSection.addObject("oCont", "container");
oCont.layout = "grid";
oCont.backcolor = "white";
oCont.addObject("oCont_top", "container", 0, 0, 1, 3);
oCont_top.layout = "horizontal";
oCont_top.margin = 5;
oCont_top.addObject("oSystemOverview", "container");
oCont_top.addObject("oActiveUsers", "container");
oSystemOverview.backcolor = "white";
oSystemOverview.bordercolor = "lightgray";
oSystemOverview.margin = 5;
oSystemOverview.borderright = 1;
oSystemOverview.layout = "vertical";
oSystemOverview.width = "60%";
oActiveUsers.backcolor = "white";
oActiveUsers.width = "40%";
oCont.addObject("oCont_bottom", "container", 1, 0, 1, 3);
oCont_bottom.layout = "horizontal";
oCont_bottom.margin = 5;
oCont_bottom.bordertop = 1;
oCont_bottom.bordercolor = "lightgray";
oCont_bottom.backcolor = "white";
oCont_bottom.addObject("oVolumeStatus", "container");
oCont_bottom.addObject("oSystemStatistics", "container");
oVolumeStatus.backcolor = "white";
oVolumeStatus.margin = 5;
oVolumeStatus.borderright = 1;
oVolumeStatus.bordercolor = "lightgray";
oSystemStatistics.backcolor = "white";
oVolumeStatus.width = "40%";
oSystemStatistics.width = "60%";

// oSystemOverview
oSystemOverview.addObject("oSystemOverview_title", "label");
oSystemOverview_title.fixedheight = 40;
oSystemOverview_title.caption = "System Overview";
oSystemOverview_title.forecolor = "gray";
oSystemOverview_title.alignment = "left";
oSystemOverview_title.fontsize = "large";

var connections = Lianja.evaluate("sysinfo('connections')");
var maxconnections = Lianja.evaluate("sysinfo('maxconnections'");
var imaxconnections = maxconnections;
if (maxconnections == 0) 
{
	maxconnections = "50";
	imaxconnections = 50;
}
oSystemOverview.addObject("oSystemOverview_count", "label");
oSystemOverview_count.forecolor = "gray";
oSystemOverview_count.caption = "<font size='6'>" + connections + "</font><font size='5'> / " + maxconnections + "</font>&nbsp;&nbsp;User Connections";
oSystemOverview_count.fixedheight = 40;
oSystemOverview_count.alignment = "left";

oSystemOverview.addObject("oSystemOverview_hbar", "container");
oSystemOverview_hbar.fixedheight = 20;
oSystemOverview_hbar.backcolor = "white";
oSystemOverview_hbar.layout = "horizontal";
oSystemOverview_hbar.marginright = 15;

oSystemOverview_hbar.addObject("oSystemOverview_active", "label");
oSystemOverview_active.backcolor = "lightblue";

oSystemOverview_hbar.addObject("oSystemOverview_available", "label");
oSystemOverview_available.backcolor = "lightgray";

oSystemOverview_hbar.setStretchFactor(0,connections);
oSystemOverview_hbar.setStretchFactor(1,imaxconnections-connections);

oSystemOverview.addObject("oSystemOverview_details", "container");
oSystemOverview_details.layout = "H";
oSystemOverview_details.margintop = 20;
oSystemOverview_details.addObject("oSystemOverview_details1", "container");
//oSystemOverview_details.addObject("oSystemOverview_details2", "container");
oSystemOverview_details.addObject("oSystemOverview_details3", "container");

oSystemOverview_details1.layout = "V";
//oSystemOverview_details2.layout = "V";
oSystemOverview_details3.layout = "V";

oSystemOverview_details1.addObject("details1_hostname", "label");
details1_hostname.caption = "Host Name";
details1_hostname.forecolor = "gray";
details1_hostname.alignment = "left";
oSystemOverview_details1.addObject("details1_hostname_value", "label");
details1_hostname_value.caption = Lianja.evaluate('getLocalHost()');
details1_hostname_value.forecolor = "black";
details1_hostname_value.alignment = "left";

oSystemOverview_details1.addObject("details1_ip", "label");
details1_ip.caption = "Server IP Address";
details1_ip.forecolor = "gray";
details1_ip.alignment = "left";
oSystemOverview_details1.addObject("details1_ip_value", "label");
details1_ip_value.caption = Lianja.evaluate('sysinfo("serverip")');
details1_ip_value.forecolor = "black";
details1_ip_value.alignment = "left";

oSystemOverview_details1.addObject("details1_version", "label");
details1_version.caption = "Lianja Cloud Version";
details1_version.forecolor = "gray";
details1_version.alignment = "left";
oSystemOverview_details1.addObject("details1_version_value", "label");
details1_version_value.caption = Lianja.evaluate('version(4)');
details1_version_value.forecolor = "black";
details1_version_value.alignment = "left";

//oSystemOverview_details2.addObject("details2_instanceid", "label");
//details2_instanceid.caption = "Instance ID";
//details2_instanceid.forecolor = "gray";
//details2_instanceid.alignment = "left";
//oSystemOverview_details2.addObject("details2_instanceid_value", "label");
//details2_instanceid_value.caption = "xxx";
//details2_instanceid_value.forecolor = "black";
//details2_instanceid_value.alignment = "left";
//
//oSystemOverview_details2.addObject("details2_instancetype", "label");
//details2_instancetype.caption = "Instance Type";
//details2_instancetype.forecolor = "gray";
//details2_instancetype.alignment = "left";
//oSystemOverview_details2.addObject("details2_instancetype_value", "label");
//details2_instancetype_value.caption = "xxx";
//details2_instancetype_value.forecolor = "black";
//details2_instancetype_value.alignment = "left";
//
//oSystemOverview_details2.addObject("details2_osinfo", "label");
//details2_osinfo.caption = "OS / Memory";
//details2_osinfo.forecolor = "gray";
//details2_osinfo.alignment = "left";
//oSystemOverview_details2.addObject("details2_osinfo_value", "label");
//details2_osinfo_value.caption = "xxx";
//details2_osinfo_value.forecolor = "black";
//details2_osinfo_value.alignment = "left";

var tenancy = Lianja.evaluate("getenv('DB_TENANCY')");
if (tenancy.length == 0) tenancy = "public";
oSystemOverview_details3.addObject("details3_tenancy", "label");
details3_tenancy.caption = "Tenancy";
details3_tenancy.forecolor = "gray";
details3_tenancy.alignment = "left";
oSystemOverview_details3.addObject("details3_tenancy_value", "label");
details3_tenancy_value.caption = tenancy;
details3_tenancy_value.forecolor = "black";
details3_tenancy_value.alignment = "left";

oSystemOverview_details3.addObject("details3_additional1", "label");
details3_additional1.caption = "OS";
details3_additional1.forecolor = "gray";
details3_additional1.alignment = "left";
oSystemOverview_details3.addObject("details3_additional1_value", "label");
details3_additional1_value.caption = Lianja.evaluate('sysinfo("osversion")');
details3_additional1_value.forecolor = "black";
details3_additional1_value.alignment = "left";

oSystemOverview_details3.addObject("details3_additional2", "label");
details3_additional2.caption = "Memory / Used";
details3_additional2.forecolor = "gray";
details3_additional2.alignment = "left";
oSystemOverview_details3.addObject("details3_additional2_value", "label");
details3_additional2_value.caption = Lianja.evaluate('sysinfo("totalmemory")') + " / " + Lianja.evaluate('sysinfo("usedmemorypercent")') + "%";
details3_additional2_value.forecolor = "black";
details3_additional2_value.alignment = "left";

oSystemOverview.addObject("oSystemOverview_stetch", "label");

returnvalue = osection;
