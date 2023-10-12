<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/InsertBoard.css">
</head>
<body>
	<h1>도서 등록</h1>
	<hr />
	<form action="insertBoard.do" method="post">
		<table border="1">
			<tr class="title">
				<td>책 코드</td>
				<td><input type="text" name="code" /></td>
			</tr>
			<tr class="title">
				<td>책 제목</td>
				<td><input type="text" name="title" /></td>
			</tr>
			<tr class="title">
				<td>작성자</td>
				<td><input type="text" name="writer" /></td>
			</tr>
			<tr class="title">
				<td>출판사</td>
				<td><input type="text" name="shop" /></td>
			</tr>
			<tr class="title">
				<td>책 설명</td>
				<td><textarea name="content" cols="40" rows="10" ></textarea></td>
			</tr>
			<tr>
				<td rowspan="1"></td>
				<td><input type="submit" value="등록" /></td>
			</tr>
		</table>
	</form>
</body>
</html>