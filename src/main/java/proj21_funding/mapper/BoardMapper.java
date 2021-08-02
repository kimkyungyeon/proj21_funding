package proj21_funding.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import proj21_funding.dto.Board;
import proj21_funding.dto.paging.Pagination;
@Component
public interface BoardMapper {
	
	List<Board> selectBoardAll();
	
//	페이징 시도중
		
	List<Map<String, Object>> SelectAllList (Pagination pagination);

	List<Map<String, Object>> SelectCategoryList(@Param("categoryNo") int categoryNo, @Param("pageSearch") int pageSearch, @Param("cntPerPage") int cntPerPage);
	
	int BoardCount();

	int BoardCategoryCount(int categoryNo);
	
//	여기까지
	
	Board selectBoardByNo(int boardNo);
	
	Board selectBoardByCNo(int CategoryNo);
	
	Board selectBoardByTitle(String title);
	
	int insertBoard (Board board);
	
	int updateBoard (Board board);
	
	int deleteBoard (int boardNo);
	
//	List<Map<String, Object>> selectBoardCategoryList(Pagination pagination);
	List<Board> selectBoardCategoryList(Pagination pagination);
	List<Board> selectBoardCategoryListForCount();
	List<Board> selectSearchBoardListAdmin(Map<String,Object> map);
	int selectSearchBoardListAdminCount(Map<String,Object> map);
	int selectSearchBoardListCount(Map<String,Object> map);
	List<Board> selectSearchBoardList(Map<String,Object> map);
	int selectSearchBoardListCountCategory(Map<String,Object> map);
	List<Board> selectSearchBoardListCategory(Map<String,Object> map);

}
