 package proj21_funding.mapper;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.junit.After;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import proj21_funding.config.ContextRoot;
import proj21_funding.dto.project.ProjectJoin;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class ProjectJoinMapperTest {
	private static final Log log = LogFactory.getLog(ProjectJoinMapperTest.class);

	@Autowired
	private ProjectJoinMapper mapper;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void testSelectProjectJoinAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<ProjectJoin> list = mapper.selectProjectJoinAll();
		
		for (ProjectJoin p: list) {
			System.out.println(p);
		}
	}
	
	@Test
	public void testSelectProjectJoinByPrjName() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<ProjectJoin> list = mapper.selectProjectJoinByPrjName("기");
		
		for (ProjectJoin p: list) {
			System.out.println(p);
		}
	}
	
	@Test
	public void testSelectProjectJoinByPrjManager() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<ProjectJoin> list = mapper.selectProjectJoinByPrjManager("k");
		
		for (ProjectJoin p: list) {
			System.out.println(p);
		}
	}

}
