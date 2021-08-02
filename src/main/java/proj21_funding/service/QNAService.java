package proj21_funding.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import proj21_funding.dto.QNA;
import proj21_funding.dto.paging.Pagination;

@Service
public interface QNAService {

	List<QNA> showQNAAll();

	List<QNA> showQNAByUserId(int userNo);
	
	List<QNA> showQNAByBC(int categoryNo);
	
	QNA showQNAByNo(int qnaNo);
	
	int uploadQNA (QNA qna);
	
	int replyQNA (QNA qna);
	
	int removeQNA (int qnaNo);
	
	int updateQNA(QNA qna);

//	페이징 시도중
	List<Map<String, Object>> SelectAllList (Pagination pagination) throws Exception;

	List<Map<String, Object>> SelectUserList (int userNo, Pagination pagination) throws Exception;
	
	int QNACount() throws Exception;
	int QNAReplyCount() throws Exception;
	
	int QNAUserCount(int userNo) throws Exception;
//	adminQna
	List<QNA> selectQnaListByMap(Map<String,Object> map);
	int selectQnaCountByMap(Map<String,Object> map);


}
