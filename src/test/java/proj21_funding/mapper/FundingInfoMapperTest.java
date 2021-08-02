package proj21_funding.mapper;

import static org.junit.Assert.fail;

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
import proj21_funding.dto.FundingInfo;
import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
import proj21_funding.dto.account.UserInfo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class FundingInfoMapperTest {
	private static final Log log = LogFactory.getLog(FundingInfoMapperTest.class);
	
	@Autowired
	private FundingInfoMapper mapper;


	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void testSelectCountByPrjNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		int count = mapper.selectCountByPrjNo(1);
		System.out.println(count);
	}

//	@Test
	public void testSelectSumByPrjNo() {
		fail("Not yet implemented");
	}
	
	@Test
	public void testselectFundingInfoByUserNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		System.out.println(mapper.selectFundingInfoByUserNo(1));
		
	}
	
	@Test
	public void testInsertFundingInfo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		FundingInfo fundinginfo = new FundingInfo(new UserInfo(2),new Project(1),new PrjOption(5),"50811105",40971,"대구광역시 북구구암로49길10","702동903호");
		mapper.insertFundingInfo(fundinginfo);
		
		
	}

}
