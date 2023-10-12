package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import controller.Controller;
import biz.user.UserDAO;
import biz.user.UserVO;

public class DeleteController implements Controller {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        // 세션에서 사용자 정보 가져오기
        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("user");

        // 데이터베이스에서 사용자 삭제
        UserDAO userDAO = new UserDAO();
        userDAO.deleteUser(user);

        // 세션 무효화
        session.invalidate();

        // Login.jsp 페이지로 리다이렉트
        return "Login.jsp";
    }
}
