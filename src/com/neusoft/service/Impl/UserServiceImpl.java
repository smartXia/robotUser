package com.neusoft.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.mapper.UsersMapper;
import com.neusoft.po.Users;
import com.neusoft.po.UsersExample;
import com.neusoft.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {
	@Autowired
	UsersMapper usersMapper;

	@Override
	public int userRegister(Users users) {
		return usersMapper.insertSelective(users);
	}

	@Override
	public Users userLogin(Users users) {

		return usersMapper.usersLogin(users);
	}

	@Override
	public Users userInfoDetails(Users users) {
		Integer userId = users.getUserId();
		System.out.println("id为" + userId + "的人登录");
		return usersMapper.selectByPrimaryKey(userId);
	}

	@Override
	public List<Users> selcetBynameandphone(Users users) {
		UsersExample example = new UsersExample();
		example.or().andUserNameEqualTo(users.getUserName());
		List<Users> userList = usersMapper.selectByExample(example);// 返回对象
		return userList;
	}

	/*
	 * 判断是否存在已经注册的人(non-Javadoc)
	 * 
	 * @see com.neusoft.service.IUserService#volitelogin()
	 */
	@Override
	public List<Users> volitelogin(Users users) {

		UsersExample example = new UsersExample();
		String name = users.getUserName();

		example.or().andUserNameEqualTo(name);
		List<Users> userList = usersMapper.selectByExample(example);

		return userList;
	}

	@Override
	public int updateUser(Users users) {

		return usersMapper.updateByPrimaryKeySelective(users);
	}

	/**
	 * 更新个人头像信息
	 */
	@Override
	
	public int updateUserphoto(Users users) {
		// TODO Auto-generated method stub
		return usersMapper.updateByPrimaryKeySelective(users);
	}
}
