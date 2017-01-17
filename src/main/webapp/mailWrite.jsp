<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="flush.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>写邮件</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/json2.js"></script>
		<script>
			var http_request;
			function setit()
			{
				if(document.getElementById("title").value==""){
					alert("邮件标题不能为空！");
					return false;
				}
				document.forms[0].submit();
			}
	</script>
	</head>
	
	<body>
		<div class="top">
			<div class="global-width">&nbsp; 
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
		<form id="myForm" name="myForm" action="mailWrite!uploadInfo.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id"/>
		<div class="main">
			<div class="global-width">
				<jsp:include page="leftPanel.jsp"></jsp:include>
					<div class="action"> 
						<div class="t">
							写邮件
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td align="right" width="30%">收件人：</td>
									<td  align="left">
									<select name="toOne" >
									<c:forEach items="${userList }" var="user">
                                     <option value="${user.id }">${user.nickname }</option>
                                     </c:forEach>
									</select></td>
								</tr> 
								<tr>
									<td align="right">邮件标题：</td><td align="left">
									<input id="title" value="" name="title" /><font color="red">*</font></td>
								</tr>
								<tr>
									<td align="right" valign="top">邮件内容：</td>
									<td align="left"  ><textarea  value="" name="message" rows="8" cols="50" theme="simple"></textarea></td>
								</tr>
								<tr>
									<td align="right">上传附件：</td>
									<td align="left"><input type="file" name="upload"/><font color="red">*</font>(上传附件不能大于9M)</td>
								</tr>
								<tr >
									<td align="center" colspan="4"><br/><input type="button"  id="save" value="发送邮件" onclick="setit()" /></td>
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
