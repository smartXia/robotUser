package com.neusoft.service;

import java.util.List;

import com.neusoft.po.RobotInfo;

public interface IRobotInfoService {
	public int updateRobotcount(RobotInfo robotInfo);

	public List<RobotInfo> showRobotInfoListHot();

	public RobotInfo findByone(RobotInfo robotInfo);

	public List<RobotInfo> showRobotInfoListCommon();

	public List<RobotInfo> searchByType(RobotInfo robotInfo);

	public List<RobotInfo> searchByCom(RobotInfo robotInfo);

	public List<RobotInfo> searchByuser1(RobotInfo robotInfo, int robotPrice1,
			int robotPrice2);

	public List<RobotInfo> showRobotInfoListPrice();

	/**
	 * 
	 * @param anyword
	 * @return 模糊查询
	 * */
	public List<RobotInfo> searchByuser2(String anyword);

}
