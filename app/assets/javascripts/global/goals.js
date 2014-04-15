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
