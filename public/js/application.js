$(document).ready(function(){
	// this ID here refers to the form where the user types in a URL
	$('#shortenform').submit(function(e){
		e.preventDefault();
		$.ajax({
			url: '/urls'. //this refers to the route post
			method: 'POST',
			data: $(this).serialize(),
			dataType: 'json',
			success: function(data){
				console.log(url.short_url)
			};
		});
	});
};