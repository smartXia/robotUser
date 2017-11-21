package com.neusoft.service.Impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.mapper.OrderdetailsMapper;
import com.neusoft.mapper.OrdersMapper;
import com.neusoft.po.Orderdetails;
import com.neusoft.po.Orders;
import com.neusoft.po.OrdersExample;
import com.neusoft.po.Users;
import com.neusoft.service.IOrderService;

@Service
public class OrderListServiceImpl implements IOrderService {
	@Autowired
	OrdersMapper ordersMapper;
	// 这里自动注入两个mapper
	@Autowired
	OrderdetailsMapper orderdetailsMapper;

	@Override
	public List<Orders> userOrdersList(Users users) {
		System.out.println(users.getUserName());
		OrdersExample example = new OrdersExample();
		System.out.println(users.getUserName());
		/* int userId = users.getUserId(); */
		System.out.println("调用购物车函数，然后进行处理订单");
		example.or().andUserNameEqualTo(users.getUserName())
				.andOrderStateEqualTo("未付款");

		
		// TODO Auto-generated method stub
		return ordersMapper.selectByExample(example);
	}

	@Override
	public List<Orders> userOrdersListBystatu(Users users) {
		OrdersExample example = new OrdersExample();
		example.or().andUserNameEqualTo(users.getUserName())
				.andOrderStateEqualTo("已付款");
		example.or().andUserNameEqualTo(users.getUserName()).andOrderStateLike("已发货");
		return ordersMapper.selectByExample(example);
	}

	// 需要处理两个参数
	@Override
	public int addOrderfirst(Orders orders) {
		int number = 1;
		orders.setNumber(number);
		System.out.println(orders.toString());
		return ordersMapper.insertSelective(orders);

	}

	// 更新购物车购买数量根据现有的orderID查询
	@Override
	public Orders userOrdersaddNumber(Orders orders) {
		Integer orderId = orders.getOrderId();

		return ordersMapper.selectByPrimaryKey(orderId);
	}

	@Override
	public int deleteorder(Orders orders) {
		int orderId = orders.getOrderId();
		System.out.println("删除成功");
		return ordersMapper.deleteByPrimaryKey(orderId);
	}

	@Override
	public int updatenumber(Orders orders) {
		System.out.println(orders.getOrderId() + orders.getNumber());
		return ordersMapper.updateByPrimaryKeySelective(orders);
	}

	@Override
	public int updatestatus(Orders orders) {
		System.out.println(orders.getUserName());
		System.out.println("进入更新状态");
		orders.setOrderState("已付款");
		OrdersExample example = new OrdersExample();
		example.or().andOrderStateEqualTo("未付款");
		return ordersMapper.updateByExampleSelective(orders, example);
	}

	@Override
	public long maxwater() {

		return ordersMapper.maxwater();
	}

	/**
	 * 更新订单状态总共传的数据有两个1：用户名order。usernaem2.订单的对象order
	 */
	@Override
	public void updatewater(Orders orders, Users users) {

		// 自动生成的id还没写完
		String Orderno = null;
		// 如何获取带最大值
		/* INewsDaoImpl test = new INewsDaoImpl(); */

		long water = this.maxwater();
		System.out.println(water);
		// 从数据库查询出的最大编号
		String maxOrderno = String.valueOf(water);
		System.out.println("最大编号:" + maxOrderno);
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd"); // 时间字符串产生方式
		String uid_pfix = format.format(date); // 组合流水号前一部分，NO+时间字符串，如：NO20160126

		if (maxOrderno != null && maxOrderno.contains(uid_pfix)) {
			System.out.println(maxOrderno);
			String uid_end = maxOrderno.substring(8, 12); // 截取字符串最后四位，从第10开始结果:0001
			System.out.println("uid_end=" + uid_end);
			int endNum = Integer.parseInt(uid_end); // 把String类型的0001转化为int类型的1
			// System.out.println("endNum=" + endNum);
			int tmpNum = 10000 + endNum + 1; // 结果10002
			// System.out.println("tmpNum=" + tmpNum);
			Orderno = uid_pfix + this.subStr("" + tmpNum, 1);
			// 把10002首位的1去掉，再拼成NO201601260002字符串
			//
		} else {
			Orderno = uid_pfix + "0001";
		}
		System.out.println(Orderno);
		// 改格式报异常
		long loo = Long.parseLong(Orderno);
		System.out.println(loo);
		orders.setWater(loo);
		/* orders.setOrderState("已付款"); */
		OrdersExample example = new OrdersExample();
		example.or().andUserNameEqualTo(orders.getUserName());
		ordersMapper.updateByExampleSelective(orders, example);
		// 不能数据库为空
		// 将其中的订单传到detail表中
		Orderdetails orderdetails = new Orderdetails();
		orderdetails.setDetailId(loo);
		orderdetails.setUserName(users.getUserName());
		orderdetailsMapper.insertSelective(orderdetails);

	}

	@Override
	public int updateorderDetailId() {
		// TODO Auto-generated method stub
		return 0;
	}

	public String subStr(String str, int start) {
		{
			if (str == null || str.equals("") || str.length() == 0)
				return "";
			if (start < str.length()) {
				return str.substring(start);
			} else {
				return "";
			}

		}

	}

}
