package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.user.UserDAO;
import biz.user.UserVO;
import controller.Controller;

public class UserDeleteController implements Controller {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        String[] deleteUsers = request.getParameterValues("deleteuser");

        if (deleteUsers != null && deleteUsers.length > 0) {
            UserDAO userDao = new UserDAO();

            for (String userId : deleteUsers) {
                UserVO user = new UserVO();
                user.setId(userId);
                userDao.deleteUser(user);
            }
        }

        return "Mypage.jsp"; // 삭제 후에 보여줄 화면의 경로를 반환합니다.
    }
}
