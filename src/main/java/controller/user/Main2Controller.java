package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.user.UserVO;
import controller.Controller;

public class Main2Controller implements Controller {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("user");
        
        // user 객체를 main2.jsp로 전달하기 위해 request 속성에 설정
        request.setAttribute("user", user);
        
        return "main2.jsp";
    }
}
