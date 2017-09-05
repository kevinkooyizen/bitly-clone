$(document).ready(function(){
	console.log("ready");
	$('#shorten_button').hover(function(){
		$(this).toggleClass('shorten_button_hover');
	});

	// this ID here refers to the form where the user types in a URL
	var form = $('#shortenform');
	form.on('paste', function(formSubmissionEvent){
		setTimeout(function () { 
        console.log($('#myid').val()); 
    	}, 100);
		formSubmissionEvent.preventDefault();
		console.log("Prevented default action!");

		$('body').prepend('<img src="/img/spinner.gif" id="spinner" />');

		$.ajax({
			url: form.attr('action'), // same as putting "urls"
			method: form.attr('method'),
			data: form.serialize(),
			dataType: 'JSON',
			success: function(response) {
				$('#spinner').hide();
				console.log(response);
				var count = $("#big_table tr").length;

				$('tbody').append('\
					<tr>\
						<td align="center">' + count + '</td>\
						<td><a href="' + response.long_url + '">' + response.long_url + '</a></td>\
						<td><a href="/' + response.short_url + '">' + 'https://zenly.herokuapp.com/' + response.short_url + '</td>\
						<td align="center">' + response.counter + '</td>\
					</tr>\
					');
			}
		});
	});

	form.on('submit', function(formSubmissionEvent){
		setTimeout(function () { 
        console.log($('#myid').val()); 
    	}, 100);
		formSubmissionEvent.preventDefault();
		console.log("Prevented default action!");

		$('body').prepend('<img src="/img/spinner.gif" id="spinner" />');

		$.ajax({
			url: form.attr('action'), // same as putting "urls"
			method: form.attr('method'),
			data: form.serialize(),
			dataType: 'JSON',
			success: function(response) {
				$('#spinner').hide();
				console.log(response);
				var count = $("#big_table tr").length;

				$('tbody').append('\
					<tr>\
						<td align="center">' + count + '</td>\
						<td><a href="' + response.long_url + '">' + response.long_url + '</a></td>\
						<td><a href="/' + response.short_url + '">' + 'https://zenly.herokuapp.com/' + response.short_url + '</td>\
						<td align="center">' + response.counter + '</td>\
					</tr>\
					');
			}
		});
	});
});