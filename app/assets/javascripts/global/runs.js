function removeSelectedRuns() {
	$('input:checkbox:checked').each(function() {
		var id = $(this).attr("id");
		$.ajax({
      		url: "/runs/" + id,
      		type: "POST",
      		dataType: "json",
      		data: {"_method":"delete", "authenticity_token":AUTH_TOKEN}
  		})
      	.always(function() {
      		$("#" + id).closest('tr').fadeOut();
      	});
	})
}

function checkInput() {
  
  $('#hr').css("display", "none");
  $('#min').css("display", "none");
  $('#sec').css("display", "none");
  $('#distance_error').css("display", "none");
  $('#temp').css("display", "none");
  $('#humidity').css("display", "none");

  var flag = true;
  var hr = $('#run_hr').val();
  if (!$.isNumeric(hr)) {
    flag = false;
    $('#hr').css("display", "block");
  }
  var min = $('#run_min').val();
  if (!$.isNumeric(min)) {
    flag = false;
    $('#min').css("display", "block");
  }
  var sec = $('#run_sec').val();
  if (!$.isNumeric(sec)) {
    flag = false;
    $('#sec').css("display", "block");
  }
  var distance = $('#distance').val();
  if (!$.isNumeric(distance)) {
    flag = false;
    $('#distance_error').css("display", "block");
  }
  var temp = $('#run_temp').val();
  if (!$.isNumeric(temp) && temp != "") {
    flag = false;
    $('#temp').css("display", "block");
  }
  var humidity = $('#run_humidity').val();
  if (!$.isNumeric(humidity) && humidity != "") {
    flag = false;
    $('#humidity').css("display", "block");
  }
  if (!flag) {
    return false;
  }
  else {
    if (temp == "") {
      $("#run_temp").val(-1);
    }
    if (humidity == "") {
      $("#run_humidity").val(-1);
    }
    getMapData();
    return true;
  }
}

