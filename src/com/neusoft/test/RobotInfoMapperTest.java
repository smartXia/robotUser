package com.neusoft.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.neusoft.mapper.RobotInfoMapper;
import com.neusoft.mapper.UsersMapper;
import com.neusoft.po.RobotInfo;
import com.neusoft.po.RobotInfoExample;

public class RobotInfoMapperTest {

	private ApplicationContext applicationContext;
	private RobotInfoMapper robotInfoMapper;

	@Before
	public void setUp() throws Exception {
		applicationContext = new ClassPathXmlApplicationContext(
				"classpath:spring/applicationContext-dao.xml");
		robotInfoMapper = (RobotInfoMapper) applicationContext
				.getBean("robotInfoMapper");
	}

	@Test
	public void testCountByExample() {
		RobotInfoExample example = new RobotInfoExample();
		example.or().andRobotCommitLike("%机器%");
		example.or().andRobotTypeLike("%机器%");
		example.or().andRobotCompanyLike("%机器%");
		example.or().andRobotNameLike("%机器%");

		List<RobotInfo> list = robotInfoMapper.selectByExample(example);
		for (RobotInfo robotInfo : list) {
			System.out.println(robotInfo.toString());
		}
	}

	@Test
	public void testDeleteByExample() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteByPrimaryKey() {
		fail("Not yet implemented");
	}

	@Test
	public void testInsert() {
		fail("Not yet implemented");
	}

	@Test
	public void testInsertSelective() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectByExample() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectByPrimaryKey() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateByExampleSelective() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateByExample() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateByPrimaryKeySelective() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateByPrimaryKey() {
		fail("Not yet implemented");
	}

}
