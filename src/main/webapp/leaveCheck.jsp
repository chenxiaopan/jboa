<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
				document.getElementById("flag").value=flag;
				document.forms[0].submit();
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
				<span style="font-weight:bolder; color: blue">${currentUser.username }</span> 你好！欢迎访问办公管理系统！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="location.href='loginOut.action'";>注销</a>
			</div>
		</div>
		<form id="myForm" name="myForm" action="leave!doCheck.do" method="post">
		<input type="hidden" id="id" name="id" value="${leave.id }"/>
		<input type="hidden" id="flag" name="flag"/>
		<div class="main">
			<div class="global-width">
				<jsp:include page="leftPanel.jsp"></jsp:include>
					<div class="action">
						<div class="t">
							休假审核
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td align="right" width="30%">姓名：</td><td  align="left">${leave.name }</td>
								</tr>
								<tr>
									<td align="right">开始时间：</td>
									<td align="left"><fmt:formatDate value="${leave.startTime }" type="date" pattern="yyyy-MM-dd" /></td>
								</tr>
								<tr>
									<td align="right">结束时间：</td>
									<td align="left"><fmt:formatDate value="${leave.endTime }" type="date" pattern="yyyy-MM-dd" /></td>
								</tr>
								<tr>
									<td align="right">请假天数：</td>
									<td align="left">${leave.leaveDay}</td>
								</tr>
								<tr>
									<td align="right" valign="top">请假原因：</td>
									<td align="left">${leave.reason }</td>
								</tr>
								<tr>
									<td align="right">审批人：</td>
									<td align="left">${leave.checkId}</td>
								</tr>
								<tr >
									<td align="center" colspan="2"><br/>
									<input type="button"  id="save" value="审核通过" onclick="setit('1')" />
									&nbsp;<input type="button"  id="save" value="审核不通过" onclick="setit('2')" /></td>
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
