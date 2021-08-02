package proj21_funding.mapper;

import java.time.LocalDate;
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
import proj21_funding.dto.PrjCategory;
import proj21_funding.dto.Project;
import proj21_funding.dto.account.UserInfo;


@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@WebAppConfiguration
public class ProjectMapperTest {
	
	protected static final Log log = LogFactory.getLog(ProjectMapperTest.class);
	
//	LocalDate값은 픽스값으로 하는게 좋음
	private LocalDate date =LocalDate.of(2021, 06, 14);
	
	@Autowired
	private ProjectMapper mapper;	
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

//	@Test
	public void testSelectProjectListAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Project> list = mapper.selectProjectListAll();
		Assert.assertNotNull(list);
	}
	
//	@Test
	public void testSelectProjjectListByNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Project list = mapper.selectProjectByNo(3);
		Assert.assertNotNull(list);
	}
	
	@Test
	public void testShowJoinPrjAndCategory() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Project list = mapper.showJoinPrjAndCategory(21);
		Assert.assertNotNull(list);
	}
	
//	@Test
	public void testselectProjectSuccessImbak() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Project> list = mapper.selectProjectSuccessImbak();
		System.out.println(list);
		
	}
	
//	@Test
	public void testinsertProject() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Project project = new Project(new UserInfo(3), new PrjCategory(3), "인서트성공", "제발,,,,", 3000000,  date, date);
		int res = mapper.insertProject(project);
		
		Assert.assertEquals(1, res);		
	}
	
//@Test
	public void testupdateProject() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Project project = new Project(3, new PrjCategory(2), "업데이트테스트", "제발성공,,,,", 2000000, date,  date);
		int res = mapper.updateProject(project);
		
		Assert.assertEquals(1, res);		
	}

@Test
public void testjoinUpdateProjectAndPrjOption() {
	log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("prjNo.prjNo", 59);
	map.put("pCategoryNo", 2);
	map.put("prjName", "맵테스트1");
	map.put("prjContent", "조인업데이트업4343데이트");
	map.put("prjGoal", 2000000);
	map.put("endDate", date);
	map.put("payDate", date);
	map.put("optName", "제발33333333");
	map.put("optPrice", 300002200);
	map.put("optContent", "진55짜111");
	
	System.out.println("map >> "+ map );
	int res = mapper.joinUpdateProjectAndPrjoptionByPrjNo(map);
	Assert.assertEquals(2, res);		
}

//@Test
public void testremoveProjectOption() {
	log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
	
	int res = mapper.removeProject(8);
	
	Assert.assertEquals(1, res);		
}
	


}
