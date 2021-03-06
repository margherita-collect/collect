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
	var before_sum = $(this).siblings("#sum").text() - 0;
	var quantity = $(this).val();
	var price = $(this).siblings("span#price").text();
	var sum = quantity * price;
	$(this).siblings("#sum").text(`${sum}`)
	var total_price = $("#total_price").text() - 0;
	$("#total_price").text(`${total_price + sum - before_sum}`)
})

$("button.delete_item").click(function() {
	$.ajax({
		url: "carts/delete",
		type: "DELETE",
		data: {cart_id: $(this).attr("id"),
	},
	dataType: "html"
	})
	val = $(this).attr("id");
	$(this).parents("div").fadeOut();
	var sum = $(this).siblings("#sum").text();
	var total_price = $("#total_price").text();
	$("#total_price").text(`${total_price - sum}`);

})