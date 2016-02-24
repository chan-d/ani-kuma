$(document).ready(function(){

	console.log("javascript loaded");

	$("#about_me").on('click', function (){
	$("#about_me_box").css("display","block");
	$("#about_me").css("display", "none");

	});




	$(document).on('click', '#search_button', function(e){
		
		e.preventDefault();
		var searched= $('.search_bar').val().toLowerCase().replace(/ /g, '-');		
		$('#rendered_search').empty();
		$.ajax({
			method: "GET",
			url: 'http://hummingbird.me/api/v1/anime/' + searched,
			success: function(data) {	

				$('#rendered_search').append(
					//display search results
					
					'<p> <strong>English Title:</strong> ' + data.title + '</p>' +
					'<p> <strong>Japanese Title:</strong> ' + data.alternate_title + '</p>' +
					'<p> <strong>movie poster:</strong> <img class="movie_poster" src='+ data.cover_image + '</p>' +
					'<p> <strong>Synopsis:</strong> ' + data.synopsis + '</p>' +

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

