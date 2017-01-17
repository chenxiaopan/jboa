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
				<span style="font-weight:bolder; color: blue">${currentUser.nickname }</span> 你好！欢迎访问办公管理系统！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
							休假信息列表
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0" >
								<tr >
									<td align="center" width="10%">申请人</td>
									<td  align="center" width="15%">开始时间</td>
									<td  align="center" width="15%">结束时间</td>
									<td  align="center" width="15%">天数</td>
									<td  align="center" width="15%">审批状态</td>
									<td  align="center">原因</td>
									<c:if test="currentUser.supper==1">
									<td  align="center">操作</td>  
									</c:if>
								</tr>
								
								<c:forEach items="${listLeave}" var="leave">
								<tr height="20">
									<td align="center">${leave.name }</td>
									<td  align="center">
									<fmt:formatDate value="${leave.startTime }" type="date"	pattern="yyyy-MM-dd" />
									</td>
								<td  align="center">
									<fmt:formatDate value="${leave.endTime }" type="date"	pattern="yyyy-MM-dd" />
									</td>
									<td  align="center">${leave.leaveDay }</td>
									<c:choose>
									<c:when test="${leave.status==0 }">
									<td  align="center">未审批</td>
									</c:when>
									<c:when test="${leave.status==1 }">
									<td  align="center">已审批</td>
									</c:when>
									<c:when test="${leave.status==2 }">
									<td  align="center">已拒绝</td>
									</c:when>
									</c:choose>
									<td  align="center">${leave.reason }</td>
									<c:if test="${currentUser.supper==1}">
									<c:if test="${leave.status!=1 and leave.status!=2 and leave.whoId!=currentUser.id }">
										<td  align="center"><a href="leaveCheck.do?id=${leave.id }">[审核]</a></td>
									</c:if>
							       <c:if test="${leave.status==1 or leave.status==2 or leave.whoId==currentUser.id }">
										<td  align="center">&nbsp;</td>
									</c:if>
									</c:if>
								</tr>
								</c:forEach>
						
									<tr >
									<td align="center" colspan="7"><br/>
									  第${pages.currPageNo }/${pages.totalPageCount}页 &nbsp;&nbsp;
										<a href="leaveList.do?pageIndex=1"  <c:if test="${pages.currPageNo<=1}">disable='disable' </c:if>>首页</a>
										<a href="leaveList.do?pageIndex=${pages.currPageNo - 1>0?pages.currPageNo-1:1}" <c:if test="${pages.currPageNo<=1}">disable='disable' </c:if>>上一页</a>
										<a href="leaveList.do?pageIndex=${pages.currPageNo + 1<pages.totalPageCount?pages.currPageNo + 1:pages.totalPageCount}" <c:if test="${pages.currPageNo>=pages.totalPageCount}">disable='disable' </c:if>>下一页</a>
										<a href="leaveList.do?pageIndex=${pages.totalPageCount}" <c:if test="${pages.currPageNo>=pages.totalPageCount}">disable='disable' </c:if>>尾页</a>
									</td>
									</tr>
								<tr > 
									<td align="left" colspan="2"><br/>
									<input type="button"  id="save" value="申请休假" onclick="location.href='leaveApply.do'"/></td>
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
