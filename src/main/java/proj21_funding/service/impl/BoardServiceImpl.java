package proj21_funding.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.Board;
import proj21_funding.dto.paging.Pagination;
import proj21_funding.mapper.BoardMapper;
import proj21_funding.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper mapper;
	
	@Override
	public List<Board> showBoardAll() {
		List<Board> list = mapper.selectBoardAll();
		return list;
	}

	@Override
	public Board showBoardByNo(int boardNo) {
		return mapper.selectBoardByNo(boardNo);
	}

	@Override
	public Board showBoardByCNo(int CategoryNo) {
		return mapper.selectBoardByCNo(CategoryNo);
	}

	@Override
	public Board showBoardByTitle(String title) {
		return mapper.selectBoardByTitle(title);
	}

	@Override
	public int uploadBoard(Board board) {
		Board newboard = new Board(board.getCategoryNo(), board.getBoardTitle(), board.getBoardContent());
		return mapper.insertBoard(newboard);
	}

	@Override
	public int modifyBoard(Board board) {
		return mapper.updateBoard(board);
	}

	@Override
	public int removeBoard(int boardNo) {
		return mapper.deleteBoard(boardNo);
	}
	
//	페이징

	@Override
	public List<Map<String, Object>> SelectAllList(Pagination pagination) throws Exception {
		return mapper.SelectAllList(pagination);
	}

	@Override
	public int BoardCount() throws Exception {
		return mapper.BoardCount();
	}

	@Override
	public List<Map<String, Object>> SelectCategoryList(int categoryNo, Pagination pagination) throws Exception {
		return mapper.SelectCategoryList(categoryNo, pagination.getPageSearch(), pagination.getCntPerPage());
	}

	@Override
	public int BoardCategoryCount(int categoryNo) throws Exception {
		return mapper.BoardCategoryCount(categoryNo);
	}

//	@Override
//	public List<Map<String, Object>> selectBoardCategoryList(Pagination pagination) throws Exception {
//		return mapper.selectBoardCategoryList(pagination);
//	}
	
	@Override
	public List<Board> selectBoardCategoryList(Pagination pagination) throws Exception {
		return mapper.selectBoardCategoryList(pagination);
	}

	@Override
	public List<Board> selectBoardCategoryListForCount() throws Exception {
		return mapper.selectBoardCategoryListForCount();
	}

	@Override
	public List<Board> selectSearchBoardList(Map<String,Object> map) {
		return mapper.selectSearchBoardList(map);
	}

	@Override
	public int selectSearchBoardListCount(Map<String, Object> map) {
		return mapper.selectSearchBoardListCount(map);
	}

	@Override
	public List<Board> selectSearchBoardListAdmin(Map<String, Object> map) throws Exception {
		return mapper.selectSearchBoardListAdmin(map);
	}

	@Override
	public int selectSearchBoardListAdminCount(Map<String, Object> map) {
		return mapper.selectSearchBoardListAdminCount(map);
	}

	@Override
	public int selectSearchBoardListCountCategory(Map<String, Object> map) {
		return mapper.selectSearchBoardListCountCategory(map);
	}

	@Override
	public List<Board> selectSearchBoardListCategory(Map<String, Object> map) {
		return mapper.selectSearchBoardListCategory(map);
	}

// 끝
}
