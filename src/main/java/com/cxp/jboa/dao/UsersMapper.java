package com.cxp.jboa.dao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.cxp.jboa.entity.Users;


public interface UsersMapper {
	
	//查询审批人列表
    List<Users>	listUser(Map<String, Object> map);
	
	//根据用户名查询用户信息
	Users getByUsername(String username);
	
    int deleteByPrimaryKey(BigDecimal id);

    //添加用户
    int insert(Users record);

    int insertSelective(Users record);

    Users selectByPrimaryKey(BigDecimal id);
    
    //修改用户信息
    int update(Users record);

    int updateByPrimaryKey(Users record);
}