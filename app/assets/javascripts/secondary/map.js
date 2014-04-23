var elevator;
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

  // Create an ElevationService
  elevator = new google.maps.ElevationService();

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


function getMapData() {
  $('#newRoute').val(poly.getPath().getArray());
  var pathRequest = {
    'path': poly.getPath().getArray(),
    'samples': Math.round($('#distance').val()) * 3
  }
  elevator.getElevationAlongPath(pathRequest, processElevation);
}

function processElevation(results, status) {
  if (status == google.maps.ElevationStatus.OK) {
    elevations = results;
    elevationGain = 0;
    elevationLoss = 0;
    var elevationPath = [];
    for (var i = 0; i < results.length - 1; i++) {
      if (elevations[i].elevation > elevations[i + 1].elevation) {
        elevationLoss += elevations[i].elevation - elevations[i + 1].elevation
      }
      else {
        elevationGain += elevations[i + 1].elevation - elevations[i].elevation
      }
    }
    $('#elevationLoss').val(elevationLoss);
    $('#elevationGain').val(elevationGain);
    console.log(elevationLoss);
    console.log(elevationGain);
    $('#new_run').submit();
  }
}
