package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import biz.user.UserDAO;
import biz.user.UserVO;

public class MydataGoController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		// 사용자 정보 가져오기
		String userId = (String) request.getSession().getAttribute("userId"); // 예시로 userId를 세션에서 가져옴
		
		// 데이터베이스에서 사용자 정보 조회
		UserDAO userDAO = new UserDAO();
		UserVO user = new UserVO(); // 새로운 UserVO 객체 생성
		user.setId(userId); // 사용자의 ID 설정
		
		// 데이터베이스에서 사용자 정보를 ID로 조회
		user = userDAO.getUser(user);
		
		// 사용자 정보를 request에 저장하여 Mydata.jsp로 전달
		request.setAttribute("user", user);
		
		// Mydata.jsp로 이동
		return "Mydata.jsp";
	}
}
