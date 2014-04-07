function loadScript(){
	var gtHour = $('#goalinfo').data('gthour');
	var gtMin = $('#goalinfo').data('gtmin');
	var gtSec = $('#goalinfo').data('gtsec');
	var predTime = $('#goalinfo').data('predtime');
	var goalTime = (gtHour*3600) + (gtMin*60) + gtSec;
	
	//var data='<%=j @goal%>'
	$.jqplot('chartdiv',  [ [[1, predTime/3600]], [[1, goalTime/3600]] ]);
}
$(document).ready(loadScript);
$(document).on("page:load", loadScript);
	
/*function loadScript(){
	
	alert("hiyo");
	
	
}
alert("hi");
$(document).ready(loadScript);
$(document).on("page:load", loadScript);*/