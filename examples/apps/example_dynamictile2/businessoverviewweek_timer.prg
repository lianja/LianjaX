////////////////////////////////////////////////////////////////
// Event delegate for 'timer' event which updates a dynamic tile
// in the App Center.
//
// This script can generate HTML output or just output a URL
// which will be rendered by an AJAX call inside the App Center.
//
// You can write this in any of the supported scripting languages.
//
private m_data
private m_url

// Generate some ramdom data values for google chart that will be
// displayed as the dynamic tile contents
//
// This script would typically query data and calculate what to display
//

m_data = tostring(max(10, int(rand(-1, .f.))%100) ) + ","
m_data = m_data + tostring(max(10, int(rand(-1, .f.))%100) ) + ","
m_data = m_data + tostring(max(10, int(rand(-1, .f.))%100) ) + ","
m_data = m_data + tostring(max(10, int(rand(-1, .f.))%100) ) + ","
m_data = m_data + tostring(max(10, int(rand(-1, .f.))%100) ) + ","
m_data = m_data + tostring(max(10, int(rand(-1, .f.))%100) ) + ","
m_data = m_data + tostring(max(10, int(rand(-1, .f.))%100) ) 
m_data = m_data + "|"
m_data = m_data + tostring(max(10, int(rand(-1, .f.))%100) ) + ","
m_data = m_data + tostring(max(10, int(rand(-1, .f.))%100) ) + ","
m_data = m_data + tostring(max(10, int(rand(-1, .f.))%100) ) + ","
m_data = m_data + tostring(max(10, int(rand(-1, .f.))%100) ) + ","
m_data = m_data + tostring(max(10, int(rand(-1, .f.))%100) ) + ","
m_data = m_data + tostring(max(10, int(rand(-1, .f.))%100) ) + ","
m_data = m_data + tostring(max(10, int(rand(-1, .f.))%100) ) 

// Note the prefix of urlimg: which causes Lianja to render the URL using image without
// any flickering as the image is changed in the Tile
//
m_url = "urlimg::http://chart.googleapis.com/chart?chxt=y&chbh=a&chs=310x310&cht=bvg&chco=A2C180,3D7930&chd=t:"
m_url = m_url + "&m_data"
m_url = m_url + "&chtt=Product+sales+by+month"
? m_url
