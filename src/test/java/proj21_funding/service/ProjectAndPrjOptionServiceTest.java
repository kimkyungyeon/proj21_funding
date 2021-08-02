package proj21_funding.service;

import java.time.LocalDate;
import java.util.HashMap;
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
import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.mapper.PrjOptionMapper;
import proj21_funding.mapper.ProjectMapper;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {ContextRoot.class})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class ProjectAndPrjOptionServiceTest {
    protected static final Log log = LogFactory.getLog(ProjectAndPrjOptionServiceTest.class);
	
	private LocalDate date =LocalDate.of(2021, 06, 14);
	@Autowired
	private ProjectMapper pMapper;
	
	@Autowired
	private PrjOptionMapper prjOptMapper;
	
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}
	
	@Test
	public void testTrJoinPrjAndPrjOpt_Success() {
        log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
        
    	Project project = new Project(new UserInfo(2), new PrjCategory(2),"트렌젝션성공!!!!!!!", "제발,,,,", 3000000, date, date);
    	int res = pMapper.insertProject(project);
    	System.out.println(" res" + res);
    	
    	PrjOption prjoption = new PrjOption(new Project(project.getPrjNo()), "분식!!!!!!2", 4000000, "옵션d");
    	System.out.println(prjoption);
    	res += prjOptMapper.insertPrjOption(prjoption);
    	Assert.assertEquals(2, res);
    	System.out.println("final res" +res);       
        
	}
	
	@Test
	public void testTrRemovePrjAndPrjOpt_Success() {
        log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
        
        int res = prjOptMapper.removePrjOption(6);
        System.out.println("res1 >>  " + res);
        
        res += pMapper.removeProject(6);
        Assert.assertEquals(2, res);
        System.out.println("final res >> " +res);    
        

	}
	@Test
	public void testTrUpdateOptionByMap_Success() {
        log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
        
    	Map<String, Object> map = new HashMap<String, Object>();
		map.put("addOptNo1", 518);
		map.put("addOptName1", "111111");
		map.put("addOptPrice1", 20000);
		map.put("addOptContent1", "2222");
		map.put("addOptNo2", 519);
		map.put("addOptName2", "ddd");
		map.put("addOptPrice2", 850000);
		map.put("addOptContent2", "ma22");
		
		int res = prjOptMapper.updateAllAddOptionsByMap(map);
		
		map.put("addOptNo3", 520);
		map.put("addOptName3", "ㄱㄱㄱㄱ");
		map.put("addOptPrice3", 10000000);
		map.put("addOptContent3", "map2222");
		res += prjOptMapper.updateSubOptByMap(map);
		Assert.assertEquals(3, res);
        

	}

}
