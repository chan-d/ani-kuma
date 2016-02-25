$(document).ready(function(){

	console.log("javascript loaded");
		//edit about me box in user profile
	$(document).on('click', "#about_me", function (e){
		e.preventDefault();
	$("#about_me_box").css("display","block");
	$("#about_me").css("display", "none");

	});
		//show video player in movie#show
	$(document).on('click', ".video_button", function (e){
		e.preventDefault();
	$(".video_player").css("display","block");
	$(".video_button").css("display", "none");

	});
	




	$(document).on('click', '#search_button', function(e){
		
		e.preventDefault();
		var searched= $('.search_bar').val().toLowerCase().replace(/ /g, '-');		
		$('#rendered_search').empty();
		$.ajax({
			method: "GET",
			url: 'https://hummingbird.me/api/v1/anime/' + searched,
			success: function(data) {	
				var syn = data.synopsis.replace(/"/g, '&quot;');
				$('#rendered_search').append(
					//display search results
					'<div class="col-md-12">' +
					'<div class="panel panel-default">' +
				  	'<div class="panel-body">' +
				  	'<div class="col-md-3"> '+
					'<p> <strong>movie poster:</strong> <img class="movie_poster" src='+ data.cover_image + '</p>' +
					'</div>' +
					'<div class="col-md-8 col-md-offset-1">' +
					'<p> <strong>English Title:</strong> ' + data.title + '</p>' +
					'<p> <strong>Japanese Title:</strong> ' + data.alternate_title + '</p>' +
					'<p> <strong>Synopsis:</strong> ' + syn + '</p>' +
					'</div>' +
					'</div>' +
					'</div>' +
					//hidden form
					'<form action="/movies" accept-charset="UTF-8" method="post">' +
					'<input name="utf8" type="hidden" value="✓">' +
					'<input type="hidden" name="authenticity_token" value="c97ECRR/pWIOxr6UpIVOL7AjqcDYefT6EaC80CLlpipURjuciphaXzRN/WhtD3CZuTcsv4804+uqrPSNlZitMA==">' +
					'<input type="hidden" name="movie[e_title]" id="movie_e_title" value="'+ data.title + '">' +
					'<input type="hidden" name="movie[j_title]" id="movie_j_title" value="'+ data.alternate_title + '">' +
					'<input type="hidden" name="movie[synopsis]" id="movie_synopsis" value="'+ syn + '">' +
					'<input type="hidden" name="movie[img_url]" id="movie_img_url" value="'+ data.cover_image + '">' +
					'<input type="submit" name="commit" value="Add Movie" class="btn btn-default">' +
					'</form>' + '</div>'
					);
				
			}
		});
	});
});

