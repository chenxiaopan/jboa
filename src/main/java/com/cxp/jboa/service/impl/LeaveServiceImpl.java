package com.cxp.jboa.service.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cxp.jboa.dao.LeaveMapper;
import com.cxp.jboa.entity.Leave;
import com.cxp.jboa.entity.Mails;
import com.cxp.jboa.service.LeaveService;
import com.github.pagehelper.PageHelper;

@Service("leaveService")
public class LeaveServiceImpl implements LeaveService {

	@Resource
	private LeaveMapper leaveMapper;
	
	@Override
	public int getTotalCount(Leave leave) {
		return leaveMapper.getTotalCount(leave);
	}

	@Override
	public List<Mails> listLeave(Map<String, Object> map) {
		PageHelper.startPage((Integer)map.get("pageIndex"), (Integer)map.get("pageSize"));
		return leaveMapper.listLeave(map);
	}

	@Override
	public Leave selectById(BigDecimal id) {
	return leaveMapper.selectById(id);
	}

	@Override
	public int updateById(Leave leave) {
		return leaveMapper.updateById(leave);
	}

	@Override
	public int insertSelective(Leave leave) {
		return leaveMapper.insertSelective(leave);
	}

}
