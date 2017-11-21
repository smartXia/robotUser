package com.neusoft.control;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.neusoft.po.Orders;
import com.neusoft.po.RobotCompany;
import com.neusoft.po.RobotInfo;
import com.neusoft.po.RobotType;
import com.neusoft.po.Users;
import com.neusoft.service.IOrderService;
import com.neusoft.service.IRobotComService;
import com.neusoft.service.IRobotInfoService;
import com.neusoft.service.IRobotType;

@Controller
@SessionAttributes("userId")


public class RobotinfoControl {
	@Autowired
	IRobotInfoService iRobotInfoService;
	@Autowired
	IOrderService iOrderService;
	@Autowired
	IRobotComService iRobotComService;
	@Autowired
	IRobotType iRobotType;

	@RequestMapping("RobotInfoListAll")
	public String show(Model model, Integer userId) {
		// 循环打印基本的商品
		List<RobotInfo> RobotInfoListAll = iRobotInfoService
				.showRobotInfoListHot();
		model.addAttribute("RobotInfoListAll", RobotInfoListAll);
		// 循环打印商品的种类
		List<RobotType> robotTypesList = iRobotType.robotTypesList();
		model.addAttribute("robotTypesList", robotTypesList);
		// 循环打印基本的商品产地
		List<RobotCompany> robotComList = iRobotComService.companies();
		model.addAttribute("robotComList", robotComList);

		return "shangcheng";
	}

	@RequestMapping("eachRobotInfo")
	public String eachRobotInfo(Model model, RobotInfo robotInfo,
			HttpSession session, Integer userId) {
		System.out.println(robotInfo.getRobotId());
		robotInfo = iRobotInfoService.findByone(robotInfo);
		// 商品具体对象信息		
		System.out.println(robotInfo.toString());
		model.addAttribute("robotInfo", robotInfo);
		return "eachRobotInfo";
	}
	/**
	 * 
	 * @param model
	 * @param robotInfo
	 * @param typeName
	 * @param robotType
	 * @param request
	 * @param userId
	 * @return 通过机器人的种类查找
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("searchByType")
	public String searchByType(Model model, RobotInfo robotInfo,
			@RequestParam("typeName") String typeName, RobotType robotType,
			HttpServletRequest request, Integer userId)
			throws UnsupportedEncodingException {
		typeName = new String(request.getParameter("typeName").getBytes(
				"iso-8859-1"), "utf-8");
		System.out.println("点击的：");
		System.out.println(typeName);
		robotInfo.setRobotType(typeName);
		System.out.println("1231321323:" + robotInfo.getRobotType());
		List<RobotInfo> searchByType = iRobotInfoService
				.searchByType(robotInfo);
		// 商品具体对象信息
		// 将之前的传值

		model.addAttribute("searchByType", searchByType);

		List<RobotType> robotTypesList = iRobotType.robotTypesList();
		model.addAttribute("robotTypesList", robotTypesList);
		// 循环打印基本的商品产地
		List<RobotCompany> robotComList = iRobotComService.companies();
		model.addAttribute("robotComList", robotComList);
		return "shangcheng";
	}

	/**
	 * 
	 * @param model
	 * @param robotInfo
	 * @param request
	 * @param companyName
	 * @param robotCompany
	 * @return 通过机器人的生产商查找
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("searchByCom")
	public String searchByCom(Model model, RobotInfo robotInfo,
			HttpServletRequest request,
			@RequestParam("companyName") String companyName,
			RobotCompany robotCompany) throws UnsupportedEncodingException {
		companyName = new String(request.getParameter("companyName").getBytes(
				"iso-8859-1"), "utf-8");
		System.out.println(companyName);
		robotInfo.setRobotCompany(companyName);
		List<RobotInfo> searchByCom = iRobotInfoService.searchByCom(robotInfo);
		// 商品具体对象信息-
		model.addAttribute("searchByCom", searchByCom);
		List<RobotType> robotTypesList = iRobotType.robotTypesList();
		model.addAttribute("robotTypesList", robotTypesList);
		// 循环打印基本的商品产地
		List<RobotCompany> robotComList = iRobotComService.companies();
		model.addAttribute("robotComList", robotComList);
		return "shangcheng";
	}

	@RequestMapping("searchByuser1")
	public String searchByuser(Model model, RobotInfo robotInfo,
			@RequestParam("robotPrice1") int robotPrice1,
			@RequestParam("robotPrice2") int robotPrice2) {

		System.out.println("前台获取的值分别为：" + robotInfo.getRobotName()
				+ robotInfo.getRobotCompany() + robotPrice1 + robotPrice2);
		// 获取需要的参数

		List<RobotInfo> searchByuser1List = iRobotInfoService.searchByuser1(
				robotInfo, robotPrice1, robotPrice2);
		for (RobotInfo robotInfo2 : searchByuser1List) {
			System.out.println(robotInfo2.toString());
		}
		model.addAttribute("searchByuser1List", searchByuser1List);

		System.out.println(robotPrice1 + robotPrice2);
		List<RobotType> robotTypesList = iRobotType.robotTypesList();
		model.addAttribute("robotTypesList", robotTypesList);
		// 循环打印基本的商品产地
		List<RobotCompany> robotComList = iRobotComService.companies();
		model.addAttribute("robotComList", robotComList);
		model.addAttribute("robotInfo", robotInfo);
		model.addAttribute("robotPrice1", robotPrice1);
		model.addAttribute("robotPrice2", robotPrice2);
		return "shangcheng";
	}

	@RequestMapping("searchByuser2")
	public String searchByuser2(@RequestParam("anyword") String anyword,
			Model model,RobotInfo robotInfo) {
		System.out.println(anyword);

		
		List<RobotType> robotTypesList = iRobotType.robotTypesList();
		model.addAttribute("robotTypesList", robotTypesList);
		// 循环打印基本的商品产地
		List<RobotCompany> robotComList = iRobotComService.companies();
		model.addAttribute("robotComList", robotComList);
		List<RobotInfo> searchByuser2List = iRobotInfoService
				.searchByuser2(anyword);
		
		model.addAttribute("searchByuser2List", searchByuser2List);
		model.addAttribute("anyword", anyword);
		return "shangcheng";
	}

}
