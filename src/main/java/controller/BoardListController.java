package controller;

import java.util.List;

import dao.BoardDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model2.Controller;
import util.Pagination;
import util.StringUtils;
import vo.Board;

/*
 * localhost/model2/board/list.hta 요청을 처리하는 컨트롤러다.
 */
public class BoardListController implements Controller {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardListController의 process(request, response) 실행됨");
		
		// 요청객체에서 요청파라미터값(page) 조회하기
		int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);
		
		// 전체게시글 갯수조회
		BoardDao boardDao = new BoardDao();
		int totalRows = boardDao.getTotalRows();
		System.out.println("BoardListController 전체 갯수 -> " + totalRows);
		// Pagination객체 생성
		Pagination pagination = new Pagination(pageNo, totalRows);
		// 조회범위에 해당하는 게시글 목록 조회
		List<Board> boards = boardDao.getBoards(pagination.getBegin(), pagination.getEnd());
		System.out.println("BoardListController 조회된 데이터 갯수 -> " + boards.size());
		
		// list.jsp에 전달할 정보를 요청객체에 속성으로 저장한다.
		request.setAttribute("paging", pagination);
		request.setAttribute("boardList", boards);
		
		return "board/list.jsp";
	}
}
