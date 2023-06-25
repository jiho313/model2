package controller;

import dao.BoardDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model2.Controller;
import vo.Board;

/*
 * http://localhost/model2/board/updateform.hta 요청을 처리하는 컨트롤러다.
 */
public class BoardUpdateformController implements Controller {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardUpdatformController의 process(request, response)가 실행됨");
		
		// 요청객체에서 요청파라미터값(no)를 조회한다.
		int no = Integer.parseInt(request.getParameter("no"));
		
		// 게시글 정보를 조회한다.
		BoardDao boardDao = new BoardDao();
		Board board = boardDao.getBoardByNo(no);
		
		// 수정폼에 게시글 정보를 전달하기 위해서 요청객체에 속성으로 저장한다.
		request.setAttribute("board", board);
		
		return "board/updateform.jsp";
	}
}
