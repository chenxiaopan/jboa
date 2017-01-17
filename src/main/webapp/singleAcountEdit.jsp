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
					location.href="userInfo!singleAccountData.action";
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
				<span style="font-weight:bolder; color: blue">${currentUser.nickname }</span>你好！欢迎访问办公管理系统！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="location.href='loginOut.action'";>注销</a>
			</div>
		</div>
		<form id="myForm" name="myForm" action="userInfo!dosingleAccountEdit.do" method="post">
		<input type="hidden" name="u.id" value="<s:property value='u.id'/>"/>
		<div class="main">
			<div class="global-width">
				<jsp:include page="leftPanel.jsp"></jsp:include>
					<div class="action">
						<div class="t">
							个人账户
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td align="right" width="30%">用户名：</td>
									<td  align="left"><input id="username" name="username" value="${currentUser.username }" /><font color="red">*</font></td>
								</tr>
								<tr>
									<td align="right">密 码：</td>
									<td align="left"><input id="password" name="password" value="${currentUser.password }"/><font color="red">*</font></td>
								</tr>
								<tr >
									<td align="center" colspan="2"><br/><input type="button" id="save" value="保存数据"  onclick="setit('save')" />
									&nbsp;<input type="button"  id="back" value="返回" onclick="setit('back')" /></td>
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
