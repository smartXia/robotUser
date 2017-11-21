package com.neusoft.control;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.neusoft.po.Orders;
import com.neusoft.po.RobotInfo;
import com.neusoft.po.Users;
import com.neusoft.service.IOrderDetailService;
import com.neusoft.service.IOrderService;
import com.neusoft.service.IRobotInfoService;
import com.neusoft.service.IUserService;

@Controller
@RequestMapping("/order")
@SessionAttributes("userId")
public class OrderControl {
	@Autowired
	IOrderService iOrderService;
	@Autowired
	IRobotInfoService iRobotInfoService;
	@Autowired
	IUserService iUserService;
	@Autowired
	IOrderDetailService detailService;

	@RequestMapping("orderRobot")
	public String orderRobot(Model model, RobotInfo robotInfo, Users users,
			Orders orders) {
		/**/
		// 获取购买机器人的id
		System.out.println("robot:" + robotInfo.toString());
		System.out.println("user:" + users.toString());
		// 通过两个id查询到的值进行查询单个对象信息

		robotInfo = iRobotInfoService.findByone(robotInfo);
		users = iUserService.userInfoDetails(users);
		// 将两个对象信息插进订单表中 且更新库存量减一
		// 需要的字段 商品名 生产商 商品图片 商品价格 用户名 数量默认值数据库设置为1
		String userName = users.getUserName();

		String robotImage = robotInfo.getRobotImage();

		int robotPrice = robotInfo.getRobotPrice();

		String robotName = robotInfo.getRobotName();

		String robotCom = robotInfo.getRobotCompany();
		int robotCount = robotInfo.getRobotCount();
		int robotId = robotInfo.getRobotId();

		orders.setUserName(userName);
		orders.setRobotCom(robotCom);
		orders.setRobotImage(robotImage);
		orders.setRobotPrice(robotPrice);
		orders.setRobotName(robotName);
		iOrderService.addOrderfirst(orders);

		// 如果商品数小于0则通知管理员进行上新产品
		robotInfo.setRobotCount(robotCount - 1);
		robotInfo.setRobotId(robotId);
		iRobotInfoService.updateRobotcount(robotInfo);

		/*
		 * 验证是否同一个人是否存在同人购买同商品购物车加1而不是再开一条订单
		 */
		if (robotName.endsWith(robotName)) {

			// Update 订单表中的数量加一

		}
		// 查找用户的购买的商品1 2 3
		List<Orders> orderList = iOrderService.userOrdersList(users);
		model.addAttribute("orderList", orderList);
		model.addAttribute("users", users);
		return "user/gerenzhongxin";
	}

	@RequestMapping("gouwuche")
	public String showUserOrders(Orders orders, Users users, Model model,
			HttpSession session) {
		System.out.println(users.getUserName());
		List<Orders> orderList = iOrderService.userOrdersList(users);

		model.addAttribute("orderList", orderList);
		users = iUserService.userInfoDetails(users);
		model.addAttribute("users", users);
		session.setAttribute("users", users);

		return "user/gerenzhongxin";

	}

	@RequestMapping("dingdan")
	public String dingdan(Orders orders, Users users, Model model,
			HttpSession session) {
		System.out.println(users.getUserName());

		users = iUserService.userInfoDetails(users);
		model.addAttribute("users", users);
		session.setAttribute("users", users);
		List<Orders> orderList2 = iOrderService.userOrdersListBystatu(users);

		model.addAttribute("orderList2", orderList2);
		return "user/gerenzhongxin";

	}

	@RequestMapping("deleteorder")
	public String deleteorder(Orders orders, Users users, Model model,
			HttpSession session) {
		System.out.println(orders.getOrderId() + "使orderId:修改信息number:"
				+ orders.getNumber());
		iOrderService.deleteorder(orders);
		users = iUserService.userInfoDetails(users);
		// model.addAttribute("users", users);
		session.setAttribute("users", users);
		return this.showUserOrders(orders, users, model, session);

	}

	@RequestMapping("updatenumber")
	public String updatenumber(Orders orders, Users users, Model model,
			HttpSession session) {
		System.out.println(orders.getOrderId() + "使orderId:修改信息number:"
				+ orders.getNumber());
		iOrderService.updatenumber(orders);
		System.out.println(users.getUserName() + users.getUserId());
		users = iUserService.userInfoDetails(users);
		// model.addAttribute("users", users);
		session.setAttribute("users", users);
		return this.showUserOrders(orders, users, model, session);

	}

	@RequestMapping("jiesuan")
	public String jiesuan(Orders orders, Users users, Model model,
			HttpSession session) {
		System.out.println(users.getUserId());
		System.out.println(orders.getUserName());

		iOrderService.updatewater(orders, users);

		// 更新第二张表的标识符在server中一起更新
		// 返回的提交信息的具体返回
		// 实现购物车部分商品结算没实现
		// 然后将关于这个流水账单标识的搜出来其实也就是这个人的姓名下的所有订单

		/* model.addAttribute("orderList", orderList); */
		/*
		 * users = iUserService.userInfoDetails(users);
		 * model.addAttribute("users", users);
		 */
		users = iUserService.userInfoDetails(users);

		model.addAttribute("users", users);
		List<Orders> orderList = iOrderService.userOrdersList(users);
		/* session.setAttribute("orderList", orderList); */
		model.addAttribute("orderList", orderList);
		return "user/jiesuan";
	}

	@RequestMapping("fukuan")
	public String fukuan(Orders orders, Users users, Model model,
			HttpSession session) {
		System.out.println(users.getUserId());
		System.out.println(orders.getUserName());
		users = iUserService.userInfoDetails(users);
		model.addAttribute("users", users);
		// 更新订单状态
		iOrderService.updatestatus(orders);

		return "user/gerenzhongxin";

	}
}
