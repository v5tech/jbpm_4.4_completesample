package com.jbpm.interceptor;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class LoginInterceptor extends MethodFilterInterceptor {
	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation invoke) throws Exception {
        if (null == ActionContext.getContext().getSession().get("user"))
        {
            return Action.LOGIN;
        }
        else
        {
            return invoke.invoke();
        }
	}
}
