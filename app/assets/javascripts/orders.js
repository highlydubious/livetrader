var queryMaker;
$(document).ready(function() {

	queryMaker = function queryMaker(symbol, date) {
		var baseUri = "https://query.yahooapis.com/v1/public/yql?q=";
		var query1 = "select * from yahoo.finance.historicaldata where symbol = '";
		var query2 = "' and startDate = '" + date +"' and endDate = '" + date + "'" ;
		var endQuery = "&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=";
		var url =  baseUri + query1 + symbol + query2;
		return encodeURI(url) + endQuery;	
	}



	$("#order_stock").focusout(function() {

		var str = $('#order_stock').val()
		var date = '2014-10-21'
	
		$.ajax({
			dataType: "json",
			type: "GET",
			url: queryMaker(str, date)
		}).done(function(json) {
			var closePrice = json.query.results.quote.Close
			console.log(closePrice)
			$('#order_price').val(closePrice)

			// $('#show-stock').text(str)
			var stockPrice = $('#show-info').text(closePrice)
		});

		$('#order_qty').focusout(function() {
			var value = $(this).val();
			console.log(value);
			$('#show-qty').html(value)

			var stockPrice = $('#show-info').html()
			$('#show-cost').html(stockPrice * value)
			console.log(stockPrice);
			console.log(value);
	
		})


		
		


	});	
});




