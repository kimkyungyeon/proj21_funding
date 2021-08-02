package proj21_funding.mapper;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
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
import proj21_funding.dto.account.UserInfo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class UserInfoMapperTest {

	private static final Log log = LogFactory.getLog(UserInfoMapperTest.class);

	@Autowired
	private UserInfoMapper mapper;

//	@After
//	public void tearDown() throws Exception {
//		System.out.println();
//	}
//
//	@Test
//	public void test07SelectUserAll() {
//		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
//
//		List<UserInfo> list = mapper.selectUserAll();
//		Assert.assertNotNull(list);
//		list.stream().forEach(s -> log.debug(s.toString()));
//	}

	@Test
	public void test02SelectUserbyId() {
		String userId = "test10";
		UserInfo userInfo = mapper.selectUserbyId(userId);
	}
		
	@Test
	public void test01SelectUserbyNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		int userNo = 1;
		UserInfo userInfo = mapper.selectUserbyNo(userNo);
		log.debug(userInfo.toString());
		Assert.assertNotNull(userInfo);
	}

//	@Test
//	public void test02SelectUserbyId() {
//		String userId = "test1";
//		UserInfo userInfo = mapper.selectUserbyId(userId);
//		log.debug(userInfo.toString());
//		Assert.assertNotNull(userInfo);
//	}

////	@Test
//	public void test03SelectUserbyEmail() {
//		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
//
//		String email = "test@test.com";
//		UserInfo userInfo = mapper.selectUserbyEmail(email);
//		log.debug(userInfo.toString());
//		Assert.assertNotNull(userInfo);
//	}

//	@Test
//	public void test04InsertMember() {
//		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
//
//		UserInfo userInfo = new UserInfo("test02", "1111", "1111", "test01","010-1234-1234", 111222, "대구", "", "", "농협", 33);
//		int res = mapper.insertUser(userInfo);
//		Assert.assertEquals(1, res);
//		log.debug("res id >> " + res);
//	}

//	@Test
//	public void test05UpdateMember() {
//		UserInfo userInfo = new UserInfo("test02", "1111", "1111", "test11", "대구", "", "", 33, "농협");
//		int res = mapper.updateUser(userInfo);
//		Assert.assertEquals(1, res);
//		log.debug("res id >> " + res);
//	}

////	@Test
//	public void test06DeleteMember() {
//		int userNo = 3;
//		int res = mapper.deleteUser(userNo);
//		Assert.assertEquals(1, res);
//		log.debug("res id >> " + res);
//	}
	@Test
	public void testShowBankAccount() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		int userNo = 1;
		UserInfo userInfo = mapper.showBankAccount(userNo);
		System.out.println("userInfo >> "+ userInfo);
		Assert.assertNotNull(userInfo);
	}
	
	@Test
	public void test05UpdateMember() {
		UserInfo userInfo = new UserInfo(4, "농협", "22222222-222-222", "kk");
		int res = mapper.updateBankAccount(userInfo);
		Assert.assertEquals(1, res);
		
	}

}
