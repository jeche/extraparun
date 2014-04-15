var geocoder; //= new google.maps.Geocoder(); //To use later
var map; //Your map
var poly;
var markers = [];
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
  if ($('#route').data('route') != "") {
    drawRoute();
  }
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
    markers.push(marker);
    computeDistance();
} 

function drawRoute() {
  var routeString = $('#route').data('route');
  var numPoints = parseInt($('#route').data('numpoints'), 10);
  var path = poly.getPath();
  for (i = 0; i < numPoints; i++) {
    var points = routeString[i].replace(/[()]/g,''); 
    var pointsList = points.split(",");
    var myLatlng = new google.maps.LatLng(parseFloat(pointsList[0]),parseFloat(pointsList[1]));
    path.push(myLatlng);
    // Add a new marker at the new plotted point on the polyline.
    var marker = new google.maps.Marker({
      position: myLatlng,
      title: '#' + path.getLength(),
      map: map
   });

  }
}

// Sets the map on all markers in the array.
function setAllMap(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
}

function removeLine() {
  clearMarkers();
  markers.pop();
  var path = poly.getPath();
  path.pop();
  showMarkers();
  computeDistance();
}

function clearMarkers() {
  setAllMap(null);
}

// Shows any markers currently in the array.
function showMarkers() {
  setAllMap(map);
}

function computeDistance() {
    var meters = google.maps.geometry.spherical.computeLength(poly.getPath().getArray());
    var miles = Math.round(meters / 1000 * 0.6214 *10)/10; 
    $('#distance').val(miles);
}



$(document).ready ( function(){
    $('#remove').bind('click', function() { 
      removeLine();
    });

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
	$('#newRoute').val(poly.getPath().getArray());
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


