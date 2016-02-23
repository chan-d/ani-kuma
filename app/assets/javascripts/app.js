$(document).ready(function(){

	console.log("javascript loaded");

	$('#search_button').on('click', function(e){
		
		e.preventDefault();
		var searched= $('.search_bar').val().toLowerCase().replace(/ /g, '-');		
		
		$.ajax({
			method: "GET",
			url: 'http://hummingbird.me/api/v1/anime/' + searched,
			success: function(data) {
				//empty div
				$('#420').empty();
				$('#420').append(
					//display search results
					'<p> English Title: ' + data.title + '</p>' +
					'<p> Japanese Title: ' + data.alternate_title + '</p>' +
					'<p> movie poster: <img class="movie_poster" src='+ data.cover_image + '</p>' +
					'<p> Synopsis: ' + data.synopsis + '</p>' +

					//hidden form
					'<form action="/movies" accept-charset="UTF-8" method="post">' +
					'<input name="utf8" type="hidden" value="✓">' +
					'<input type="hidden" name="authenticity_token" value="c97ECRR/pWIOxr6UpIVOL7AjqcDYefT6EaC80CLlpipURjuciphaXzRN/WhtD3CZuTcsv4804+uqrPSNlZitMA==">' +
					'<input type="hidden" name="movie[e_title]" id="movie_e_title" value="'+ data.title + '">' +
					'<input type="hidden" name="movie[j_title]" id="movie_j_title" value="'+ data.alternate_title + '">' +
					'<input type="hidden" name="movie[synopsis]" id="movie_synopsis" value="'+ data.synopsis + '">' +
					'<input type="hidden" name="movie[img_url]" id="movie_img_url" value="'+ data.cover_image + '">' +
					'<input type="submit" name="commit" value="Add Movie">' +
					'</form>'
					);
			}
		});
	});
});

