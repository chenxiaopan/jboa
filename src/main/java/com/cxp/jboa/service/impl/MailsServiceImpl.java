package com.cxp.jboa.service.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cxp.jboa.dao.MailsMapper;
import com.cxp.jboa.entity.Mails;
import com.cxp.jboa.service.MailsService;
import com.github.pagehelper.PageHelper;

@Service("mailsService")
public class MailsServiceImpl implements MailsService {

	@Resource
	private MailsMapper mailsMapper;
	
	@Override
	public List<Mails> listMails(Map<String, Object> map) {
		PageHelper.startPage((Integer)map.get("pageIndex"),(Integer)map.get("pageSize"));
		return mailsMapper.listMails(map);
	}

	@Override
	public int getTotalCount(Map<String, Object> map) {
	return mailsMapper.getTotalCount(map);
	}

	@Override
	public int delToGarage(Mails record) {
		return mailsMapper.delToGarage(record);
	}

	@Override
	public List<Mails> getMailGarage() {
	return mailsMapper.getMailGarage();
	}

	@Override
	public int garageBack(Mails mails) {
		return mailsMapper.garageBack(mails);
	}

	@Override
	public int garageDel(Mails mails) {
	return  mailsMapper.garageDel(mails);
	}

	@Override
	public Mails selectById(BigDecimal id) {
		return mailsMapper.selectById(id);
	}

	@Override
	public int insert(Mails record) {
		return mailsMapper.insert(record);
	}

	
	
}
