$(document).ready(function() {
	checkCellar;
	
	$("#add_region_link").on("click", function(event) {
		event.preventDefault();
		$(this).hide();
		$("#add_region_field").slideToggle(0);
	});
	
	//add checkbox trigger here
	
	$("#in_cellar_link").on("click", function(event) {
		$("#in_cellar_field").slideToggle(200);
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

var checkCellar;
checkCellar = function() {
	var cellarCheckbox = $("#in_cellar_link");
	var bottlesField = $("#in_cellar_field");
	
	if (cellarCheckbox.is(":checked")) {
	bottlesField.show();
	};
}