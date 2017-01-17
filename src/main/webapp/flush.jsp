<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	//清除页面缓存
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	response.flushBuffer();
%>