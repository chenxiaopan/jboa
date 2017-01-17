package com.cxp.jboa.controller;

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

import com.cxp.jboa.entity.Leave;
import com.cxp.jboa.entity.Mails;
import com.cxp.jboa.entity.Users;
import com.cxp.jboa.service.LeaveService;
import com.cxp.jboa.service.UsersService;
import com.cxp.jboa.util.Page;

/**
 * 考勤管理控制器
 * 
 * @author cxp
 * 
 */
@Controller
@RequestMapping("/")
public class LeaveController {

	@Resource
	private LeaveService leaveService;
	@Resource
	private UsersService usersService;

	// 休假信息列表
	@RequestMapping("/leaveList")
	public String leaveList(
			@RequestParam(value = "pageIndex", required = false, defaultValue = "1") String pageIndex,
			HttpServletRequest request) {

		System.out.println("leaveList------>");
		int totalCount = leaveService.getTotalCount(null);
		if (Integer.parseInt(pageIndex) < 1) {
			pageIndex = 1 + "";
		}
		System.out.println(pageIndex+"---->");
		Page pages = new Page(5, totalCount, Integer.parseInt(pageIndex));
		// 计算总页数
		pages.setTotalCount(totalCount);
		// 解决删除页面最后一行数据时传pageIndex有误的问题
		if (Integer.parseInt(pageIndex) > pages.getTotalPageCount()) {
			pages.setCurrPageNo(pages.getTotalPageCount());
		}
		request.setAttribute("pages", pages);
		// 设置查询条件
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageIndex", pages.getCurrPageNo());
		map.put("pageSize", pages.getPageSize());
		List<Mails> listLeave = leaveService.listLeave(map);
		request.setAttribute("listLeave", listLeave);

		return "leaveList";
	}

	// 休假信息列表
	@RequestMapping("/leaveCheck")
	public String leaveCheck(
			@RequestParam(value = "id", required = false) String id,
			HttpServletRequest request) {

		Leave leave = leaveService.selectById(new BigDecimal(Integer
				.parseInt(id)));
		request.setAttribute("leave", leave);

		return "leaveCheck";
	}

	// 休假审核
	@RequestMapping("/leave!doCheck")
	public String doCheck(
			Leave leave,
			@RequestParam(value = "flag", required = false, defaultValue = "0") String flag) {

		leave.setStatus(new BigDecimal(Integer.parseInt(flag)));
		leaveService.updateById(leave);

		return "redirect:/leaveList.do";
	}

	// 申请休假
	@RequestMapping("/leaveApply")
	public String leaveApply(HttpServletRequest request) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("supper", 1);// 管理员才有审批权
		Users currentUser = (Users) request.getSession().getAttribute(
				"currentUser");
		map.put("id", currentUser.getId());
		// 查询审批人列表
		List<Users> checkList = usersService.listUser(map);
		request.setAttribute("checkList", checkList);

		return "leaveApply";
	}

	// 提交申请，字符串型不能映射到Date类型，所以要单独接收再进行转换
	@RequestMapping("/leave!doApply")
	public String doApply(Leave leave,
			@RequestParam(value = "starttime", required = false) String start,
			@RequestParam(value = "endtime", required = false) String end) {
          
		String[] s=start.split("-");
		Date startTime=new Date(Integer.parseInt(s[0]), Integer.parseInt(s[1]), Integer.parseInt(s[2]));
		
		String[] e=start.split("-");
		Date endTime=new Date(Integer.parseInt(e[0]), Integer.parseInt(e[1]), Integer.parseInt(e[2]));
		
		leave.setStartTime(startTime);
		leave.setEndTime(endTime);
		
		System.out.println("daApply----->" + leave.getName());
		// 提交申请
		 leaveService.insertSelective(leave);

		return "redirect:/leaveList.do";
	}

}
