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

  $('#country_select').on('change', function() {
  	var country = $(this).val();
  	$("#general_region_select").html("<option>None</option>");
  	$("#general_region_row").show();
  	$("#specific_region_row").hide();
  	$("#micro_region_row").hide();
  	$.ajax({
  		url: '/region_dropdown.json',
  		type: 'GET',
  		data: 'country=' + country,
  		success: function(result) {
  			already_listed = []
	  		for(var i = 0; i < result.length; i++) {
	  			menu_text = JSON.stringify(result[i].general_region).replace(/"/g, "");
  				if(already_listed.indexOf(menu_text) == -1) {
	  				$("#general_region_select").append("<option>" + menu_text + "</option>");
	  				already_listed.push(menu_text);
	  			}
	  		}
	  		$("#general_region_select").append("<option>Other</option>");
  		}
  	})
  });
  
  $('#general_region_select').on('change', function() {
  	var general_region = $(this).val();
  	if(general_region == 'None') {
	  	$("#specific_region_row").hide();
  	} else {
  		$("#specific_region_row").show();
  	}
  	$("#specific_region_select").html("<option>None</option>");
  	$("#micro_region_row").hide();
  	$.ajax({
  		url: '/region_dropdown.json',
  		type: 'GET',
  		data: 'general_region=' + general_region,
  		success: function(result) {
  			already_listed = []
	  		for(var i = 0; i < result.length; i++) {
	  			menu_text = JSON.stringify(result[i].specific_region).replace(/"/g, "");
  				if(already_listed.indexOf(menu_text) == -1) {
	  				$("#specific_region_select").append("<option>" + menu_text + "</option>");
	  				already_listed.push(menu_text);
	  			}
	  		}
	  		$("#specific_region_select").append("<option>Other</option>");
  		}
  	})
  });
  
  $('#specific_region_select').on('change', function() {
  	var specific_region = $(this).val();
  	$("#micro_region_select").html("<option>None</option>");
  	if(specific_region == 'None') {
	  	$("#micro_region_row").hide();
  	} else {
  		$("#micro_region_row").show();
  	}
  	$.ajax({
  		url: '/region_dropdown.json',
  		type: 'GET',
  		data: 'specific_region=' + specific_region,
  		success: function(result) {
  			already_listed = []
	  		for(var i = 0; i < result.length; i++) {
	  			menu_text = JSON.stringify(result[i].micro_region).replace(/"/g, "");
  				if(already_listed.indexOf(menu_text) == -1) {
	  				$("#micro_region_select").append("<option>" + menu_text + "</option>");
	  				already_listed.push(menu_text);
	  			}
	  		}
	  		$("#micro_region_select").append("<option>Other</option>");
  		}
  	})
  });
  
});