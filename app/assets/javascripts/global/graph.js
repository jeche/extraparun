function drawGraph() {
	var gtHour = $('#goalinfo').data('gthour');
	var gtMin = $('#goalinfo').data('gtmin');
	var gtSec = $('#goalinfo').data('gtsec');
	var predTime = $('#goalinfo').data('predtime');
	var goalTime = (gtHour*3600) + (gtMin*60) + gtSec;
	var predHash = $('#goalinfo').data('predhash');
	var predArray = [];
	var goalArray = [];
	var keys = [];

	for (var key in predHash) {
		keys.push(key);
	}

	keys.sort();
	// Gets the first time the user has listed and finds one day before that.
	var startingTimeList = (keys[0].split("T"))[0].split("-");
	var rightDate = parseInt(startingTimeList[2]) - 1;
	var startingTime = startingTimeList[0] + "-" + startingTimeList[1] + "-" + rightDate

	for (var i = 0; i < keys.length; i++) {
		var time = keys[i].split("T");
		predArray.push([time[0] + " " + time[1], predHash[keys[i]]])
		goalArray.push([time[0] + " " + time[1], goalTime/3600]);
	}

	if ($('#chartdiv').attr("class") != "ready_for_graph") {
		graph.destroy();
	}
	console.log(predArray);
	var graph = $.jqplot('chartdiv',  [ goalArray, predArray ], {
		axes:{
			xaxis:{
				renderer:$.jqplot.DateAxisRenderer,
				tickOptions:{formatString:'%b %#d, %y'},
				min: startingTime,
				tickInterval:'1 day'
			}
		},
    	series:[{lineWidth:4, markerOptions:{style:'square'}}]
	});
	$('#chartdiv').attr("class") == "not_ready_for_graph"
}

function checkInput() {
  return true;
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
  if (!$.isNumeric(distance) ) {
    flag = false;
    $('#distance_error').css("display", "block");
  }
  if (distance == 0) {
    flag = false;
    $('#distance_zero_error').css("display", "block");
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
    return true;
  }
}

	
