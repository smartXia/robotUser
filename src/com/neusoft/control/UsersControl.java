package com.neusoft.control;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.neusoft.po.Orders;
import com.neusoft.po.Users;
import com.neusoft.service.IOrderService;
import com.neusoft.service.IUserService;

@Controller
@RequestMapping("/user")
@SessionAttributes("userId")
public class UsersControl {

	@Autowired
	IUserService iUserService;
	@Autowired
	IOrderService iOrderService;

	@RequestMapping(value = "uesrRegister", method = RequestMethod.POST)
	public @ResponseBody
	Users userRegister(Users users, HttpSession session) {
		// 第一步验证是否存在的值返回的值为空提示非法插入
		// 登录为何直接使用：原因直接返回对象对象是非null就可以插入
		// 第二部直接插入值
		// iUserService.userRegister(users);
		// 先查找是否是注册了的，返回的对象是user 类型为null就可以插入，直接验证是否存在手机号存
		System.out.println(users.toString());
		// 判断是否存在name或者其他
		List<Users> usersListvalte = iUserService.volitelogin(users);
		int v = usersListvalte.size();
		if (v == 0) {// 可以直接插入
			System.out.println("已经验证数据库为空可以插入");
			System.out.println(users.toString());
			iUserService.userRegister(users);
			users = iUserService.userLogin(users);
			session.setAttribute("users", users);
			return users;
		} else {// 返回空值证明已经存在
			System.out.println("不可以插入");
			return null;
		}

	}

	@RequestMapping(value = "uesrLogin", method = RequestMethod.POST)
	public @ResponseBody
	Users userLogin(Users users, Model model, Integer userId, String userName,
			HttpSession session) {
		System.out.println("jsp页面传来的值为" + users.getUserName());
		System.out.println("jsp页面传来的值为" + users.getUserPwd());
		users = iUserService.userLogin(users);
		// /////////////////////??session生命周期
		System.out.println(users);

		/*
		 * userId = users.getUserId(); userName = users.getUserName();
		 * session.setAttribute("userId", userId);
		 * session.setAttribute("userName", userName);
		 */
		// 将用户user对象设置一个session值
		// 个人中新的值为session单还包括订单信息所以需要订单信息的列表
		/*
		 * List<Orders> orderList = iOrderService.userOrdersList(users);
		 * session.setAttribute("orderList", orderList);
		 */
		session.setAttribute("users", users);

		System.out.println(users);
		// 当对象为空的时候不能用string打印
		// System.out.println("返回的对象为：" + users.toString());
		return users;
	}

	/*
	 * 查找个人信息并修改
	 */
	@RequestMapping("userInfoDetail")
	public String userInfoDetails(Model model, Users users) {
		users = iUserService.userInfoDetails(users);
		System.out.println(users.toString());
		model.addAttribute("users", users);
		List<Orders> orderList = iOrderService.userOrdersList(users);
		model.addAttribute("orderList", orderList);
		return "user/personDetail";
	}

	@RequestMapping("userInfoUpdate")
	public String userInfoUpdate(Model model, Users users,HttpSession session) {
		System.out.println(users.toString());
		iUserService.updateUser(users);
		//model.addAttribute("users", users);
		users = iUserService.userLogin(users);//重新查找
		session.setAttribute("users", users);
		return "user/personupdate";
	}

	@RequestMapping("userphoto")
	public String userphoto(Model model, Users users,HttpSession session)
			throws IllegalStateException, IOException {
		String sqlPath = null;
		// 定义文件保存的本地路径
		String localPath = "E:\\File\\";
		// 定义 文件名
		String filename = null;
		if (!users.getFile().isEmpty()) {
			// 生成uuid作为文件名称
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			// 获得文件类型（可以判断如果不是图片，禁止上传）
			String contentType = users.getFile().getContentType();
			// 获得文件后缀名
			String suffixName = contentType
					.substring(contentType.indexOf("/") + 1);
			// 得到 文件名
			filename = uuid + "." + suffixName;
			System.out.println(filename);
			// 文件保存路径
			users.getFile().transferTo(new File(localPath + filename));
		}
		// 把图片的相对路径保存至数据库
		sqlPath = "/images/" + filename;
		System.out.println(sqlPath);
		users.setUserImage(sqlPath);
		iUserService.updateUserphoto(users);
		users = iUserService.userLogin(users);
		return this.userInfoUpdate(model, users, session);

	}
}
