package controller;

import java.util.HashMap;
import java.util.Map;

import controller.board.BookInOwnerController;
import controller.board.BookOutnOwnerController;
import controller.board.DeleteBoardController;
import controller.board.GetBoardController;
import controller.board.GetBoardListController;
import controller.board.InsertBoardController;
import controller.board.InsertBoardGoController;
import controller.board.SearchBoardController;
import controller.board.UpdateBoardController;
import controller.user.DeleteController;
import controller.user.InsertUserController;
import controller.user.InsertUserGoController;
import controller.user.LoginController;
import controller.user.LoginGoController;
import controller.user.LogoutController;
import controller.user.Main2Controller;
import controller.user.MainPageGoController;
import controller.user.MakeAdminController;
import controller.user.MovieController;
import controller.user.MydataGoController;
import controller.user.MypageGoController;
import controller.user.UpdateUserDataController;
import controller.user.UserDataCheckController;
import controller.user.UserDeleteController;
import controller.user.WantadminController;

public class HandlerMapping {

	private Map<String, Controller> mappings;
	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		mappings.put("/insertUser.do", new InsertUserController());
		mappings.put("/login.do", new LoginController());
		mappings.put("/logout.do", new LogoutController());
		mappings.put("/insertBoard.do", new InsertBoardController());
		mappings.put("/getBoardList.do", new GetBoardListController());
		mappings.put("/updateBoard.do", new UpdateBoardController());
		mappings.put("/deleteBoard.do", new DeleteBoardController());
		mappings.put("/getBoard.do", new GetBoardController());
		mappings.put("/searchBoard.do", new SearchBoardController());
		mappings.put("/InsertBoardGo.do", new InsertBoardGoController());
		mappings.put("/main2.do", new Main2Controller());
		mappings.put("/InsertUserGo.do", new InsertUserGoController());
		mappings.put("/logingo.do", new LoginGoController());
		mappings.put("/mypage.do", new MypageGoController());
		mappings.put("/wantadmin.do", new WantadminController());
		mappings.put("/delete.do", new DeleteController());
		mappings.put("/MydataGo.do", new MydataGoController());
		mappings.put("/UpdateUserData.do", new UpdateUserDataController());
		mappings.put("/userdata.do", new UserDataCheckController());
		mappings.put("/bookinowner.do", new BookInOwnerController());
		mappings.put("/BookOutOwner.do", new BookOutnOwnerController());
		mappings.put("/userdelete.do", new UserDeleteController());
		mappings.put("/makeadmin.do", new MakeAdminController());
		mappings.put("/mainpagego.do", new MainPageGoController());
		mappings.put("/movie.do", new MovieController());
	}
	public Controller getController(String path) {
		return mappings.get(path); 
	}
}
