package proj21_funding.mapper;

import java.util.List;

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
import proj21_funding.dto.BoardCategory;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class BoardCategoryMapperTest {

	private static final Log log = LogFactory.getLog(BoardCategoryMapperTest.class);
	
	@Autowired
	private BoardCategoryMapper mapper;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test06SelectBCAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		List<BoardCategory> list = mapper.selectBCAll();
		Assert.assertNotNull(list);
		list.stream().forEach(s -> log.debug(s.toString()));
	}

	@Test
	public void test01SelectBCbyNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		int categoryNo = 1;
		BoardCategory bc = mapper.selectBCbyNo(categoryNo);
		log.debug(bc.toString());
		Assert.assertNotNull(bc);
	}

	@Test
	public void test04SelectBCbyName() {
		String categoryName = "종료된 이벤트";
		BoardCategory bc = mapper.selectBCbyName(categoryName);
		log.debug(bc.toString());
		Assert.assertNotNull(bc);
	}

//	@Test
	public void test07SelectBCbyClass() {
		String categoryClass = "board";
//		BoardCategory bc = mapper.selectBCbyClass(categoryClass);
//		log.debug(bc.toString());
//		Assert.assertNotNull(bc);
	}

	@Test
	public void test02InsertBC() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		BoardCategory bc = new BoardCategory(3, "업데이트", "board");
		int res = mapper.insertBC(bc);
		Assert.assertEquals(1, res);
		log.debug("res id >> " + res);
	}

	@Test
	public void test03UpdateBC() {
		BoardCategory bc = new BoardCategory(3, "종료된 이벤트", "board");
		int res = mapper.updateBC(bc);
		Assert.assertEquals(1, res);
		log.debug("res id >> " + res);
	}

	@Test
	public void test05DeleteBC() {
		int categoryNo = 3;
		int res = mapper.deleteBC(categoryNo);
		Assert.assertEquals(1, res);
		log.debug("res id >> " + res);
	}

}
