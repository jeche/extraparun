function loadScript(){
	var script = document.createElement('script');
  	script.type = 'text/javascript';
  	script.src = '../assets/dist/jquery.jqplot.min.js';
  	document.body.appendChild(script);

  	var script2 = document.createElement('script');
  	script2.type = 'text/javascript';
  	script2.src = '../assets/dist/plugins/jqplot.dateAxisRenderer.min.js';
  	document.body.appendChild(script2);

	var gtHour = $('#goalinfo').data('gthour');
	var gtMin = $('#goalinfo').data('gtmin');
	var gtSec = $('#goalinfo').data('gtsec');
	var predTime = $('#goalinfo').data('predtime');
	var goalTime = (gtHour*3600) + (gtMin*60) + gtSec;
	var predHash = $('#goalinfo').data('predhash');
	var predArray = [];
	var goalArray = [];
	for (var key in predHash) {
		predArray.push([key, predHash[key]])
		goalArray.push([key, goalTime/3600]);
	}
	if ($('#chartdiv').attr("class") != "ready_for_graph") {
		graph.destroy();
		alert("destroyed mwaahhaahaa");
	}
	var graph = $.jqplot('chartdiv',  [ goalArray, predArray ], {
		axes:{
			xaxis:{
				renderer:$.jqplot.DateAxisRenderer,
				tickOptions:{formatString:'%b %#d, %y'},
				min: predArray[0][0],
				tickInterval:'1 day'
			}
		},
    	series:[{lineWidth:4, markerOptions:{style:'square'}}]
	});
	$('#chartdiv').attr("class") == "not_ready_for_graph"
}
$(document).ready(loadScript);
$(document).on("page:load", loadScript);
	
