var geocoder; //= new google.maps.Geocoder(); //To use later
var map; //Your map
var poly;
function initialize() {
  geocoder = new google.maps.Geocoder();
  var mapOptions = {
    center: new google.maps.LatLng(-34.397, 150.644),
    zoom: 8
  };
  map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);

  var polyOptions = {
    strokeColor: '#000000',
    strokeOpacity: 1.0,
    strokeWeight: 3
  };
  poly = new google.maps.Polyline(polyOptions);
  poly.setMap(map);
  google.maps.event.addListener(map, 'click', addLatLng);
}

function addLatLng(event) {

    var path = poly.getPath();
    path.push(event.latLng);
    // Add a new marker at the new plotted point on the polyline.
    var marker = new google.maps.Marker({
      position: event.latLng,
      title: '#' + path.getLength(),
      map: map
   });
} 

$(document).ready ( function(){
   $('#zipcode').bind('input', function() { 
    	zipcode = $(this).val(); // get the current value of the input field.
    	if (zipcode.length == 5) {
    		geocoder.geocode( { 'address': zipcode}, function(results, status) {
      		if (status == google.maps.GeocoderStatus.OK) {
		        //Got result, center the map and put it out there
		        map.setCenter(results[0].geometry.location);
		      } else {
		        alert("Geocode was not successful for the following reason: " + status);
		      }
		    });
    	}
	});
});


function getMapData() {
	$('#route').val(poly.getPath().getArray());
    var dist = google.maps.geometry.spherical.computeLength(poly.getPath().getArray());
    alert(dist);
	$('#distance').val(dist);
}

function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&' +
      'callback=initialize';
  document.body.appendChild(script);
}

$(document).ready(loadScript);
$(document).on("page:load", loadScript);


