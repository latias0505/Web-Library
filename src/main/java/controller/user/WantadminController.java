package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.user.UserDAO;
import biz.user.UserVO;
import controller.Controller;

public class WantadminController implements Controller {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("user");

        if (user != null) {
            UserDAO dao = new UserDAO();
            user.setStatus("want");
            dao.updateStatus(user);
        }

        return "mypage.do";
    }
}
