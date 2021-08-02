package proj21_funding.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.QNA;
import proj21_funding.dto.paging.Pagination;
import proj21_funding.mapper.QNAMapper;
import proj21_funding.service.QNAService;

@Service
public class QNAImpl implements QNAService {
	
	@Autowired
	QNAMapper mapper;

	@Override
	public List<QNA> showQNAAll() {
		List<QNA> list = mapper.selectQNAAll();
		return list;
	}

	@Override
	public List<QNA> showQNAByUserId(int userNo) {
		List<QNA> list = mapper.selectQNAByUserId(userNo);
		return list;
	}

	@Override
	public List<QNA> showQNAByBC(int categoryNo) {
		List<QNA> list = mapper.selectQNAByBC(categoryNo);
		return list;
	}

	@Override
	public QNA showQNAByNo(int qnaNo) {
		QNA qna = mapper.selectQNAByNo(qnaNo);
		return qna;
	}
	
	@Override
	public int uploadQNA(QNA qna) {
		return mapper.insertQNA(qna);
	}

	@Override
	public int replyQNA(QNA qna) {
		return mapper.updateQNA(qna);
	}

	@Override
	public int removeQNA(int qnaNo) {
		return mapper.deleteQNA(qnaNo);
	}

	@Override
	public List<Map<String, Object>> SelectAllList(Pagination pagination) throws Exception {
		return mapper.SelectAllList(pagination);
	}

	@Override
	public int QNACount() throws Exception {
		return mapper.QNACount();
	}

	@Override
	public List<Map<String, Object>> SelectUserList(int userNo, Pagination pagination) throws Exception {
		return mapper.SelectUserList(userNo, pagination.getPageSearch(), pagination.getCntPerPage());
	}

	@Override
	public int QNAUserCount(int userNo) throws Exception {
		return mapper.QNAUserCount(userNo);
	}

	@Override
	public List<QNA> selectQnaListByMap(Map<String, Object> map) {
		return mapper.selectQnaListByMap(map);
	}

	@Override
	public int selectQnaCountByMap(Map<String, Object> map) {
		return mapper.selectQnaCountByMap(map);
	}

	@Override
	public int updateQNA(QNA qna) {
		return mapper.updateQNA(qna);
	}

	@Override
	public int QNAReplyCount() throws Exception {
		return mapper.QNAReplyCount();
	}

}
