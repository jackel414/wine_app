$(document).ready(function() {
	if ($("#in_cellar_link").is(":checked")) {
		$("#in_cellar_field").show();
	}

	if ($("#catalog_link").is(":checked")) {
		$("#wine_form_catalog_info").show();
	}

	if ($("#wine_with_meal").val() == 'true') {
		$("#with_meal_field").show();
	}

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

  //this function allows for autocomplete on the wine-province field
  $(function() {
    function split( val ) {
      return val.split( /,\s*/ );
    }
    function extractLast( term ) {
      return split( term ).pop();
    }

    $( ".autocomplete_wine_field" )
      // don't navigate away from the field on tab when selecting an item
      .bind( "keydown", function( event ) {
        if ( event.keyCode === $.ui.keyCode.TAB && $( this ).data( "ui-autocomplete" ).menu.active ) {
          event.preventDefault();
        }
      })
      .autocomplete({
        source: function( request, response ) {
          $.getJSON( "/province_list.json", {
            term: extractLast( request.term ),
            area: $(':focus').attr('id')
            },
            response
          );
        },
        search: function() {
          // custom minLength
          var term = extractLast( this.value );
          if ( term.length < 2 ) {
            return false;
          }
        },
        focus: function() {
          // prevent value inserted on focus
          return false;
        },
        select: function( event, ui ) {
          var terms = split( this.value );
          // remove the current input
          terms.pop();
          // add the selected item
          terms.push( ui.item.value );
          terms.push( "" );
          this.value = terms.join( "" );
          return false;
        }
      });
  });
});