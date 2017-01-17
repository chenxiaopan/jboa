<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false"%>

<jsp:include page="flush.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title><s:property value="pageTitle"/></title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script>
			function setit(flag)
			{
				if(flag == "back")
					location.href="userInfo!adminAccount.action";
				else if(flag == "save")
				{
					if(document.getElementById("username").value=="")
					{
						alert("请输入用户名！");
						return false;
					}
					if(document.getElementById("password").value=="")
					{
						alert("请输入密码！");
						return false;
					}
					if(document.getElementById("nickname").value=="")
					{
						alert("请输入昵称！");
						return false;
					}
					//验证手机
					var requ = /^[1][3,5][0-9]{9}$/;
					var re = new RegExp(requ);
					if(!re.test(document.getElementById("mobile").value))
					{
						alert("手机输入无效！");
						return false;
					}
					document.forms[0].submit();
					
				}
			}
		</script>
	</head>
	
	<body>
		<div class="top">
			<div class="global-width">
				<img src="Images/logo.gif" class="logo" />
			</div>
		</div>
		<div class="status">
			<div class="global-width">
				<span style="font-weight:bolder; color: blue">${currentUser.nickname }</span> 你好！欢迎访问青鸟办公管理系统！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="location.href='loginOut.action'";>注销</a>
			</div>
		</div>
		<form id="myForm" name="myForm" action="userInfo!doAccountAdd.do" method="post">
		<div class="main">
			<div class="global-width">
				<jsp:include page="leftPanel.jsp"></jsp:include>
					<div class="action">
						<div class="t">
							添加账号
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td align="center" colspan="6">
									<font color="red"><s:property value="messag"/></font></td>
								</tr>
								<tr >
									<td align="right" width="30%">用户名：</td>
									<td  align="left"><input id="username"  value="" name="username"/><font color="red">*</font></td>
								</tr>
								<tr>
									<td align="right">密 码：</td>
									<td align="left"><input id="password" name="password" value="" /><font color="red">*</font></td>
								</tr>
								<tr >
									<td align="right" width="30%">昵称：</td>
									<td  align="left"><input id="nickname"  value="" name="nickname" theme="simple"/><font color="red">*</font></td>
								</tr>
								<tr >
									<td align="right" width="30%">年龄：</td>
									<td  align="left"><input id="age"  value="" name="age" theme="simple"/></td>
								</tr>
								<tr >
									<td align="right" width="30%">性别：</td>
                                     <td><input type="radio" checked="checked" name="sex" value="2"
									 id="u_sex_m" />男
									<input type="radio" name="sex" value="3"
									 id="u_sex_f" />女
									</td>
								</tr>
								
								<tr >
									<td align="right" width="30%">手机：</td>
									<td  align="left"><input  value="" id="mobile" name="mobile" /><font color="red">*</font></td>
								</tr>
								<tr >
									<td align="right" width="30%">地址：</td>
									<td  align="left"><input value="" name="address"  /></td>
								</tr>
								<tr >
									<td align="center" colspan="2"><br/>
									<input type="button" id="save" value="保存数据"  onclick="setit('save')" />&nbsp;<input type="button"  id="back" value="返回" onclick="setit('back')" /></td>
								</tr>
								
								</table>
								
						</div>
					</div>
			</div>
		</div>
		</form>
	 <jsp:include page="footer.jsp"/>

	</body>
</html>
