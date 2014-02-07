var ready;
ready = function() {
	$("#sub_region_link").on("click", function(event) {
		event.preventDefault();
		$("#sub_region_field").slideToggle(5);
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);
$(document).ready(function() {
	$('.date_picker').datepicker();
});
