package controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.board.BoardDAO;
import biz.board.BoardVO;
import biz.user.UserVO;
import controller.Controller;

public class BookInOwnerController implements Controller {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("user"); // 세션에서 사용자 정보를 가져옵니다

        String code = request.getParameter("code"); // 요청 파라미터에서 책 코드를 가져옵니다

        BoardVO board = new BoardVO();
        board.setCode(code);
        board.setOwner(user.getName()); // 소유자를 로그인된 사용자의 사용자명으로 설정합니다

        BoardDAO boardDAO = new BoardDAO();
        boardDAO.updateBoardOwner(board); // 데이터베이스에서 소유자 값을 업데이트합니다

        return "getBoardList.do"; // 게시글 목록 페이지로 리다이렉트합니다
    }
}
