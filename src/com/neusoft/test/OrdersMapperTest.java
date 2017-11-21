package com.neusoft.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.neusoft.mapper.OrdersMapper;
import com.neusoft.mapper.RobotInfoMapper;
import com.neusoft.po.Orders;
import com.neusoft.po.OrdersExample;
import com.neusoft.po.Users;

public class OrdersMapperTest {

	private ApplicationContext applicationContext;
	private OrdersMapper ordersMapper;

	@Before
	public void setUp() throws Exception {
		applicationContext = new ClassPathXmlApplicationContext(
				"classpath:spring/applicationContext-dao.xml");
		ordersMapper = (OrdersMapper) applicationContext
				.getBean("ordersMapper");
	}

	@Test
	public void testCountByExample() {
		Users users = new Users();
		OrdersExample example = new OrdersExample();
		example.or().andUserNameEqualTo("xia");
		List<Orders> orderList = ordersMapper.selectByExample(example);
		for (Orders orders : orderList) {
			System.out.println(orders.getRobotName());
		}
	}

	@Test
	public void testDeleteByExample() {
	
		long maxwater = ordersMapper.maxwater();
		System.out.println(maxwater);
	}

	@Test
	public void testDeleteByPrimaryKey() {
		Orders record = new Orders();
		record.setWater((long) 12345);
		OrdersExample example = new OrdersExample();
		example.or().andUserNameEqualTo("xia");
		ordersMapper.updateByExampleSelective(record, example);//
		// 同时进行的操作进行orderdetail表的更新
		

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
