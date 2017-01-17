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
		function setit(url)
		{
			if(confirm("确实执行此操作？"))
			{
				location.href=url;
			}
		}
		</script>
	</head>
	
	<body>
		<div class="top">
			<div class="global-width">
				&quot;<img src="Images/logo.gif" class="logo" />
			</div>
		</div>
		<div class="status">
			<div class="global-width">
				<span style="font-weight:bolder; color: blue">${currentUser.nickname }</span>你好！欢迎访问办公管理系统！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="location.href='loginOut.do'";>注销</a>
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
							邮件信息列表
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0" >
								<tr >
									<td  align="center" width="30%">邮件标题</td>
									<td  align="center">内容</td>
									<td  align="center">是否已读</td>
									<td  align="center">时间</td>
									<td  align="center">操作</td>
								</tr>
                           <c:forEach items="${listMails}" var="mails">
								<tr>
									<td align="center" width="30%">
									<a href="mailReceiveDetail.do?id=${mails.id}">${mails.title }</a>
									</td>
									<td  align="center">${mails.message}</td>
									<td  align="center">
									<c:choose>
									<c:when test="${mails.isRead==0}">未读</c:when>
									<c:when test="${mails.isRead==1}">已读</c:when>
									</c:choose>
									</td>
									<td  align="center"><fmt:formatDate value="${mails.pbtime }" type="date"
					pattern="yyyy-MM-dd" /></td>
									<td  align="center"><a href="javascript:void(0)" onclick="setit('mailReceive!mailDelReceive.do?id=${mails.id}&pageIndex=${param.pageIndex}')">删除</a></td>
								</tr>
								</c:forEach>
								</table>
								<br/>
			<table align="center">
						<tr>
				<c:if test="${pages.currPageNo>1}">
					<td><a href="mailReceive.do?pageIndex=1">首页</a>
					</td>
					<td><a href="mailReceive.do?pageIndex=${pages.currPageNo - 1}">上一页</a>
					</td>
				</c:if>
				<c:if test="${pages.currPageNo<pages.totalPageCount}">
					<td><a href="mailReceive.do?pageIndex=${pages.currPageNo + 1}">下一页</a>
					</td>
					<td><a href="mailReceive.do?pageIndex=${pages.totalPageCount}">末页</a>
					</td>
				</c:if>
					<td class="total"  ><span class=total >${pages.currPageNo }/${pages.totalPageCount}页</span>
					</td>
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
