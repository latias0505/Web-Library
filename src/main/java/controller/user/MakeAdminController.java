package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import biz.user.UserDAO;

public class MakeAdminController implements Controller {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        String ids = request.getParameter("ids");

        // ids를 쉼표(,)를 기준으로 분리하여 개별 id 값을 가져옵니다.
        String[] idArray = ids.split(",");

        UserDAO userDAO = new UserDAO();
        for (String id : idArray) {
            // 업데이트할 role과 status 값을 설정합니다.
            String role = "Admin";
            String status = "notwant";

            // 해당 사용자의 role과 status를 업데이트합니다.
            userDAO.updateRole(id, role);
            userDAO.updateStatus(id, status);
        }

        // 업데이트 후 리다이렉트할 페이지를 반환합니다.
        return "Mypage.jsp";
    }
}
