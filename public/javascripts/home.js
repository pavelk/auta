var centerLatitude = 49.830896; 
var centerLongitude = 15.375366; 
var startZoom = 7;
 
var map;

var countryCenter = new Array();
  countryCenter["all"] = new GLatLng(49.830896, 15.375366);
  countryCenter["1-stredocesky"] = new GLatLng(50.087919,14.420478);
  countryCenter["2-karlovarsky"] = new GLatLng(50.23138026981443,12.874603271484375);
  countryCenter["3-ustecky"] = new GLatLng(50.66119967688815,14.039154052734375);
  countryCenter["4-liberecky"] = new GLatLng(50.76337625140439,15.064315795898438);
  countryCenter["5-kralovehradecky"] = new GLatLng(50.20545809933085,15.82855224609375);
  countryCenter["6-pardubicky"] = new GLatLng(50.03198947731998,15.7818603515625);
  countryCenter["7-jihomoravsky"] = new GLatLng(49.18167347271706,16.629180908203125);
  countryCenter["8-olomoucky"] = new GLatLng(49.59558,17.258835);
  countryCenter["9-zlinsky"] = new GLatLng(49.221634,17.675629);
  countryCenter["10-ostravsky"] = new GLatLng(49.841525,18.304596);
  countryCenter["11-vysocina"] = new GLatLng(49.39576641148391,15.5841064453125);
  countryCenter["12-jihocesky"] = new GLatLng(48.97387,14.474946);
  countryCenter["13-praha"] = new GLatLng(50.087919,14.420478);
  countryCenter["14-plzensky"] = new GLatLng(49.747485,13.377604);
  
function init() 
{ 
	if (GBrowserIsCompatible()) 
	{ 
		map = new GMap2(document.getElementById("map"));
		map.addControl(new GMapTypeControl());
		map.addControl(new GLargeMapControl());
		map.addControl(new GOverviewMapControl()); 
		map.setCenter(new GLatLng(centerLatitude, centerLongitude), startZoom, G_HYBRID_MAP);
		listMarkers('schools');
	}	
}

function listMarkers(value) 
{ 
  if(value == 'schools')
  {
    //document.getElementById("slider_in_ul").style.display = "block";
    var icon = "school";
  }else{
    //document.getElementById("slider_in_ul").style.display = "none";
    var icon = "emp";    
  }  
    
  var request = GXmlHttp.create(); 
  request.open('GET', 'home/markers?type='+value, true); 
  request.onreadystatechange = function() 
  { 
    if (request.readyState == 4) 
    { 
      map.clearOverlays();
      markers = eval( "(" + request.responseText + ")" ); 
      for (var i = 0 ; i < markers.length ; i++) 
      { 
        if(value == 'schools')
        {
        var marker = markers[i].school; 
        }else{
        var marker = markers[i].employer;
        }
        var lat = marker.lat; 
        var lng = marker.lng; 
        if (lat && lng) 
        { 
          var latlng = new GLatLng(parseFloat(lat),parseFloat(lng)); 
          if(value == 'schools')
          {
            var html = '<div><b>Název:</b>' 
            + marker.name 
            + '</div><div>'
            + '<a href=\"/skola/'+ marker.id  +'\"><b>Detail</b></a>'   
            + '</div>';
            
          }else{
            var html = '<div><b>Název:</b>' 
            + marker.name 
            + '</div><div>'
            + '<a href=\"/zamestnavatel/'+ marker.id  +'\"><b>Detail</b></a>'   
            + '</div>';
          }  

          var marker = addMarkerToMap(latlng, html, icon); 
          map.addOverlay(marker); 
        }
      } 
    } 
  } 
  request.send(null); 
}

function filterGraduation(grad)
{
	var request = GXmlHttp.create(); 
	request.open('GET', "home/markers_graduation?section="+grad, true);
	
	request.onreadystatechange = function() 
	  { 
	    if (request.readyState == 4) 
	    { 
	      map.clearOverlays();
	      markers = eval( "(" + request.responseText + ")" ); 
	      for (var i = 0 ; i < markers.length ; i++) 
	      { 
	        var marker = markers[i].school; 
	        var lat = marker.lat; 
	        var lng = marker.lng; 
	        if (lat && lng) 
	        { 
	          var latlng = new GLatLng(parseFloat(lat),parseFloat(lng)); 
	          var html = '<div><b>Název:</b>' 
	          + marker.name 
	          + '</div><div>'
	          + '<a href=\"/schools/'+ marker.id  +'\"><b>Detail</b></a>' 
	          + '</div>';
	          var marker = addMarkerToMap(latlng, html, "school"); 
	          map.addOverlay(marker); 
	        }
	      } 
	    } 
	  } 
	  request.send(null);
	
}

function filterSection(section)
{
  document.getElementById("filter_display_schools").checked = "checked";
  var request = GXmlHttp.create(); 
  request.open('GET', "home/markers_section?section="+section, true); 
  request.onreadystatechange = function() 
  { 
    if (request.readyState == 4) 
    { 
      map.clearOverlays();
      markers = eval( "(" + request.responseText + ")" ); 
      for (var i = 0 ; i < markers.length ; i++) 
      { 
        var marker = markers[i].school; 
        var lat = marker.lat; 
        var lng = marker.lng; 
        if (lat && lng) 
        { 
          var latlng = new GLatLng(parseFloat(lat),parseFloat(lng)); 
          var html = '<div><b>Název:</b>' 
          + marker.name 
          + '</div><div>'
          + '<a href=\"/schools/'+ marker.id  +'\"><b>Detail</b></a>' 
          + '</div>';
          var marker = addMarkerToMap(latlng, html, "school"); 
          map.addOverlay(marker); 
        }
      } 
    } 
  } 
  request.send(null);
  
}

function clickType(value)
{
 listMarkers(value); 
  
}
    

function addMarkerToMap(latlng, html, ic) 
{ 
  
  var opt = new Object();
  
  // Skoly
  var schoolIcon = new GIcon(G_DEFAULT_ICON);
  schoolIcon.image = "http://www.autanasbavi.cz/images/icofirmy.png";
  schoolIcon.shadow = "";
  schoolIcon.iconSize = new GSize(22, 34);

  // Zamestnavatele
  var empIcon = new GIcon(G_DEFAULT_ICON);
  empIcon.image = "http://www.autanasbavi.cz/images/icoauta.png";
  empIcon.shadow = "";
  empIcon.iconSize = new GSize(22, 34);
  
  if(ic == "school")
  {
    opt.icon = schoolIcon;
  }else{
    opt.icon = empIcon;
  }    
  
  var marker = new GMarker(latlng, opt);
  
  
  GEvent.addListener(marker, 'click', function() 
  { 
    var markerHTML = html; 
    marker.openInfoWindowHtml(markerHTML); 
  }); 
  return marker; 
}

function clickCountry(country) 
{ 
  if (countryCenter[country]) 
  {
      if(country == 'all')
      {
        map.setZoom(7);
      }else{
        map.setZoom(9);
      }
      map.panTo(countryCenter[country]);
  }
  if (country == currentCenter) { return; }
  currentCenter = country;
}



google.setOnLoadCallback(init);
//window.onload = init;
window.onunload = GUnload;