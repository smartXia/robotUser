package com.neusoft.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.mapper.RobotCompanyMapper;
import com.neusoft.po.RobotCompany;
import com.neusoft.po.RobotCompanyExample;
import com.neusoft.service.IRobotComService;

@Service
public class RobotComImpl implements IRobotComService {
	@Autowired
	RobotCompanyMapper robotCompanyMapper;

	@Override
	public List<RobotCompany> companies() {
		RobotCompanyExample example = new RobotCompanyExample();
		// TODO Auto-generated method stub
		return robotCompanyMapper.selectByExample(example);
	}

}
