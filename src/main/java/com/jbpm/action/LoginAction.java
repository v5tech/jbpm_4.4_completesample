package com.jbpm.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 用于用户登录的action
 * 
 * @author Administrator
 * 
 */
public class LoginAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String userName;

	public String login() {
		// 这里模拟不同的角色登陆系统，会接到不同的待办任务
		String manager = "admin,centre,xie";
		String boss = "god,oo,test,boss";
		String roleName = "";// 要按此名去查找它所在的节点
		System.out.println(userName);

		if (userName==null) {
			return "login";
		}else if (manager.contains(userName)) {
			// 经理登陆
			roleName = "manager";
		} else if (boss.contains(userName)) {
			// 老板登陆
			roleName = "boss";
		} else {
			// 普通用户
			roleName = userName;
		}
		Map<String, Object> map = ActionContext.getContext().getSession();
		map.put("user", userName);
		map.put("role", roleName);
		return SUCCESS;
	}

	public String unlogin() {
		ActionContext.getContext().getSession().remove("user");
		return SUCCESS;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}
