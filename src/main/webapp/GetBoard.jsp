<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>도서 상세보기</title>
  <link rel="stylesheet" type="text/css" href="css/GetBoard.css">
</head>
<body>
  <h1>도서 상세보기</h1>
  <hr>
  <form action="updateBoard.do" method="post">
    <input name="seq" type="hidden" value="${board.seq}">
    <table>
      <tr>
        <td class="title">책 코드</td>
        <td class="text">${board.code}</td>
      </tr>
      <tr>
        <td class="title">제목</td>
        <td class="text"><input name="title" type="text" value="${board.title}" style="width: 100%; text-align:center; font-size:20px;"></td>
      </tr>
      <tr>
        <td class="title">작성자</td>
        <td class="text">${board.writer}</td>
      </tr>
      <tr>
        <td class="title">출판사</td>
        <td class="text">${board.shop}</td>
      </tr>
      <tr>
        <td class="title">글 내용</td>
        <td class="text"><textarea name="content" cols="40" rows="10" style="font-size:20px;">${board.content}</textarea></td>
      </tr>
      <tr>
        <c:if test="${board.owner eq 'none'}">
          <td colspan="2">
            <input type="submit" formaction="bookinowner.do" formmethod="post" value="대출하기">
            <input name="code" type="hidden" value="${board.code}">
          </td>
        </c:if>
      </tr>
    </table>
    <br>
    <c:if test="${user.role == 'Admin'}">
      <a href="deleteBoard.do?seq=${board.seq}">삭제</a>
    </c:if>
  </form>
</body>
</html>
