<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Movie List</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 20px;
        background-color: #f5f5f5;
      }

      .container {
        display: grid;
        grid-template-columns: repeat(5, 1fr);
        grid-gap: 30px;
        justify-items: center;
        align-content: center; /* 세로 방향 가운데 정렬 */
        max-width: 1400px;
        margin: 0 auto;
      }

      .movie-card {
        display: flex;
        flex-direction: column;
        align-items: center;
        background-color: #ffffff;
        border-radius: 4px;
        padding: 30px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        transition: box-shadow 0.3s ease-in-out;
        cursor: pointer;
        width: 180px;
        height: 300px;
      }

      .movie-card:hover {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.445);
      }

      .movie-poster {
        width: 110%;
        height: auto;
        margin-bottom: 10px;
        margin-top: -30px;
      }

      .movie-title {
        font-size: 15px;
        font-weight: bold;
        text-align: center;
        width: 230px;
      }

      .movie-details {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: auto;
        font-size: 10px;
      }

      .movie-details h3 {
        font-weight: bold;
        color: black;
      }

      .title-bar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        height: 50px;
        background-color: #9488e6;
        color: #ffffff;
        margin-bottom: 20px;
        margin-top: -20px;
        margin-left: -20px;
        margin-right: -20px;
        position: sticky;
        top: 0;
        left: 0; /* 이 줄을 추가합니다 */
        right: 0; /* 이 줄을 추가합니다 */
        z-index: 1; /* 이 줄을 추가합니다 */
      }

      .title-bar h1 {
        font-size: 24px;
        font-weight: bold;
        text-align: center; /* 이 줄을 추가합니다 */
        width: 100%; /* 이 줄을 추가합니다 */
        margin-right: -300px;
      }

      .search {
        margin-right: 10px;
        height: 20px;
      }

      .searchicon {
        width: 30px;
        margin-right: -60px;
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
        const apiUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${apiKey}&language=ko-KR&page=1';

        const response = await fetch(apiUrl);
        const data = await response.json();

        const movies = data.results;

        const container = $(".container");

        for (const movie of movies) {
          const movieCard = $('<div class="movie-card">');

          if (movie.poster_path) {
            const posterUrl = 'https://image.tmdb.org/t/p/w500${movie.poster_path}';
            const moviePoster = $('<img class="movie-poster">').attr(
              "src",
              posterUrl
            );
            movieCard.append(moviePoster);
          }

          const movieDetails = $('<div class="movie-details">');
          const movieTitle = $("<h3>")
            .addClass("movie-title")
            .text(movie.title);

          movieDetails.append(movieTitle);
          movieCard.append(movieDetails);

          const movieId = movie.id;
          movieCard.click(function () {
            window.open('Movie2.jsp?id=${movieId}', "_blank");
          });

          container.append(movieCard);
        }

        $(".search").on("input", function () {
          const searchKeyword = $(this).val().toLowerCase();

          $(".movie-card").each(function () {
            const movieTitle = $(this)
              .find(".movie-title")
              .text()
              .toLowerCase();
            if (movieTitle.includes(searchKeyword)) {
              $(this).show();
            } else {
              $(this).hide();
            }
          });
        });
      });
    </script>
  </head>

  <body>
    <div class="title-bar">
      <h1>Movie List</h1>
      <img src="images/1.png" alt="" class="searchicon" />
      <input type="text" class="search" />
    </div>

    <div class="container"></div>
  </body>
</html>