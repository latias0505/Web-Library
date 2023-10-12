package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.user.UserDAO;
import biz.user.UserVO;
import controller.Controller;

public class LoginController implements Controller {
 @Override
 public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
     String id = request.getParameter("id");
     String password = request.getParameter("password");
     UserVO vo = new UserVO();
     vo.setId(id);
     vo.setPassword(password);

     UserDAO dao = new UserDAO();
     UserVO user = dao.getUser(vo);

     if (user != null) {
         HttpSession session = request.getSession();
         session.setAttribute("user", user);
         return "main2.do";
     } else {
    	 request.setAttribute("errorMessage", "아이디와 비밀번호가 일치하지 않습니다.");
         return "Login.jsp";
     }
 }
}

