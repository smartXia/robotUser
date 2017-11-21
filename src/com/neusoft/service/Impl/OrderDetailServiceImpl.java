package com.neusoft.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.mapper.OrderdetailsMapper;
import com.neusoft.po.Orderdetails;
import com.neusoft.service.IOrderDetailService;
@Service
public class OrderDetailServiceImpl implements IOrderDetailService {
	@Autowired
	OrderdetailsMapper orderdetailsMapper;
	@Override
	public int insertdetailId(Orderdetails orderdetails) {
		
		return orderdetailsMapper.insertSelective(orderdetails);
	}

}
