package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.user.UserDAO;
import biz.user.UserVO;
import controller.Controller;

public class InsertUserController implements Controller {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
        }

        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String role ="User";

        UserVO vo = new UserVO();
        vo.setId(id);
        vo.setPassword(password);
        vo.setName(name);
        vo.setPhone(phone);
        vo.setRole(role);

        UserDAO dao = new UserDAO();

        if (dao.isIdExists(id)) {
            request.setAttribute("message", "이미 등록된 아이디입니다."); // 경고 메시지 설정
            return "InsertUser.jsp";
        }

        if (dao.isNameExists(name)) {
            request.setAttribute("message", "이미 등록된 이름입니다."); // 경고 메시지 설정
            return "InsertUser.jsp";
        }

        if (dao.isPhoneExists(phone)) {
            request.setAttribute("message", "이미 등록된 전화번호입니다."); // 경고 메시지 설정
            return "InsertUser.jsp";
        }

        dao.insertUser(vo);

        return "Login.jsp";
    }
}
