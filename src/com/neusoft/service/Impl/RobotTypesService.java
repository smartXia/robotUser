package com.neusoft.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.mapper.RobotTypeMapper;
import com.neusoft.po.RobotType;
import com.neusoft.po.RobotTypeExample;
import com.neusoft.service.IRobotType;

@Service
public class RobotTypesService implements IRobotType {
	@Autowired
	RobotTypeMapper robotTypeMapper;

	@Override
	public List<RobotType> robotTypesList() {
		RobotTypeExample example = new RobotTypeExample();
		// TODO Auto-generated method stub
		return robotTypeMapper.selectByExample(example);
	}

}
