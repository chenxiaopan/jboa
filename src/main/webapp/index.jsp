<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>北大办公自动化管理系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script>
	function setit() {
		document.forms[0].submit();
	}
</script>

</head>
<jsp:include page="flush.jsp"/>

<body>
	<div class="top">
		<div class="global-width">
			<img src="Images/logo.gif" class="logo" />
		</div>
	</div>
	<div class="status">
		<div class="global-width">
			<span style="font-weight:bolder; color: blue">${currentUser.username }</span>
			你好！欢迎访问办公管理系统！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="javascript:void(0);" onclick="location.href='loginOut.do'";>注销</a>
		</div>
	</div>
	<form id="myForm" name="myForm" action="userInfoEdit.jsp"
		method="post">
		 <input type="hidden" name="u.id" value="26" />
		 <input type="hidden" name="u.sex" value="2" id="u_sex" />
		 <input type="hidden" name="u.supper" value="0" id="u_supper" />
		<div class="main">
			<div class="global-width">
			    <!-- 添加左边的导航 -->
			    <jsp:include page="leftPanel.jsp"></jsp:include>
				<div class="action">
					<div class="t">个人信息</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="right" width="30%">昵称：</td>
								<td align="left"><label  name="nickname"
									value=""  id="nickname" >${currentUser.nickname}</label></td>
							</tr>
							<tr>
								<td align="right" width="30%">年龄：</td>
								<td align="left"><label type="text" name="age" value=""
									readonly="readonly" id="age" >${currentUser.age}</label></td>
							</tr>
							<tr>
								<td align="right" width="30%">性别：</td>
								<td align="left"><input type="radio" <c:if test="${currentUser.sex==2}"> checked="checked"</c:if> name="u.sex" value="2"
									 id="u_sex_m" />男
									<input type="radio" <c:if test="${currentUser.sex==3}"> checked="checked"</c:if> name="u.sex" value="3"
									 id="u_sex_f" />女
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">手机：</td>
								<td align="left"><label type="text" name="u.mobile"
									value="" readonly="readonly" id="u_mobile" >${currentUser.mobile }</label></td>
							</tr>
							<tr>
								<td align="right" width="30%">地址：</td>
								<td align="left"><label type="text" name="u.address"
									value="" readonly="readonly" id="u_address" >${currentUser.address }</label></td>
							</tr>
							<tr>
								<td align="center" colspan="2"><br /> <input type="button"
									id="save" value="编辑数据" onclick="setit()" /></td>
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