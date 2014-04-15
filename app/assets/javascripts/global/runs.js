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
