package com.cxp.jboa.dao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.cxp.jboa.entity.Leave;
import com.cxp.jboa.entity.Mails;


public interface LeaveMapper {
	
	
	int getTotalCount(Leave leave);

	List<Mails> listLeave(Map<String, Object> map);
	
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Leave record);

    //提交申请
    int insertSelective(Leave record);
 
    //根据id查询休假申请人
    Leave selectById(BigDecimal id);

    int updateById(Leave record);

    int updateByPrimaryKey(Leave record);
}