package com.cxp.jboa.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cxp.jboa.entity.Mails;
import com.cxp.jboa.entity.Users;
import com.cxp.jboa.service.MailsService;
import com.cxp.jboa.service.UsersService;
import com.cxp.jboa.util.Page;

/**
 * 邮件管理控制器
 * 
 * @author cxp
 * 
 */
@Controller
@RequestMapping("/")
public class MailsController {

	@Resource
	private MailsService mailsService;

	@Resource
	private UsersService usersService;

	// 查询收到的邮件信息列表
	@RequestMapping("/mailReceive")
	public String mailReceive(
			@RequestParam(value = "pageIndex", required = false, defaultValue = "1") String pageIndex,
			HttpServletRequest request) {

		System.out.println("mailReceive------>");
		int totalCount = mailsService.getTotalCount(null);
		Page pages = new Page(5, totalCount, Integer.parseInt(pageIndex));
		// 计算总页数
		pages.setTotalCount(totalCount);
		if (Integer.parseInt(pageIndex) > pages.getTotalPageCount()) {
			pages.setCurrPageNo(pages.getTotalPageCount());
		}
		request.setAttribute("pages", pages);
		// 设置查询条件
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageIndex", pages.getCurrPageNo());
		map.put("pageSize", pages.getPageSize());
		List<Mails> listMails = mailsService.listMails(map);
		request.setAttribute("listMails", listMails);
		return "mailReceive";
	}

	// 删除邮件到垃圾箱
	@RequestMapping("/mailReceive!mailDelReceive")
	public String mailDelReceive(
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "pageIndex", required = false) String pageIndex) {
		System.out.println("pageIndex--->" + pageIndex);
		Mails mails = new Mails();
		mails.setId(new BigDecimal(Integer.parseInt(id)));
		mails.setIsDel(new BigDecimal(1));
		mailsService.delToGarage(mails);
		return "redirect:/mailReceive.do?pageIndex=" + pageIndex;
	}

	// 查询垃圾邮件
	@RequestMapping("/mailGarage")
	public String mailGarage(HttpServletRequest request) {

		List<Mails> mailGarage = mailsService.getMailGarage();
		request.setAttribute("mailGarage", mailGarage);

		return "mailGarage";
	}

	// 还原在垃圾箱的邮件
	@RequestMapping("/mailGarage!garageBack")
	public String garageBack(
			@RequestParam(value = "id", required = false) String id) {

		Mails mails = new Mails();
		mails.setId(new BigDecimal(Integer.parseInt(id)));
		mails.setIsDel(new BigDecimal(0));// 还原邮件
		mailsService.garageBack(mails);
		return "redirect:/mailGarage.do";
	}

	// 删除在垃圾箱的邮件（彻底删除邮件）
	@RequestMapping("/mailGarage!garageDel")
	public String garageDel(
			@RequestParam(value = "id", required = false) String id) {

		Mails mails = new Mails();
		mails.setId(new BigDecimal(Integer.parseInt(id)));
		mailsService.garageDel(mails);
		return "redirect:/mailGarage.do";
	}

	// 邮件详细信息
	@RequestMapping("/mailReceiveDetail")
	public String mailReceiveDetail(
			@RequestParam(value = "id", required = true) String id,
			HttpServletRequest request) {

		// 查询邮件详细信息
		Mails mail = mailsService.selectById(new BigDecimal(Integer
				.parseInt(id)));
		request.setAttribute("mail", mail);

		return "mailReceiveDetail";
	}

	// 显示写邮件页面
	@RequestMapping("/mailWrite")
	public String mailWrite(HttpServletRequest request) {

		// 收件人列表
		List<Users> userList = usersService.listUser(null);
		request.setAttribute("userList", userList);

		return "mailWrite";
	}

	// 写邮件
	@RequestMapping("/mailWrite!uploadInfo")
	public String uploadInfo(
			Mails mail,
			@RequestParam(value = "upload", required = false) MultipartFile upload,
			HttpServletRequest request) {

		System.out.println("upload----->");
		String path = request.getSession().getServletContext()
				.getRealPath("upload");
		String fileName = upload.getOriginalFilename();
              System.out.println("文件名--->"+fileName);
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}

		// 保存
		try {
			upload.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
        //得到当前用户
	    Users currentUser=(Users) request.getSession().getAttribute("currentUser");
	    //设置发件人id
		mail.setFromOne(currentUser.getId());
		mail.setPbtime(new Date());
		mail.setAttachment(fileName);
		mailsService.insert(mail);

		return "redirect:/mailReceive.do";
	}

}
