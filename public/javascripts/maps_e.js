var centerLatitude = 49.830896; 
var centerLongitude = 15.375366; 
var startZoom = 7;
 
var map;
 
function init() 
{ 
	if (GBrowserIsCompatible()) { 
		map = new GMap2(document.getElementById("map"));
		map.addControl(new GMapTypeControl());
		map.addControl(new GLargeMapControl()); 
		map.setCenter(new GLatLng(centerLatitude, centerLongitude), startZoom, G_HYBRID_MAP);
		var options = {
				onMarkersSetCallback : function(){ map.setZoom(17); }      
		};
				      
		var options1 = {
            
      	searchFormHint : document.getElementById("poloha").innerHTML
    };      
				
		map.addControl(new google.maps.LocalSearch(options1, options));
		//var searchControl = new google.maps.LocalSearch(options1, options);
    //map.addControl(searchControl);
	
    
		if(marker != undefined)//marker uz je
		{
			addMarker(marker.latitude, marker.longitude, marker.name);
			
		}else{//marker neni
		
				GEvent.addListener(map, "click", function(overlay, latlng) { 
					var marker = new GMarker(latlng, {draggable: true}); 
					map.addOverlay(marker);
					document.getElementById("employer_lng").value = marker.getLatLng().lng();
					document.getElementById("employer_lat").value = marker.getLatLng().lat();
					GEvent.addListener(marker, 'dragend', 
										function() { 
												document.getElementById("employer_lng").value = marker.getLatLng().lng();
              					document.getElementById("employer_lat").value = marker.getLatLng().lat();
													} 
								);
										
				});
						
		} 
	}
}		


function addMarker(latitude, longitude, name) 
{ 
	var marker = new GMarker(new GLatLng(latitude, longitude),{draggable: true});
	map.setCenter(new GLatLng(latitude, longitude), 17, G_NORMAL_MAP); 
	GEvent.addListener(marker, 'click', 
						function() { 
							marker.openInfoWindowHtml(name); 
							} 
						);
	GEvent.addListener(marker, 'dragend', 
						function() { 
								document.getElementById("employer_lng").value = marker.getLatLng().lng();
      					document.getElementById("employer_lat").value = marker.getLatLng().lat();
									} 
							);					 
	map.addOverlay(marker); 
}



window.onload = init;
window.onunload = GUnload;