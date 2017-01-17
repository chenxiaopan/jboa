<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<jsp:include page="flush.jsp"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title><s:property value="pageTitle"/></title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script>
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
		<form id="myForm" name="myForm" action="userInfo!singleAccountEditData.action" method="post">
		<div class="main">
			<div class="global-width">
				<jsp:include page="leftPanel.jsp">
					<jsp:param value="4" name="flag"/>
				</jsp:include>
					<div class="action">
						<div class="t">
							账户管理列表
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0" >
								<tr >
									<td align="center" width="30%">用户名</td>
									<td  align="center">昵称</td>
									<td  align="center">手机</td>
									<td  align="center">地址</td>
								</tr>
						  <c:forEach items="${accountList}" var="account">
								<tr>
									<td align="center" width="30%"><a href="edit.action?id=1">${account.username }</a></td>
									<td  align="center">${account.nickname }</td>
									<td  align="center">${account.mobile }</td>
									<td  align="center">${account.address}</td>
								</tr>
								</c:forEach>
								<tr >
									<td align="left" colspan="2"><br/>
									<input type="button"  id="save" value="添加数据" onclick="location.href='adminAcountAdd.jsp'"/></td>
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
