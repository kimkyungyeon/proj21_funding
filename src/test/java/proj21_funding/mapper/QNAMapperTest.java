package proj21_funding.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.junit.After;
import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import proj21_funding.config.ContextRoot;
import proj21_funding.dto.Admin;
import proj21_funding.dto.BoardCategory;
import proj21_funding.dto.QNA;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.paging.Pagination;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class QNAMapperTest {

	private static final Log log = LogFactory.getLog(QNAMapperTest.class);
	
	@Autowired
	private QNAMapper mapper;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	//@Test
	public void test06SelectQNAAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		List<QNA> list = mapper.selectQNAAll();
		Assert.assertNotNull(list);
		list.stream().forEach(s -> log.debug(s.toString()));
	}
	
	//@Test
	public void test03SelectQNAByUserId() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		int userNo = 1;
		List<QNA> qna = mapper.selectQNAByUserId(userNo);
		log.debug(qna.toString());
		Assert.assertNotNull(qna);
	}
	
	//@Test
	public void test05SelectQNAByBC() {

		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		int categoryNo = 2;
		List<QNA> qna = mapper.selectQNAByBC(categoryNo);
		log.debug(qna.toString());
		Assert.assertNotNull(qna);
	}

	//@Test
	public void test01InsertQNA() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		QNA qna = new QNA(new UserInfo(1), new BoardCategory(2), "qna 작업 진행?", "잘 되어 감?", null);
		int res = mapper.insertQNA(qna);
		Assert.assertEquals(1, res);
		log.debug("res id >> " + res);
	}

	//@Test
	public void test02UpdateQNA() {
		QNA qna = new QNA(3, new Admin(1), "잘 모르겠음");
		int res = mapper.updateQNA(qna);
		Assert.assertEquals(1, res);
		log.debug("res id >> " + res);
	}

	//@Test
	public void test04DeleteQNA() {
		int qnaNo = 7;
		int res = mapper.deleteQNA(qnaNo);
		Assert.assertEquals(1, res);
		log.debug("res id >> " + res);
	}
}
