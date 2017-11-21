package com.neusoft.service;

import java.util.List;

import com.neusoft.po.Users;

public interface IUserService {
	public List<Users> selcetBynameandphone(Users users);

	public int userRegister(Users users);

	public Users userLogin(Users users);
	public List<Users> volitelogin(Users users);
	/*
	 * 查询个人信息
	 */
	public Users userInfoDetails(Users users);
	public int updateUser(Users users);
	public int updateUserphoto(Users users);
}
