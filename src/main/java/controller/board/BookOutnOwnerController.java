package controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import biz.board.BoardDAO;

public class BookOutnOwnerController implements Controller {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        String code = request.getParameter("code"); // 요청 파라미터에서 code 값을 가져옵니다.

        // 데이터베이스에서 owner 값을 "none"으로 업데이트합니다.
        BoardDAO boardDAO = new BoardDAO();
        boardDAO.updateBoardOwner("none", code);

        // owner 값을 업데이트한 후 원하는 페이지로 리다이렉트합니다.
        return "Mypage.jsp";
    }
}
