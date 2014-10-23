
$(document).ready(function() {
	$("#order_stock").focusout(function() {
	
		$.ajax({
			dataType: "json",
			type: "GET",
			url: "/api/stocks/" + $('#order_stock').val()
		}).done(function(json) {
			console.log(json)
			$('#order_price').val(json.price)

			var str = $('#order_stock').val()
			str += ' @ '
			

			$('#show-price-form').text(str + json.price)
		});
	});	
});




