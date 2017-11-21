package com.neusoft.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.mapper.RobotInfoMapper;
import com.neusoft.po.RobotInfo;
import com.neusoft.po.RobotInfoExample;
import com.neusoft.service.IRobotInfoService;

@Service
public class RobotInfoServiceImpl implements IRobotInfoService {
	@Autowired
	RobotInfoMapper robotInfoMapper;

	@Override
	public List<RobotInfo> showRobotInfoListHot() {
		RobotInfoExample example = new RobotInfoExample();
		example.or().andRobotIdIsNotNull();
		
		return robotInfoMapper.selectByExample(example);
	}

	@Override
	public List<RobotInfo> showRobotInfoListCommon() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RobotInfo> showRobotInfoListPrice() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RobotInfo findByone(RobotInfo robotInfo) {

		Integer robotId = robotInfo.getRobotId();
		System.out.println("获取到的id为：" + robotId);

		return robotInfo = robotInfoMapper.selectByPrimaryKey(robotId);
	}

	@Override
	public List<RobotInfo> searchByType(RobotInfo robotInfo) {
		RobotInfoExample example = new RobotInfoExample();
		example.or().andRobotTypeEqualTo(robotInfo.getRobotType());
		// TODO Auto-generated method stub
		return robotInfoMapper.selectByExample(example);
	}

	@Override
	public List<RobotInfo> searchByCom(RobotInfo robotInfo) {
		RobotInfoExample example = new RobotInfoExample();
		example.or().andRobotCompanyEqualTo(robotInfo.getRobotCompany());
		// TODO Auto-generated method stub
		return robotInfoMapper.selectByExample(example);
	}

	@Override
	/**
	 * 三级查询
	 */
	public List<RobotInfo> searchByuser1(RobotInfo robotInfo, int robotPrice1,
			int robotPrice2) {
		RobotInfoExample example = new RobotInfoExample();
		// 开始判断是否为空
		System.out.println(robotPrice2);
		// 首先type为空时候
		if ((robotPrice2 == 0)) {

			example.or().andRobotCompanyEqualTo(robotInfo.getRobotCompany())
					.andRobotTypeEqualTo(robotInfo.getRobotType())
					.andRobotPriceIsNotNull();

			return robotInfoMapper.selectByExample(example);

		} else {

			example.or().andRobotCompanyEqualTo(robotInfo.getRobotCompany())
					.andRobotTypeEqualTo(robotInfo.getRobotType())
					.andRobotPriceBetween(robotPrice1, robotPrice2);
			return robotInfoMapper.selectByExample(example);
		}

	}

	/**
	 * 模糊查询
	 */
	public List<RobotInfo> searchByuser2(String anyword) {

		RobotInfoExample example = new RobotInfoExample();

		example.or().andRobotCommitLike("%" + anyword + "%");
		example.or().andRobotTypeLike("%" + anyword + "%");
		example.or().andRobotCompanyLike("%" + anyword + "%");
		example.or().andRobotNameLike("%" + anyword + "%");

		return robotInfoMapper.selectByExample(example);
	}

	@Override
	public int updateRobotcount(RobotInfo robotInfo) {
		System.out.println(robotInfo.toString());
		// TODO Auto-generated method stub
		return robotInfoMapper.updateByPrimaryKeySelective(robotInfo);
	}
}
