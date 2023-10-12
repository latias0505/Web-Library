package controller.board;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.board.BoardDAO;
import biz.board.BoardVO;
import controller.Controller;

public class InsertBoardController implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String code = request.getParameter("code");
	String shop = request.getParameter("shop");
	
	BoardVO vo = new BoardVO();
	vo.setTitle(title);
	vo.setWriter(writer);
	vo.setContent(content);
	vo.setShop(shop);
	vo.setCode(code);
	
	BoardDAO dao = new BoardDAO();
	dao.insertBoard(vo);
	
	return "getBoardList.do" ;
	}

}
