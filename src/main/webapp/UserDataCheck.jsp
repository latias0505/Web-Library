<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Data Check</title>
<link rel="stylesheet" type="text/css" href="css/UserDataCheck.css" />
</head>
<body>
<h1>유저 정보 및 관리</h1>
    <form action="userdelete.do" method="post">
    <div class="container">
        <table class="table">
            <thead class="title">
                <tr>
                    <th>ID</th>
                    <th>Password</th>
                    <th>Name</th>
                    <th>Role</th>
                    <th>Phone</th>
                    <th>Status</th>
                    <th>유저정보 삭제</th>
                    <th>관리자 전환</th>
                </tr>
            </thead>
            <tbody class="userdata">
                <c:forEach items="${userList}" var="user">
                    <c:if test="${user.role ne 'Admin'}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.password}</td>
                            <td>${user.name}</td>
                            <td>${user.role}</td>
                            <td>${user.phone}</td>
                            <td>${user.status}</td>
                            <td><input type="checkbox" name="deleteuser" value="${user.id}" class="check"></td>
                            <c:if test="${user.status ne 'notwant'}">
                                <td><input type="checkbox" name="makeadmin" value="${user.id}" class="check"></td>
                            </c:if>
                        </tr>
                        <tr>
					      <td colspan="8"><hr></td>
					    </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
        <div class="button-container">
		    <input type="submit" name="submitType" value="삭제하기" class="button1">
		    <input type="button" value="전환하기" onclick="makeAdmin()" class="button2">
		</div>
		</div>
    </form>
    <script>
        function makeAdmin() {
            var checkboxes = document.getElementsByName("makeadmin");
            var selectedValues = [];

            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    selectedValues.push(checkboxes[i].value);
                }
            }

            if (selectedValues.length > 0) {
                var queryString = "ids=" + selectedValues.join(",");
                window.location.href = "makeadmin.do?" + queryString;
            } else {
                alert("전환할 사용자를 선택해주세요.");
            }
        }
    </script>
</body>
</html>
