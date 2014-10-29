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

		var stockInput = $('#order_stock').val()
		var date = '2014-10-28'
	
		$.ajax({
			dataType: "json",
			type: "GET",
			url: queryMaker(stockInput, date)
		}).done(function(json) {
			var closePrice = json.query.results.quote.Close
			console.log(closePrice)

			var stockPrice = $('#show-price').text(closePrice)
		});

		$('#order_qty').focusout(function() {
			var value = $(this).val();
			console.log(value);
			$('#show-qty').html(value)

			var stockPrice = $('#show-price').html()
			$('#show-cost').html(stockPrice * value)
			console.log(stockPrice);
			console.log(value);
	
		})


		
		


	});	
});




