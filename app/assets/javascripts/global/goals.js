function removeSelectedGoals() {
	$('input:checkbox:checked').each(function() {
		var id = $(this).attr("id");
		$.ajax({
      		url: "/goals/" + id,
      		type: "POST",
      		dataType: "json",
      		data: {"_method":"delete", "authenticity_token":AUTH_TOKEN}
  		})
      	.always(function() {
      		$("#" + id).closest('tr').fadeOut();
      	});
	})
}

function checkInputGoals() {
  $('#name').css("display", "none");
  $('#time').css("display", "none");
  $('#distance_error').css("display", "none");
  $('#distance_zero_error').css("display", "none");

  var flag = true;
  var name = $('#goal_GoalName').val();
  if (name == "") {
    flag = false;
    $('#name').css("display", "inline-block");
  }
  var hr = $('#goal_gtHour').val();
  var min = $('#goal_gtMin').val();
  var sec = $('#goal_gtSec').val();
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
  else if (distance == 0) {
    flag = false;
    $('#distance_zero_error').css("display", "inline-block");
  }
  if (!flag) {
    return false;
  }
  else {
    return true;
  }
}
