$(document).ready(function() {
	if ($("#in_cellar_link").is(":checked")) {
		$("#in_cellar_field").show();
	}
	
	if ($("#catalog_link").is(":checked")) {
		$("#wine_form_catalog_info").show();
	}
	
	if ($("#add_region_field").val() != '') {
		$("#add_region_field").show();
		$("#add_region_link").hide();
	}
	
	if ($("#add_region_field_2").val() != '') {
		$("#add_region_field_2").show();
		$("#add_region_link_2").hide();
	}
	
	if ($("#wine_with_meal").val() == 'true') {
		$("#with_meal_field").show();
	}
	
	$("#add_region_link").on("click", function(event) {
		event.preventDefault();
		$(this).hide();
		$("#add_region_field").slideToggle(0);
	});
	
	$("#add_region_link_2").on("click", function(event) {
		event.preventDefault();
		$(this).hide();
		$("#add_region_field_2").slideToggle(0);
	});
	
	$("#in_cellar_link").on("click", function() {
		$("#in_cellar_field").slideToggle(0);
	});
	
	$("#catalog_link").on("click", function() {
		$("#wine_form_catalog_info").toggle("slide", { direction: "left" }, 0);
	});
	
	$("#wine_with_meal").change(function() {
		value = $(this).val();
		if (value == 'true') {
			$("#with_meal_field").show();
		} else {
			$("#with_meal_field").hide();
		}
	});

	$('.date_picker').datepicker();

	$("#login_button").on("click", function(event) {
		event.preventDefault();
		$("#login_form").slideToggle(100);
	});
  
  $('#country_select').on('change', function() {
    var value = $(this).val();
    if (value == 'Other') {
      $('#country_other_text').show();
    } else {
      $('#country_other_text').hide();
    }
  });
  
  $('#general_region_select').on('change', function() {
    var value = $(this).val();
    if (value == 'Other') {
      $('#general_region_other_text').show();
    } else {
      $('#general_region_other_text').hide();
    }
  });
  
  $('#specific_region_select').on('change', function() {
    var value = $(this).val();
    if (value == 'Other') {
      $('#specific_region_other_text').show();
    } else {
      $('#specific_region_other_text').hide();
    }
  });
  
  $('#micro_region_select').on('change', function() {
    var value = $(this).val();
    if (value == 'Other') {
      $('#micro_region_other_text').show();
    } else {
      $('#micro_region_other_text').hide();
    }
  });
  
});