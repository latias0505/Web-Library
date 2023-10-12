package controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.board.BoardDAO;
import biz.board.BoardVO;
import controller.Controller;

public class SearchBoardController implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String searchType = request.getParameter("searchType");
	    String keyword = request.getParameter("keyword");
	
	BoardVO vo = new BoardVO();
	vo.setSearchType(searchType);
    vo.setKeyword(keyword);
	
	BoardDAO dao = new BoardDAO();
	List<BoardVO> boardList = dao.SearchBoardList(vo);
	
	request.setAttribute("boardList", boardList);
	
	return "GetBoardList.jsp" ;
	}
}
 