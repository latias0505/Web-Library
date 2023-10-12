<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="css/Main2.css" />
    <script src="https://unpkg.com/embla-carousel/embla-carousel.umd.js"></script>
    <script src="https://unpkg.com/embla-carousel-autoplay/embla-carousel-autoplay.umd.js"></script>
  </head>
  <body>
    <img alt="" class="logo" src="images/logo.png" />
    <div class="search-container">
      <input
        type="text"
        class="searchbox"
        name="query"
        placeholder="   검색할 키워드를 입력해주세요"
      />
      <button type="submit" class="searchbutton">
        <img src="images/searchlogo.png" class="searchlogo" alt="" />
      </button>
    </div>
     <div class="usertext">
      <a class="username">${user.name}님 환영합니다.</a><br />
      <a href="logout.do" class="logout">로그아웃</a>
    </div>
    <div class="menubox">
      <div class="menutext">
        <a class="menu1">공지 사항</a>
        <a class="menu2" href="getBoardList.do">도서 정보</a>
        <a class="menu2" href="mypage.do">마이페이지</a>
        <a class="menu4" href="movie.do">영화 정보</a>
        <a class="menu5">고객 게시판</a>
      </div>
    </div>
    <div class="embla">
      <div class="embla__container">
        <img src="images/poster1.png" class="embla__slide" />
        <img src="images/poster2.png" class="embla__slide" />
        <img src="images/poster3.png" class="embla__slide" />
      </div>
    </div>
    <div class="black1">공지사항이 들어갈 예정입니다.</div>
    <div class="black2">고객 문의글이 들어갈 예정입니다.</div>
    <script src="js/main2.js"></script>
  </body>
</html>
