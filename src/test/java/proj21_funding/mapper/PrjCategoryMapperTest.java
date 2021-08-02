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
import proj21_funding.dto.PrjCategory;
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@WebAppConfiguration
public class PrjCategoryMapperTest {
	
	protected static final Log log = LogFactory.getLog(PrjCategoryMapperTest.class);
	
	@Autowired
	private PrjCategoryMapper mapper;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void testShowCategory() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		List<PrjCategory> list =mapper.showCategory();
		System.out.println(list);
		
		Assert.assertNotNull(list);
	}

}
