package com.neusoft.service;

import java.util.List;

import com.neusoft.po.Orders;
import com.neusoft.po.Users;

public interface IOrderService {
	public List<Orders> userOrdersList(Users users);

	public List<Orders> userOrdersListBystatu(Users users);

	public int addOrderfirst(Orders orders);

	// 用来查找购物车是否存在想同的数据然后再number商加一
	public Orders userOrdersaddNumber(Orders orders);

	public int deleteorder(Orders orders);

	public int updatenumber(Orders orders);

	public void updatewater(Orders orders, Users users);

	// 查找最大的值方法
	public long maxwater();

	public int updateorderDetailId();
 
	public  int updatestatus(Orders orders);
}
