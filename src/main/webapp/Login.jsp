<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-euiv="Content-Type" charset="text/html" charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="css/login.css" />
  </head>
  <body>
  <% String errorMessage = (String) request.getAttribute("errorMessage");
   if (errorMessage != null) { %>
<script>
   alert("<%= errorMessage %>");
</script>
<% } %>
  
    <img src="images/logo.png" alt="" class="logo" />
    <div>
      <form action="login.do" method="post">
        <table class="signupmenu">
          <tr class="idtable">
            <td>
              <input
                type="text"
                name="id"
                class="idbox"
                placeholder="  아이디"
              />
            </td>
          </tr>
          <tr class="pwtable">
            <td>
              <input
                type="password"
                name="password"
                class="pwbox"
                placeholder="  비밀번호"
              />
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <input
                type="submit"
                name="login"
                value="로그인"
                class="signupbox"
              />
            </td>
          </tr>
        </table>
      </form>
    </div>
    <a href="InsertUserGo.do" class="signintext">회원가입</a>
    <script src="js/login.js"></script>
  </body>
</html>