package com.cxp.jboa.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cxp.jboa.dao.UsersMapper;
import com.cxp.jboa.entity.Users;
import com.cxp.jboa.service.UsersService;

@Service("usersService")
public class UsersServiceImpl implements UsersService {

	@Resource
	private UsersMapper usersMapper;
	
	@Override
	public Users getByUsername(String username) {
		return usersMapper.getByUsername(username);
	}

	@Override
	public int update(Users record) {
	    return usersMapper.update(record);
	}

	@Override
	public List<Users> listUser(Map<String, Object> map) {
		return usersMapper.listUser(map);
	}

	@Override
	public int insert(Users record) {
		return usersMapper.insert(record);
	}

}
