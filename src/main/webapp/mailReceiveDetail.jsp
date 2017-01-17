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
	</head>
	
	<body>
		<div class="top">
			<div class="global-width">&nbsp; 
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
		<input type="hidden" name="u.id" value="<s:property value='u.id'/>"/>
		<div class="main">
			<div class="global-width">
				<jsp:include page="leftPanel.jsp"></jsp:include>
					<div class="action">
						<div class="t">
							邮件信息详情
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td align="right" width="30%">邮件标题：</td><td  align="left"><label  readonly="true" name="title" theme="simple">${mail.title }</label></td>
								</tr>
								<tr >
									<td align="right" valign="top" width="30%">邮件内容：</td><td  align="left"><label name="message" rows="10" cols="50" theme="simple" readonly="true">${mail.message }</label></td>
								</tr>
								<tr >
									<td align="right" valign="top" width="30%">发信时间：</td><td  align="left"><fmt:formatDate value="${mail.pbtime }" type="date"
					pattern="yyyy-MM-dd" /></td>
								</tr>
								<tr >
									<td align="right" width="30%">来自：</td><td  align="left"><label  readonly="true" name="mail.userByFromone.nickname" theme="simple">${mail.fromOne }</label></td>
								</tr>
								<c:if test="${mail.attachment!=null}">
								<tr >
									<td align="right" width="30%">文件：</td><td  align="left"><a href="upload/${mail.attachment}/>">下载</a></td>
								</tr>
								</c:if>
								<tr >
									<td align="center" colspan="4"><br/><input type="button"  id="save" value="返回" onclick="location.href='javascript:history.go(-1)'" /></td>
								</tr>
								
								</table>
								
						</div>
					</div>
			</div>
		</div>
		</form>
		<jsp:include page="footer.jsp" />

	</body>
</html>
