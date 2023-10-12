<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-euiv="Content-Type" charset="text/html" charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="css/InsertUser.css" />
  </head>
  <body>
    <img src="images/logo.png" alt="" class="logo" />
    <h1>회원가입</h1>
    <form action="insertUser.do" method="post" class="signupbox">
      <table>
        <tr>
          <td>
            <input type="text" name="id" class="idbox" placeholder="  아이디" />
          </td>
        </tr>

        <tr>
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
          <td>
            <input
              type="password"
              name="password2"
              class="pwbox2"
              placeholder="  비밀번호 재입력"
            />
          </td>
        </tr>

        <tr>
          <td>
            <input
              type="text"
              name="name"
              class="namebox"
              placeholder="  이름"
            />
          </td>
        </tr>

        <tr>
          <td>
            <input
              type="text"
              name="phone"
              class="phonebox"
              placeholder="  연락처"
            />
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <input
              type="submit"
              name="회원가입"
              value="회원가입"
              class="signupbutton"
            />
          </td>
        </tr>
      </table>
    </form>
    <script src="js/InsertUser.js"></script>
    <% String message = (String) request.getAttribute("message"); if (message !=
    null && !message.isEmpty()) { %>
    <script>
      alert("<%= message %>");
    </script>
    <% } %>
  </body>
</html>
