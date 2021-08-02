package proj21_funding.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.junit.After;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import proj21_funding.config.ContextRoot;
import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {ContextRoot.class})
@WebAppConfiguration
public class PrjOptionMapperTest {
	
	private static final Log log = LogFactory.getLog(PrjOptionMapperTest.class);
	
	@Autowired
	private PrjOptionMapper mapper;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}
//	@Test
	public void testInsertOptionByMap() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pNo", 5);
		map.put("addOptName1", "test1");
		map.put("addOptPrice1", 10000);
		map.put("addOptContent1", "map1");
		int res = mapper.insertOptionByMap(map);
		Assert.assertEquals(1, res);		
	}
	
//	@Test
	public void testInsertPrjOptionsByMap() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pNo", 5);
		map.put("addOptName1", "test1");
		map.put("addOptPrice1", 10000);
		map.put("addOptContent1", "map1");
		map.put("addOptName2", "test2");
		map.put("addOptPrice2", 20000);
		map.put("addOptContent2", "map2");
		int res = mapper.insertPrjOptionsByMap(map);
		Assert.assertEquals(2, res);		
	}
	
//	@Test
	public void testInsertPrjOptionsOfFourByMap() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pNo", 5);
		map.put("addOptName1", "test1");
		map.put("addOptPrice1", 10000);
		map.put("addOptContent1", "map1");
		map.put("addOptName2", "test2");
		map.put("addOptPrice2", 20000);
		map.put("addOptContent2", "map2");
		map.put("addOptName3", "test3");
		map.put("addOptPrice3", 30000);
		map.put("addOptContent3", "map3");
		int res = mapper.insertPrjOptionsOfFourByMap(map);
		Assert.assertEquals(3, res);		
	}

//	@Test
	public void testInsertPrjOption() {
	log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
	PrjOption prjOption = new PrjOption(new Project(4), "프로젝트옵션", 4000000, "옵션d" );
				
		int res = mapper.insertPrjOption(prjOption);
	
		Assert.assertEquals(1, res);		
	}
	
	
//	@Test
	public void testupdateProjectOption() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		PrjOption prjoption = new PrjOption(147, "문방구", 399999, "색종이");
		int res = mapper.updatePrjOption(prjoption);
		
		Assert.assertEquals(1, res);		
	}
	
//	@Test
	public void testupdateOptionByMap() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("addOptNo1", 286);
		map.put("addOptName1", "ㄱㄱㄱㄱ");
		map.put("addOptPrice1", 10000000);
		map.put("addOptContent1", "map2222");
		
		int res = mapper.updateOptionByMap(map);
		Assert.assertEquals(1, res);		
	}	
//	@Test
	public void testupdateAllAddOptionsByMap() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("addOptNo1", 518);
		map.put("addOptName1", "111111");
		map.put("addOptPrice1", 20000);
		map.put("addOptContent1", "2222");
		map.put("addOptNo2", 519);
		map.put("addOptName2", "ddd");
		map.put("addOptPrice2", 850000);
		map.put("addOptContent2", "ma22");
		
		int res = mapper.updateAllAddOptionsByMap(map);
		Assert.assertEquals(2, res);		
	}	
//	@Test
	public void testupdateSubOptionByMap() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("addOptNo3", 520);
		map.put("addOptName3", "ㄱㄱㄱㄱ");
		map.put("addOptPrice3", 10000000);
		map.put("addOptContent3", "map2222");
		System.out.println(map);
		
		int res = mapper.updateSubOptByMap(map);
		Assert.assertEquals(1, res);		
	}	
	
//	@Test
	public void testremoveProjectOption() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		int res = mapper.removePrjOption(9);
		
		Assert.assertEquals(1, res);		
	}
	@Test
	public void testremovePrjOptionOne() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("addOptNo1", 519);
		int res = mapper.removeOptNumOne(map);
		
		Assert.assertEquals(1, res);		
	}
	@Test
	public void testremovePrjOptionTwo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("addOptNo2", 520);
		int res = mapper.removeOptNumTwo(map);
		
		Assert.assertEquals(1, res);		
	}
	@Test
	public void testremovePrjOptionThree() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("addOptNo3", 521);
		int res = mapper.removeOptNumThree(map);
		
		Assert.assertEquals(1, res);		
	}
	
//	@Test
	public void testselectPrjAndPrjOpt() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		List<PrjOption> list = mapper.selectSimplePrjOptionByPrjNo(14);
		Assert.assertNotNull(list);
		System.out.println("list >> " + list);
	}

}
