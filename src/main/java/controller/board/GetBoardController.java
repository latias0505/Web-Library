package controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.board.BoardDAO;
import biz.board.BoardVO;
import biz.user.UserVO;
import controller.Controller;

public class GetBoardController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String seq = request.getParameter("seq");
		BoardVO vo = new BoardVO();
		vo.setSeq(Integer.parseInt(seq));
		
		BoardDAO dao = new BoardDAO();
		BoardVO board = dao.getBoard(vo);
		
		request.setAttribute("board", board);
		
		// user 객체 가져오기
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("user");
		request.setAttribute("user", user);
		
		return "GetBoard.jsp";
	}
}

