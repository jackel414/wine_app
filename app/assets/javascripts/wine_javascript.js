var ready;
ready = function() {
	$("#sub_region_link").on("click", function(event) {
		event.preventDefault();
		$("#sub_region_field").slideToggle(5);
	});
};
var datePicker;
datePicker = function() {
	$('.date_picker').datepicker();
};	

$(document).ready(ready, datePicker);
$(document).on('page:load', ready);
$(document).on('page:load', datePicker);