package controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.board.BoardDAO;
import biz.board.BoardVO;
import controller.Controller;

public class UpdateBoardController implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String seq = request.getParameter("seq");
		String content = request.getParameter("content");
		String code = request.getParameter("code");
		String shop = request.getParameter("shop");

		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setSeq(Integer.parseInt(seq));
		vo.setCode(code);
		vo.setShop(shop);
		
		BoardDAO dao = new BoardDAO();
		dao.updateBoard(vo);
		return "getBoardList.do";
	}
}
