// csrf用のトークン発行
$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
    var token;
    if (!options.crossDomain) {
    token = $('meta[name="csrf-token"]').attr('content');
       if (token) {
          return jqXHR.setRequestHeader('X-CSRF-Token', token);
        }
     }
 });

// セレクトタグ(商品個数)の変更値をDBに反映
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

$("button.delete_item").click(function() {
	$.ajax({
		url: "carts/delete",
		type: "DELETE",
		data: {cart_id: $(this).attr("id"),
	},
	dataType: "html"
	})
	val = $(this).attr("id")
	$(this).parents("div").fadeOut()
})