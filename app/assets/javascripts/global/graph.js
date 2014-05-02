function drawGraph(id) {
	var gtHour = $('#goalinfo' + id).data('gthour');
	var gtMin = $('#goalinfo' + id).data('gtmin');
	var gtSec = $('#goalinfo' + id).data('gtsec');
	var goalTime = (gtHour*3600) + (gtMin*60) + gtSec;
	var predHash = $('#goalinfo' + id).data('predhash');
	var predArray = [];
	var goalArray = [];
	var keys = [];

	for (var key in predHash) {
		keys.push(key);
	}

	keys.sort();
	// Gets the first time the user has listed and finds one day before that.
  var start = keys[0].split("/");
  var startingDate = new Date(start[2], start[0], start[1])
  var dayBefore = new Date(startingDate.getDate());
	dayBefore.setDate(startingDate.getDate() - 1);

  if (dayBefore.getDate() > startingDate.getDate()) {
    var startDay = dayBefore.getDate();
    if (parseInt(start[0]) == 1) {
      var startMonth = 12;
      var startYear = parseInt(start[2]) - 1;
    }
    else {
      var startMonth = parseInt(start[0]) - 1;
      var startYear = parseInt(start[2]);
    }
    var startString = startMonth + "-" + startDay + "-" + startYear;
  }
	for (var i = 0; i < keys.length; i++) {
    var time = keys[i].split("/");
		predArray.push([time[0] + "-" + time[1] + "-" + time[2], predHash[keys[i]]])
		goalArray.push([time[0] + "-" + time[1] + "-" + time[2], goalTime/3600.0]);
	}

	/*if ($('#chartdiv'+id).attr("class") != "ready_for_graph") {
		graph.destroy();
	}*/
  console.log(predArray);
	var graph = $.jqplot('chartdiv'.concat(id),  [ goalArray, predArray ], {
		axes:{
			xaxis:{
				renderer:$.jqplot.DateAxisRenderer,
				tickOptions:{formatString:'%b %#d, %y'},
				min: startString,
				tickInterval:'1 day'
			}
		},
    legend: {
            show: true,
            location:"nw"
    },
    series:[{
        lineWidth:4, 
        markerOptions:{style:'square'},
        label:"Goal Time"
      },
      {
        lineWidth:4,
        label:"Predicted Time"
      }
    ]
	});
	$('#chartdiv'+id).attr("class") == "not_ready_for_graph"
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

	
