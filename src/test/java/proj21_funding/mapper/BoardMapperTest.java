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
import proj21_funding.dto.Board;
import proj21_funding.dto.BoardCategory;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class BoardMapperTest {

	private static final Log log = LogFactory.getLog(BoardMapperTest.class);
	
	@Autowired
	private BoardMapper mapper;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test07SelectBoardAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		List<Board> list = mapper.selectBoardAll();
		Assert.assertNotNull(list);
		list.stream().forEach(s -> log.debug(s.toString()));
	}

	@Test
	public void test01SelectBoardByNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		int boardNo = 00001;
		Board board = mapper.selectBoardByNo(boardNo);
		log.debug(board.toString());
		Assert.assertNotNull(board);
	}

	@Test
	public void test02SelectBoardByCNo() {
		int categoryNo = 2;
		Board board = mapper.selectBoardByCNo(categoryNo);
		log.debug(board.toString());
		Assert.assertNotNull(board);
	}

	@Test
	public void test05SelectBoardByTitle() {
		String boardTitle = "공지사항";
		Board board = mapper.selectBoardByTitle(boardTitle);
		log.debug(board.toString());
		Assert.assertNotNull(board);
	}

	@Test
	public void test03InsertBoard() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		Board board = new Board(new BoardCategory(1), "공지사항", "금일의 공지사항");
		int res = mapper.insertBoard(board);
		Assert.assertEquals(1, res);
		log.debug("res id >> " + res);
	}

	@Test
	public void test04UpdateBoard() {
		Board board = new Board(3, new BoardCategory(1), "공지사항", "06월 02일 UI 변경 안내");
		int res = mapper.updateBoard(board);
		Assert.assertEquals(1, res);
		log.debug("res id >> " + res);
	}

	@Test
	public void test06DeleteBoard() {
		int boardNo = 3;
		int res = mapper.deleteBoard(boardNo);
		Assert.assertEquals(1, res);
		log.debug("res id >> " + res);
	}

}
