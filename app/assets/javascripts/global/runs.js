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
  $('#name').css("display", "none");
  $('#time').css("display", "none");
  $('#distance_error').css("display", "none");
  $('#temp').css("display", "none");
  $('#humidity').css("display", "none");

  var flag = true;
  var name = $('#run_name').val();
  if (name == "") {
    flag = false;
    $('#name').css("display", "inline-block");
  }
  var hr = $('#run_hr').val();
  var min = $('#run_min').val();
  var sec = $('#run_sec').val();
  if (!$.isNumeric(hr) || !$.isNumeric(min) || !$.isNumeric(sec)) {
    if (!((hr == "" && min == "" && $.isNumeric(sec)) || (hr == "" && $.isNumeric(min) && sec == "") || 
      ($.isNumeric(hr) && min == "" && sec == "") || (hr == "" && $.isNumeric(min) && $.isNumeric(sec)) || 
      ($.isNumeric(hr) && $.isNumeric(min) && sec == "") || ($.isNumeric(hr) && min == "" && $.isNumeric(sec)))) {
      flag = false;
      $('#time').css("display", "inline-block");
    }
  }
  var distance = $('#distance').val();
  if (!$.isNumeric(distance) ) {
    flag = false;
    $('#distance_error').css("display", "inline-block");
  }
  if (distance == 0) {
    flag = false;
    $('#distance_zero_error').css("display", "inline-block");
  }
  var temp = $('#run_temp').val();
  if (!$.isNumeric(temp) && temp != "") {
    flag = false;
    $('#temp').css("display", "inline-block");
  }
  var humidity = $('#run_humidity').val();
  if (!$.isNumeric(humidity) && humidity != "") {
    flag = false;
    $('#humidity').css("display", "inline-block");
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
    return true;
  }
}

