package com.cxp.jboa.dao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.cxp.jboa.entity.Mails;


public interface MailsMapper {
	
	//分页查询收到的邮件
	List<Mails> listMails(Map<String, Object> map);
	
	//得到邮件总个数
	int getTotalCount(Map<String, Object> map);
	
    int deleteByPrimaryKey(BigDecimal id);

    //写邮件
    int insert(Mails record);

    int insertSelective(Mails record);

    //查询邮件详细信息
    Mails selectById(BigDecimal id);

    //删除邮件到垃圾箱
    int delToGarage(Mails record);
    
	//得到垃圾邮件
	List<Mails> getMailGarage();
	
	//还原邮件
	int garageBack(Mails mails);
	
	//彻底删除邮件
	int garageDel(Mails mails);

    int updateByPrimaryKey(Mails record);
}