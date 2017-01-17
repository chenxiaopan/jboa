package com.cxp.jboa.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.cxp.jboa.entity.Leave;
import com.cxp.jboa.entity.Mails;

public interface LeaveService {

	int getTotalCount(Leave leave);

	List<Mails> listLeave(Map<String, Object> map);
    
	//根据id查询休假人
	Leave selectById(BigDecimal id);

	//根据id更新休假人状态
	int updateById(Leave leave);

	//提交申请
	int insertSelective(Leave leave);


}
