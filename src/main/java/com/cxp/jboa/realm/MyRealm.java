package com.cxp.jboa.realm;

import javax.annotation.Resource;



import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.cxp.jboa.entity.Users;
import com.cxp.jboa.service.UsersService;
import com.cxp.jboa.util.CryptographyUtil;


public class MyRealm extends AuthorizingRealm {

	@Resource
	private UsersService usersService;

	/**
	 * 为当前登录的用户授予角色和权限
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		// 
		return null;

	}

	/**
	 * 认证回调函数，登录时使用
	 * 对前登录的用户进行身份验证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {

		String username = (String) token.getPrincipal();// 获取用户名
		Users user = usersService.getByUsername(username);// 根据用户名从数据库中查询出博信息
         
		if (user != null) {
			System.out.println(user.getUsername()+" "+user.getPassword());
			SecurityUtils.getSubject().getSession()
					.setAttribute("currentUser", user);// 把当前用户存到session中
			//进行实际的身份验证
			AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
					user.getUsername(),CryptographyUtil.md5(user.getPassword(), "javacoder") , "MyRealm");
			return authenticationInfo;
		} else {

			return null;
		}
	}
}
