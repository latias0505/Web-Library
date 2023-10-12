<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="biz.board.BoardDAO, biz.board.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page import="biz.user.UserVO" %>
<%
// user 변수를 세션에서 가져옴
UserVO user = (UserVO) session.getAttribute("user");

// BoardDAO 클래스의 인스턴스 생성
BoardDAO boardDAO = new BoardDAO();

// owner 값이 user.name과 일치하는 게시판 정보 가져오기
List<BoardVO> boardList = boardDAO.getBoardListByOwner(user.getName());
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="css/Mypage.css" />
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  </head>
  <body>
    <a href="mainpagego.do">
  		<img src="images/logo.png" alt="" class="logo" />
	</a>
    <hr class="hr1" />
    <div class="container1">
      <div class="userbox">
        <div class="username">
          <a><strong>${user.name}</strong>님의<br />마이페이지 입니다.</a>
        </div>
        <div class="container">
          <div class="userdata">
            <b>개인 정보</b>
            <br />
            <a href="MydataGo.do" class="text">확인/수정</a>
          </div>
          <div class="admin">
          <c:if test="${user.role == 'User'}">
            <b>관리자 신청</b>
          </c:if>
          <c:if test="${user.role != 'User'}">
          	<b>사용자 조회</b>
          </c:if>
            <br />
            <c:if test="${user.role == 'User'}">
              <a href="wantadmin.do">신청하기</a>
            </c:if>
            <c:if test="${user.role != 'User'}">
              <a href="userdata.do" class="text">조회하기</a>
            </c:if>
          </div>
          <div class="delete">
            <b>회원 탈퇴</b>
            <br />
            <% if (boardList.size() < 1) { %>
            <button onclick="confirmWithdrawal()" class="button1">탈퇴하기</button>
            <% } %>
            <% if (boardList.size() > 0) { %>
            <a>대출중인 도서가 존재하여 탈퇴할 수 없습니다.</a>
            <% } %>
          </div>
          <script>
			  function confirmWithdrawal() {
			    var inputText = prompt("탈퇴를 원하시면 '탈퇴'라고 입력해주세요.");
			    if (inputText === "탈퇴") {
			      location.href = "delete.do";
			    } else {
			      alert("입력한 값이 일치하지 않습니다.");
			    }
			  }
			</script>
          <div class="userbook">
            <b>대여 도서</b>
            <br />
            <a class="text"><%= boardList.size() %>권</a>
          </div>
        </div>
      </div>
      <div class="bookmenu">
        <table class="booklist">
        <% if (boardList.size() < 1) { %>
			  <tr class="listerror">
			    <th>대출한 도서가 존재하지 않습니다.</th>
			  </tr>
			<% } %>
          <% if (boardList.size() > 0) { %>
			  <tr class="listtitle">
			    <th>Code</th>
			    <th>Title</th>
			    <th>Writer</th>
			    <th>Shop</th>
			    <th>반납</th>
			  </tr>
			<% } %>
          <% for (BoardVO board : boardList) { %>
          <tr class="listmenu">
            <td><%= board.getCode() %></td>
            <td><%= board.getTitle() %></td>
            <td><%= board.getWriter() %></td>
            <td><%= board.getShop() %></td>
            <td>
              <form action="BookOutOwner.do" method="post">
                <button type="submit" class="button">반납하기</button>
                <input type="hidden" name="code" value="<%= board.getCode() %>">
              </form>
            </td>
          </tr>
          <% } %>
        </table>
      </div>
    </div>
  </body>
</html>
