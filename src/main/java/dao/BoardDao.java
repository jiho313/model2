package dao;

import java.util.List;

import util.DaoHelper;
import vo.Board;
import vo.Customer;

public class BoardDao {

	public int getTotalRows() {
		return DaoHelper.selectOne("getTotalRows", rs -> {
			return rs.getInt("cnt");
		});
	}
	
	public List<Board> getBoards(int begin, int end) {
		return DaoHelper.selectList("getBoards", rs -> {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setCommentCnt(rs.getInt("board_comment_cnt"));
			board.setReadCnt(rs.getInt("board_read_cnt"));
			board.setCreateDate(rs.getDate("board_create_date"));
			
			Customer customer = new Customer();
			customer.setId(rs.getString("cust_id"));
			customer.setName(rs.getString("cust_name"));
			board.setCustomer(customer);			
			
			return board;
		}, begin, end);
	}
	
	public void insertBoard(Board board) {
		DaoHelper.update("insertBoard", board.getTitle(), board.getContent(), board.getCustomer().getId());
	}
	
	public void updateBoard(Board board) {
		DaoHelper.update("updateBoard", board.getTitle(), 
										board.getContent(), 
										board.getReadCnt(), 
										board.getCommentCnt(), 
										board.getDeleted(), 
										board.getNo());
	}
	
	public Board getBoardByNo(int no) {
		return DaoHelper.selectOne("getBoardByNo", rs -> {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setContent(rs.getString("board_content"));
			board.setCommentCnt(rs.getInt("board_comment_cnt"));
			board.setReadCnt(rs.getInt("board_read_cnt"));
			board.setDeleted(rs.getString("board_deleted"));			
			board.setUpdateDate(rs.getDate("board_update_date"));
			board.setCreateDate(rs.getDate("board_create_date"));
			
			Customer customer = new Customer();
			customer.setId(rs.getString("cust_id"));
			customer.setName(rs.getString("cust_name"));
			board.setCustomer(customer);				
			
			return board;
		}, no);
	}
}
