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
import proj21_funding.dto.Project;
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@WebAppConfiguration
public class MyListMapperTest {

	protected static final Log log = LogFactory.getLog(ProjectMapperTest.class);
	
	
	@Autowired
	private MyListMapper mapper;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void testShowAllMyList() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Project> list = mapper.showAllMyList(1);
		Assert.assertNotNull(list);
	}	
	
	@Test
	public void testShowDetailListAddTarget() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Project> list = mapper.showDetailListByprjNo(1);
		Assert.assertNotNull(list);
	}	
	
//	@Test
	public void testJoinUpdateProjectAndPrjOptionInMyList() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pNo", 3);
		map.put("pName", "프로젝트테스트");
		map.put("pContent", "업데이트");
		map.put("oName", "연필5자루");
		map.put("oContent", "문방사우");
		
		System.out.println("map  >> "+ map);
		int res = mapper.joinUpdateProjectAndPrjOptionByPrjNoInMyLIst(map);
		Assert.assertEquals(2, res);
		
		
	}
	
	@Test
	public void testShowMyListByMap() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uNo", 1);
		map.put("pageSearch", 1);
		map.put("cntPerPage", 5);
		System.out.println("map  >> "+ map);
		List<Project> list = mapper.showAllListByMap(map);
		
		Assert.assertNotNull(list);		
		
	}
	
	@Test
	public void testshowCountPrjByUserNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uNo", 1);
		System.out.println("map  >> "+ map);
		int res = mapper.selectCountPrjByUserNo(map);
		
		Assert.assertEquals(2, res);
		
	}
	@Test
	public void testdeleteCascadeProjectByMap() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pNo", 3);
		System.out.println("map  >> "+ map);
		int res = mapper.deleteCascadeProjectByMap(map);
		
		Assert.assertEquals(1, res);
		
	}
	
	
	


}
