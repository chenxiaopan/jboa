package com.cxp.jboa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cxp.jboa.entity.Users;
import com.cxp.jboa.service.UsersService;
import com.cxp.jboa.util.CryptographyUtil;

/**
 * 用户管理控制器
 * 
 * @author cxp
 * 
 */
@Controller
@RequestMapping("/")
public class UsersController {

	@Resource
	private UsersService usersService;

	// 登录
	@RequestMapping("/login")
	public String login(Users user, HttpServletRequest request) {

		Subject subject = SecurityUtils.getSubject();// 获取当前登录的主体

		String newPassword = CryptographyUtil.md5(user.getPassword(),
				"javacoder");// 将密码使用md5加密

		// 将用户信息封装到 token中
		UsernamePasswordToken token = new UsernamePasswordToken(
				user.getUsername(), newPassword);
		try {
			subject.login(token);// 会调用MyRealm中的doGetAuthenticationInfo方法进行身份验证
			return "redirect:index.jsp";
		} catch (AuthenticationException e) {
			e.printStackTrace();
			request.setAttribute("currentUser", user);
			request.setAttribute("errorInfo", "用户名或密码错误!");
			return "login";
		}
	}

	// 注销登录
	@RequestMapping("/loginOut")
	private String loginOut() {

		SecurityUtils.getSubject().logout();

		return "redirect:/login.jsp";
	}

	// 修改用户信息，页面提交信息有误也可能会出现映射错误--400
	@RequestMapping("/userInfo")
	public String update(Users user) {

		System.out.println("userId--->" + user.getId());
		int count = usersService.update(user);
		// 重新将更改后的用户信息放到session域
		SecurityUtils.getSubject().getSession()
				.setAttribute("currentUser", user);// 把当前用户存到session中
		return "index";
	}

	// 修改账户信息
	@RequestMapping("/userInfo!dosingleAccountEdit.do")
	public String modifyAccount(Users user, HttpServletRequest request) {

		Users currentUser = (Users) request.getSession().getAttribute(
				"currentUser");
		currentUser.setUsername(user.getUsername());
		currentUser.setPassword(user.getPassword());
		usersService.update(currentUser);
		return "singleAcount";
	}

	// 账户管理列表
	@RequestMapping("/adminAcountList")
	public String adminAcountList(HttpServletRequest request) {
    
		Map<String, Object> map=new HashMap<String, Object>();
		//查询账户列表
		List<Users> accountList=usersService.listUser(map);
		request.setAttribute("accountList", accountList);
		
		return "adminAcountList";
	}
	
	//添加帐号
	@RequestMapping("/userInfo!doAccountAdd")
	public String  doAccountAdd(Users user){
		
		
		//添加账户
		usersService.insert(user);
		
		
		return "redirect:/adminAcountList.do";
	}
	

}
