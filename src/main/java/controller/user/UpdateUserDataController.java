package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import biz.user.UserDAO;
import biz.user.UserVO;

public class UpdateUserDataController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		// 입력된 사용자 정보 가져오기
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		// 데이터베이스에서 사용자 정보 업데이트
		UserDAO userDAO = new UserDAO();
		UserVO user = new UserVO();
		user.setId(id);
		user.setPassword(password);
		user.setName(name);
		user.setPhone(phone);
		userDAO.updateUser(user); // 사용자 정보를 업데이트하는 메소드를 가정
		
		// 마이페이지로 이동
		return "Mypage.jsp";
	}
}
