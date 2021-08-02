package proj21_funding.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import proj21_funding.dto.QNA;
import proj21_funding.dto.paging.Pagination;

@Component
public interface QNAMapper {
	
	List<QNA> selectQNAAll();
	
//	페이징 시도중
		
	List<Map<String, Object>> SelectAllList (Pagination pagination);

	List<Map<String, Object>> SelectUserList (@Param("userNo") int userNo, @Param("pageSearch") int pageSearch, @Param("cntPerPage") int cntPerPage);
	
	int QNACount();
	int QNAReplyCount();

	int QNAUserCount(int userNo);
	
//	여기까지
	
	List<QNA> selectQNAByUserId(int userNo);
	
	List<QNA> selectQNAByBC(int categoryNo);

	QNA selectQNAByNo(int qnaNo);
	
	int insertQNA(QNA qna);
	
	int updateQNA(QNA qna);
	
	int deleteQNA(int qnaNo);
	
//admin에서 리스트
	
	List<QNA> selectQnaListByMap(Map<String,Object> map);
	int selectQnaCountByMap(Map<String,Object> map);
	
}
