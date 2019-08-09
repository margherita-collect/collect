$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
    var token;
    if (!options.crossDomain) {
    token = $('meta[name="csrf-token"]').attr('content');
       if (token) {
          return jqXHR.setRequestHeader('X-CSRF-Token', token);
        }
     }
 });

$("select.select_quantity").change(function() {
	$.ajax({
		url: "carts/update",
		type: "POST",
		data: {cart_id: $(this).attr("id"),
			   quantity: $(this).val()
		},
		dataType: "html",
	})
})