package controller;

import dao.BoardDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model2.Controller;
import vo.Board;

/*
 * http://localhost/model2/board/read.hta 요청을 처리하는 컨트롤러다.
 */
public class BoardReadController implements Controller {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardReadController의 process(request, response)가 실행됨");
		
		// 요청객체에서 요청파라미터값(no) 조회
		int no = Integer.parseInt(request.getParameter("no"));
		
		// 번호에 해당하는 게시글 정보 조회 및 조회수 변경
		BoardDao boardDao = new BoardDao();
		Board board = boardDao.getBoardByNo(no);
		
		board.setReadCnt(board.getReadCnt() + 1);
		boardDao.updateBoard(board);
		
		return "redirect:detail.hta?no=" + no;
	}
}
