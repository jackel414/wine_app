$(document).ready(function() {
	if ($("#in_cellar_link").is(":checked")) {
		$("#in_cellar_field").show();
	}
	
	if ($("#catalog_link").is(":checked")) {
		console.log("catalog");
		$("#wine_form_catalog_info").show();
	}
	
	if ($("#add_region_field").val() != '') {
		console.log("yes");
		$("#add_region_field").show();
		$("#add_region_link").hide();
	}
	
	$("#add_region_link").on("click", function(event) {
		event.preventDefault();
		$(this).hide();
		$("#add_region_field").slideToggle(0);
	});
	
	$("#in_cellar_link").on("click", function(event) {
		$("#in_cellar_field").slideToggle(0);
	});
	
	$("#catalog_link").on("click", function(event) {
		$("#wine_form_catalog_info").toggle("slide", { direction: "left" }, 0);
	});

	$('.date_picker').datepicker();

	$("#login_button").on("click", function(event) {
		event.preventDefault();
		$("#login_form").slideToggle(100);
	});	
});