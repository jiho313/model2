package controller;

import dao.BoardDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model2.Controller;
import vo.Board;

/*
 * http://localhost/model2/board/update.hta
 */
public class BoardUpdateController implements Controller {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardUpdateController의 process(request, response)가 실행됨.");
		
		// 로그인체크, 로그인한 고객이 작성한 게시글인지 체크하는 코드는 생략하였음
		
		// 요청객체에서 요청파라미터값(no, title, content) 조회하기
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// 게시글 번호로 데이터베이스에서 현재 게시글 정보를 조회한다.
		BoardDao boardDao = new BoardDao();
		Board board = boardDao.getBoardByNo(no);
		
		// 조회된 게시글정보중에서 제목과 내용을 수정폼에서 입력한 정보롤 변경한다.
		board.setTitle(title);
		board.setContent(content);
		
		// 변경된 정보를 데이터베이스에 반영시킨다.
		boardDao.updateBoard(board);
		
		return "redirect:detail.hta?no=" + no;
	}
}
