// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready ( function(){
   $('#zipcode').bind('input', function() { 
    	zipcode = $(this).val(); // get the current value of the input field.
    	if (zipcode.length == 5) {
    		geocoder.geocode( { 'address': zipcode}, function(results, status) {
      		if (status == google.maps.GeocoderStatus.OK) {
		        //Got result, center the map and put it out there
		        map.setCenter(results[0].geometry.location);
		        var marker = new google.maps.Marker({
		            map: map,
		            position: results[0].geometry.location
		        });
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
	$('#distance').val(dist);
}



