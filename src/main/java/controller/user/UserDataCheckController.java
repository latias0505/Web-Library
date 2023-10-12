package controller.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import biz.user.UserDAO;
import biz.user.UserVO;

public class UserDataCheckController implements Controller {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        UserDAO userDAO = new UserDAO();
        List<UserVO> userList = userDAO.getAllUsers();
        
        request.setAttribute("userList", userList);
        
        return "UserDataCheck.jsp";
    }
}
