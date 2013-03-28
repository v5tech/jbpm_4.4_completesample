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

		<title>jbpm请假流程设计示例</title>
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
	border: 1px solid blue;
	border-collapse: collapse;
}

table tr td {
	border: 1px solid blue;
	border-collapse: collapse;
}
</style>
	</head>
	<body>

		<table align="center">
			<tr>
				<td>
					登录用户名：
				</td>
				<td>
					${user }
				</td>
				<td>
					<a href="unlogin.html">注销登录</a>
				</td>
				<td>
					<a href="login.html">登录</a>
				</td>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td align="center" colspan="7">
					<h1>
						流程发布表单
					</h1>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					如果想发布流程请点击右边的链接
				</td>
				<td colspan="4">
					<a href="deploy.html">点击发布新流程</a>
				</td>
			</tr>
			<tr>
				<td>
					流程id
				</td>
				<td>
					发布id
				</td>
				<td>
					流程key
				</td>
				<td>
					流程name
				</td>
				<td>
					版本号
				</td>
				<td>
					移除
				</td>
				<td>
					启动流程
				</td>
			</tr>
			<!--
				此处用了el表达式来获取struts2值栈中的集合的值，当然也可以用struts2的
				<s:property value="ognl"/>来获取
				-->
			<s:iterator value="processDefinitions" var="dfinition">
				<tr>
					<td>
						${id }
					</td>
					<td>
						${deploymentId }
					</td>
					<td>
						${key }
					</td>
					<td>
						${name }
					</td>
					<td>
						${version }
					</td>
					<td>
						<a href="undeploy.html?id=${deploymentId }">删除流程</a>
					</td>
					<td>
						<a href="start.html?id=${id }">启动流程</a>
					</td>
				</tr>
			</s:iterator>
		</table>
		<br>
		<table align="center">
			<tr>
				<td align="center" colspan="7">
					<h1>
						所有流程实例表单表单
					</h1>
				</td>
			</tr>

			<tr>
				<td>
					实例id
				</td>
				<td>
					实例key
				</td>
				<td>
					实例name
				</td>
				<td>
					实例状态
				</td>
				<td>
					activityName
				</td>				
				<td>
					查看流程图
				</td>
			</tr>
			<!--
				此处用了el表达式来获取struts2值栈中的集合的值，当然也可以用struts2的
				<s:property value="ognl"/>来获取
				-->
			<s:iterator value="processInstances" var="instance">
				<tr>
					<td>
						<s:property value="#instance.id" />
					</td>
					<td>
						<s:property value="#instance.key" />
					</td>
					<td>
						<s:property value="#instance.name" />
					</td>
					<td>
						<s:property value="#instance.state" />
					</td>
					<td>
						<s:property value="findActiveActivityNames()" />
					</td>			
					<td>
						<a href="view.html?id=${id }">查看流程图</a>
					</td>
				</tr>
			</s:iterator>
		</table>
		<br>
		<table align="center">
			<tr>
				<td align="center" colspan="7">
					<h1>
						${user }用户待办任务
					</h1>
				</td>
			</tr>

			<tr>
				<td>
					任务id
				</td>
				<td>
					任务key
				</td>
				<td>
					任务name
				</td>
				<td>
					activityName
				</td>
				<td>
					指派人
				</td>
				<td>
					办理
				</td>

			</tr>
			<!--
				此处用了el表达式来获取struts2值栈中的集合的值，当然也可以用struts2的
				<s:property value="ognl"/>来获取
				-->
			<s:iterator value="tasks" var="task">
				<tr>
					<td>
						<s:property value="#task.id" />
					</td>
					<td>
						<s:property value="#task.key" />
					</td>
					<td>
						<s:property value="#task.name" />
					</td>
					<td>
						<s:property value="#task.activityName" />
					</td>
					<td>
					<s:property value="#task.assignee" />
					</td>
					<td>
						<a href="${formResourceName }?id=${id}">办理</a>
					</td>
				</tr>
			</s:iterator>
		</table>
		<br>
				<table align="center">
			<tr>
				<td align="center" colspan="7">
					<h1>
						历史流程实例
					</h1>
				</td>
			</tr>

			<tr>
				<td>
					流程实例id
				</td>
				<td>
					历史流程实例key
				</td>
				<td>
					开始时间
				</td>
				<td>
					结束时间
				</td>
				<td>
					结束节点名称
				</td>

			</tr>
			<!--
				此处用了el表达式来获取struts2值栈中的集合的值，当然也可以用struts2的
				<s:property value="ognl"/>来获取
				-->
			<s:iterator value="historyProcessInstances" var="history">
				<tr>
					<td>
						<s:property value="#history.processDefinitionId" />
					</td>
					<td>
						<s:property value="#history.key" />
					</td>
					<td>
						<s:property value="#history.startTime" />
					</td>
					<td>
						<s:property value="#history.endTime" />
					</td>
					<td>
					<s:property value="#history.endActivityName" />
					</td>
				</tr>
			</s:iterator>
		</table>
		
	</body>
</html>
