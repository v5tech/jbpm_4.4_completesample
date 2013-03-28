package com.jbpm.manager;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.jbpm.api.ProcessDefinition;
import org.jbpm.api.ProcessInstance;
import org.jbpm.api.history.HistoryProcessInstance;
import org.jbpm.api.model.ActivityCoordinates;
import org.jbpm.api.task.Task;

/**
 * jbpm管理类接口
 * 
 * @author Administrator
 * 
 */
public interface JbpmManager {
	/**
	 * 获取以部署的流程
	 * 
	 * @return
	 */
	public List<ProcessDefinition> getProcessDefinitions();

	/**
	 * 发布新流程
	 */
	public void deploy();

	/**
	 * 移除新流程
	 * 
	 * @param id
	 */
	public void undeploy(String id);

	/**
	 * 启动流程实例
	 * 
	 * @param id
	 * @param object
	 */
	public void start(String id, Map<String, Object> map);

	/**
	 * 获取流程实例
	 * 
	 * @return
	 */
	public List<ProcessInstance> getProcessInstances();

	/**
	 * 获取代办任务列表
	 * 
	 * @param roleName
	 * @return
	 */
	public List<Task> getTasks(String roleName);

	/**
	 * 处理任务
	 * 
	 * @param taskId
	 * @param map
	 */
	public void complate(String taskId, Map<String, Object> map);

	/**
	 * 查询流程实例的参数集合
	 * 
	 * @param id
	 * @return
	 */
	public Map<String, Object> manager(String id);

	/**
	 * 经理处理流程
	 * 
	 * @param id
	 * @param result
	 */
	public void complateByManager(String id, String result);

	/**
	 * 老板请求
	 * 
	 * @param id
	 * @return
	 */
	public Map<String, Object> boss(String id);

	/**
	 * 老板处理
	 * 
	 * @param id
	 */
	public void complateByBoss(String id);

	/**
	 * 获取历史流程实例
	 * 
	 * @return
	 */
	public List<HistoryProcessInstance> getHistoryProcessInstances();

	/**
	 * 查找流程图的活动坐标
	 * 
	 * @param id
	 * @return
	 */
	public ActivityCoordinates findActivityCoordinates(String id);

	/**
	 * 查找图片输入流
	 * 
	 * @param id
	 * @return
	 */
	public InputStream findPicInputStream(String id);
}
