$(document).ready(function() {
	$("#sub_region_link").on("click", function(event) {
		event.preventDefault();
		$("#sub_region_field").slideToggle(5);
	});

	$('.date_picker').datepicker();

	$("#login_button").on("click", function(event) {
		event.preventDefault();
		$("#login_form").slideToggle(100);
	});
});

$(document).on('page:load', function() {
	$("#sub_region_link").on("click", function(event) {
		event.preventDefault();
		$("#sub_region_field").slideToggle(5);
	});

	$('.date_picker').datepicker();

	$("#login_button").on("click", function(event) {
		event.preventDefault();
		$("#login_form").slideToggle(100);
	});
});