<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Movie Details</title>
    <style>
      .movie-details {
        margin: 20px;
      }

      .movie-details h1 {
        font-size: 24px;
      }

      .movie-details img {
        width: 300px;
        height: auto;
        margin-bottom: 10px;
        float: left;
        margin-right: 20px;
      }

      .movie-details .movie-info {
        overflow: hidden;
      }

      .movie-details p {
        margin: 0;
      }
    </style>
    <script
      src="https://code.jquery.com/jquery-3.6.4.js"
      integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
      crossorigin="anonymous"
    ></script>
    <script>
      $(document).ready(async function () {
        const apiKey = "a64533e7ece6c72731da47c9c8bc691f";
        const params = new URLSearchParams(window.location.search);
        const movieId = params.get("id");
        const movieUrl = 'https://api.themoviedb.org/3/movie/${movieId}?api_key=${apiKey}&language=ko-KR';

        const response = await fetch(movieUrl);
        const movieData = await response.json();

        const movieDetails = $('<div class="movie-details">');
        const moviePoster = $("<img>").attr(
          "src",
          'https://image.tmdb.org/t/p/w500${movieData.poster_path}'
        );
        const movieInfo = $('<div class="movie-info">');
        const movieTitle = $("<h1>").text(movieData.title);
        const movieRating = $("<p>").text('평점: ${movieData.vote_average}');
        const movieReleaseDate = $("<p>").text(
          '개봉일: ${movieData.release_date}'
        );
        const movieOverview = $("<p>").text(movieData.overview);

        movieInfo.append(movieTitle, movieRating);
        movieDetails.append(
          moviePoster,
          movieInfo,
          movieReleaseDate,
          movieOverview
        );
        $("body").append(movieDetails);
      });
    </script>
  </head>

  <body></body>
</html>
