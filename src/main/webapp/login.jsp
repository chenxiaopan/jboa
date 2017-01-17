<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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



<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户登录</title>
<!-- 添加登录样式 -->
<link href="css/login.css" rel="stylesheet" type="text/css" />

</head>
<jsp:include page="flush.jsp"/>
<body>
	<div class="login-top"></div>
	<div class="login-area">
		<form action="login.do" method="post">
			<label> 工&nbsp;&nbsp;号： </label> 
			<input type="text" name="username" />
			<label> 密&nbsp;&nbsp;码： </label> 
			<input type="password"
				name="password" /> 
				<input type="submit" class="login-sub"
				value="" /> 
				<br /> <span id="error" style='color:red'>${errorInfo}</span>
				<b><font color="red"><s:property value="message" />
			</font>
			</b>
		</form>
		
	</div>
	<div class="login-copyright"></div>
</body>
</html>
</html>
