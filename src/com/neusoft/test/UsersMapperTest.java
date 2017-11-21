package com.neusoft.test;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.neusoft.mapper.UsersMapper;
import com.neusoft.po.Users;
import com.neusoft.po.UsersExample;

public class UsersMapperTest {
	private ApplicationContext applicationContext;
	private UsersMapper usersMapper;

	@Before
	public void setUp() throws Exception {
		applicationContext = new ClassPathXmlApplicationContext(
				"classpath:spring/applicationContext-dao.xml");
		usersMapper = (UsersMapper) applicationContext.getBean("usersMapper");
	}

	@Test
	public void testCountByExample() {
		UsersExample example = new UsersExample();
		// 先做用户名必须唯一
		Users users = new Users();
		users.setUserName("xia");
		users.setUserPhone("18260356308");
		example.or().andUserNameEqualTo(users.getUserName());
		List<Users> usersList = usersMapper.selectByExample(example);
		for (Users users2 : usersList) {
			System.out.println(users2.getUserId());
		}

	}

	@Test
	public void testDeleteByExample() {
		Users user = new Users();
		user.setUserName("张三");
		user.setUserPhone("18260356308");
		user.setUserPwd("123");
		usersMapper.insertSelective(user);// 动态插入
	}

	@Test
	public void testDeleteByPrimaryKey() {
		UsersExample example = new UsersExample();
		example.or().andUserNameEqualTo("张三").andUserPwdEqualTo("123");
		List<Users> uesrList = usersMapper.selectByExample(example);
		System.out.println(uesrList);
	}

	@Test
	public void testInsert() {
		Users user = new Users();
		user.setUserName("张三");
		// user.setUserPhone("18260356308");
		user.setUserPwd("123");
		user = usersMapper.usersLogin(user);
		System.out.println(user.toString());
	}

	@Test
	public void testInsertSelective() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectByExampleWithBLOBs() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectByExample() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectByPrimaryKey() {

	}

	@Test
	public void testUpdateByExampleSelective() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateByExampleWithBLOBs() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateByExample() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateByPrimaryKeySelective() {
		Users users = new Users();
		users.setUserId(3);
		users.setUserEmail("835106505@qq.com");
		int a = usersMapper.updateByPrimaryKeySelective(users);
		System.out.println(a);
	}

	@Test
	public void testUpdateByPrimaryKeyWithBLOBs() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateByPrimaryKey() {
		fail("Not yet implemented");
	}

}
