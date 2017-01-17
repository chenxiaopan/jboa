<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="flush.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<s:head/>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title><s:property value="pageTitle"/></title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css"></link>
	    <script type="text/javascript" src="scripts/jquery.js"></script>
	    <script type="text/javascript" src="scripts/jquery-ui.min.js"></script>
		<script type="text/javascript">
	  $(function() {
		$("#starttime,#endtime")
				.datepicker(
						{
							dateFormat : "yy-mm-dd",
							changeYear : true,
							changeMonth : true,
							//这句没用，下面那句才有用
							monthNames : [ '一月', '二月', '三月', '四月', '五月', '六月',
									'七月', '八月', '九月', '十月', '十一月', '十二月' ],
							monthNamesShort : [ '一月', '二月', '三月', '四月', '五月',
									'六月', '七月', '八月', '九月', '十月', '十一月', '十二月' ],
							dayNames : [ '星期日', '星期一', '星期二', '星期三', '星期四',
									'星期五', '星期六' ],
							dayNamesShort : [ '周日', '周一', '周二', '周三', '周四',
									'周五', '周六' ],
							dayNamesMin : [ '日', '一', '二', '三', '四', '五', '六' ],

						});
					});
						
			function setit()
			{
				if(document.getElementById("starttime").value==""){
					alert("开始时间不能为空！");
					return false;
				}
				if(document.getElementById("endtime").value==""){
					alert("结束时间不能为空！");
					return false;
				}
				if(document.getElementById("leaveday").value==""){
					alert("休假天数不能为空！");
					return false;
				}
				document.forms[0].submit();
			}
			
			function day(){
			  var s=$("#starttime").val().split("-");
			  var e=$("#endtime").val().split("-");
			  
			  var date1=new Date(s[0],s[1],s[2]);
			  var date2=new Date(e[0],e[1],e[2]);
			  
			  var aa=$("#leaveday").val((date2.getTime()-date1.getTime())/(24*60*60*1000)+1);
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
				<span style="font-weight:bolder; color: blue">${currentUser.nickname }</span>  你好！欢迎访问办公管理系统！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="location.href='loginOut.action'";>注销</a>
			</div>
		</div>
		<form id="myForm" name="myForm" action="leave!doApply.do" method="post">
		<input type="hidden" name="whoId" value="${currentUser.id }"/>
		<input type="hidden" name="status" value="0"/>
		<div class="main">
			<div class="global-width">
				<jsp:include page="leftPanel.jsp"></jsp:include>
					<div class="action">
						<div class="t">
							申请休假
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td align="right" width="30%">姓名：</td><td  align="left"><input id="name" value="${currentUser.nickname }" name="name" readonly="readonly"/></td>
								</tr>
								<tr>
									<td align="right">开始时间：</td>
									<td align="left"><input id="starttime"  name="starttime"    readonly="readonly"/><font color="red">*</font></td>
								</tr>
								<tr>
									<td align="right">结束时间：</td>
									<td align="left"><input id="endtime"  name="endtime"   readonly="readonly"/><font color="red">*</font></td>
								</tr>
								<tr>
									<td align="right">请假天数：</td>
									<td align="left"><input id="leaveday"  name="leaveDay" onclick="day()"  /><font color="red">*</font></td>
								</tr>
								<tr>
									<td align="right" valign="top">请假原因：</td>
									<td align="left"><input id="reason" value="" name="reason" cols="30" rows="10" theme="simple"/></td>
								</tr>
								<tr>
									<td align="right">审批人：</td><td align="left">
									<select name="checkId">
									<c:forEach items="${checkList}" var="check">
									<option  value="${check.id }">${check.nickname }</option>
									</c:forEach>
									</select></td>
								</tr>
								<tr >
									<td align="center" colspan="2"><br/>
									<input type="button"  id="save" value="提交申请" onclick="setit()" />&nbsp;<input type="button"  id="save" value="返回" onclick="history.go(-1)"/></td>
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
