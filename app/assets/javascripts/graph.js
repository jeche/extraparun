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

	
