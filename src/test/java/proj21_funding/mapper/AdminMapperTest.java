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
import proj21_funding.dto.Admin;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class AdminMapperTest {

	private static final Log log = LogFactory.getLog(AdminMapperTest.class);
	
	@Autowired
	private AdminMapper mapper;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test07SelectAdminAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		List<Admin> list = mapper.selectAdminAll();
		Assert.assertNotNull(list);
		list.stream().forEach(s -> log.debug(s.toString()));
	}

	@Test
	public void test01SelectAdminbyNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		int adminNo = 00001;
		Admin admin = mapper.selectAdminbyNo(adminNo);
		log.debug(admin.toString());
		Assert.assertNotNull(admin);
	}

	@Test
	public void test02SelectAdminbyId() {
		String adminId = "admin1";
		Admin admin = mapper.selectAdminbyId(adminId);
		log.debug(admin.toString());
		Assert.assertNotNull(admin);
	}

	@Test
	public void test05SelectAdminbyName() {
		String adminName = "유한솔";
		Admin admin = mapper.selectAdminbyName(adminName);
		log.debug(admin.toString());
		Assert.assertNotNull(admin);
	}

	@Test
	public void test03InsertAdmin() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		Admin admin = new Admin("admin2", "0000", "유한솔", "010-1111-1111");
		int res = mapper.insertAdmin(admin);
		Assert.assertEquals(1, res);
		log.debug("res id >> " + res);
	}

	@Test
	public void test04UpdateAdmin() {
		Admin admin = new Admin("admin2", "1111", "유한솔", "010-1111-1122");
		int res = mapper.updateAdmin(admin);
		Assert.assertEquals(1, res);
		log.debug("res id >> " + res);
	}

	@Test
	public void test06DeleteAdmin() {
		int adminNo = 4;
		int res = mapper.deleteAdmin(adminNo);
		Assert.assertEquals(1, res);
		log.debug("res id >> " + res);
	}

}
