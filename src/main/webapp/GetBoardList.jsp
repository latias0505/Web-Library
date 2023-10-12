<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="css/GetBoardList.css" />
  </head>
  <body>
    <a href="mainpagego.do">
  		<img src="images/logo.png" alt="" class="logo" />
	</a>
    <hr />
    <h1>도서 목록</h1>
    <div class="searchbox">
      <form action="searchBoard.do" method="post">
        <select name="searchType">
          <option value="writer">작가</option>
          <option value="shop">출판사</option>
          <option value="code">ISBN</option>
          <option value="title">도서제목</option>
        </select>
        <input type="text" name="keyword" placeholder="검색어 입력" />
        <input type="submit" value="검색" />
      </form>
    </div>
    <hr />
    <table class="booklist">
      <tr class="listtitle">
        <td>도서 번호</td>
        <td>ISBN</td>
        <td>도서 제목</td>
        <td>작가</td>
        <td>출판사</td>
        <td>대출자</td>
      </tr>
      <c:forEach var="board" items="${boardList }">
        <tr class="list">
          <td>${board.seq }</td>
          <td>${board.code }</td>
          <td><a href="getBoard.do?seq=${board.seq}"> ${board.title}</a></td>
          <td>${board.writer }</td>
          <td>${board.shop }</td>
          <td>${board.owner}</td>
        </tr>
        <tr>
          <td colspan="6"><hr /></td>
        </tr>
      </c:forEach>
    </table>
    <br />
    <c:if test="${user.role == 'Admin'}">
      <a href="InsertBoardGo.do" class="bookmake">도서 등록</a>
    </c:if>
  </body>
</html>
