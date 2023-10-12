<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보</title>
<link rel="stylesheet" type="text/css" href="css/Mydata.css" />
</head>
<body>
	<h1>사용자 정보</h1>
	<form action="UpdateUserData.do" method="post">
		<table>
			<tr class="id">
				<td class="menu">ID:</td>
				<td><input type="text" name="id" value="${user.id}" class="text" readonly></td>
			</tr>
			<tr class="pass">
				<td class="menu">Password:</td>
				<td><input type="password" name="password" value="${user.password}" class="text"></td>
			</tr>
			<tr class="name">
				<td class="menu">Name:</td>
				<td><input type="text" name="name" value="${user.name}" class="text"></td>
			</tr>
			<tr class="phone">
				<td class="menu">Phone:</td>
				<td><input type="text" name="phone" value="${user.phone}" class="text"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="저장" class="button"></td>
			</tr>
		</table>
	</form>
</body>
</html>
