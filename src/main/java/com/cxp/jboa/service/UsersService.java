package com.cxp.jboa.service;

import java.util.List;
import java.util.Map;

import com.cxp.jboa.entity.Users;

public interface UsersService {
     
	//根据用户名查询用户信息
	Users getByUsername(String username);
	
	   //修改用户信息
    int update(Users record);

    //查询审批人列表
	List<Users> listUser(Map<String, Object> map);
	
	//添加用户
	 int insert(Users record);

}
