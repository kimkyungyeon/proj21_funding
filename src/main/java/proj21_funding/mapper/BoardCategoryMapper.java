package proj21_funding.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_funding.dto.BoardCategory;
@Component
public interface BoardCategoryMapper {
	
	List<BoardCategory> selectBCAll();
	
	BoardCategory selectBCbyNo(int categoryNo);

	BoardCategory selectBCbyName(String categoryName);
	
	List<BoardCategory> selectBCbyClass(String categoryClass);
	
	int insertBC(BoardCategory bc);
	
	int updateBC(BoardCategory bc);
	
	int deleteBC(int categoryNo);
}
