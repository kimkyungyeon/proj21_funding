package proj21_funding.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import proj21_funding.dto.Board;
import proj21_funding.dto.paging.Pagination;

@Service
public interface BoardService {
	
	List<Board> showBoardAll();

	Board showBoardByNo(int boardNo);
	
	Board showBoardByCNo(int CategoryNo);
	
	Board showBoardByTitle(String title);
	
	int uploadBoard (Board board);
	
	int modifyBoard (Board board);
	
	int removeBoard (int boardNo);
	
//	페이징 시도중
	List<Map<String, Object>> SelectAllList (Pagination pagination) throws Exception;
	
	List<Map<String, Object>> SelectCategoryList (int categoryNo, Pagination pagination) throws Exception;
	
	int BoardCount() throws Exception;
	
	int BoardCategoryCount(int categoryNo) throws Exception;
//	
//	List<Map<String, Object>> selectBoardCategoryList(Pagination pagination) throws Exception;
	List<Board> selectBoardCategoryList(Pagination pagination) throws Exception;
	List<Board> selectBoardCategoryListForCount() throws Exception;
	List<Board> selectSearchBoardList(Map<String,Object> map) throws Exception;
	List<Board> selectSearchBoardListAdmin(Map<String,Object> map) throws Exception;
	int selectSearchBoardListCount(Map<String,Object> map);
	int selectSearchBoardListAdminCount(Map<String,Object> map);
	int selectSearchBoardListCountCategory(Map<String,Object> map);
	List<Board> selectSearchBoardListCategory(Map<String,Object> map);


	
}
