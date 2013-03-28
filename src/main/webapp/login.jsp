<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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

		<title>jbpm请假流程登录</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style type="text/css">
table {
	width: 80%;
	top: 200px; border : 1px solid blue;
	border-collapse: collapse;
	border: 1px solid blue;
}

table tr td {
	border: 1px solid blue;
	border-collapse: collapse;
}
</style>
	</head>
	<body>
		<form action="login.html">
			<table align="center">
				<tr>
					<td align="center" colspan="3">
						<h1>
							登录界面
						</h1>
					</td>
				</tr>
				<tr>
					<td>
						请输入用户名：
					</td>
					<td colspan="2">
						<input name="userName" type="text" />
					</td>
				</tr>
				<tr>
					<td>
						请输入登录密码：
					</td>
					<td colspan="2">
						<input name="password" type="password" />
					</td>
				</tr>
				<tr>
					<td></td>
					<td style="width: 50%;">
						<input name="submit" type="submit" />
					</td>
					<td>
						<input name="cancel" type="reset" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
