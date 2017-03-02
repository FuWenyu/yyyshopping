/*
 * 

 * 
 */
package com.easyshopping;

import java.util.List;
import java.util.Map;

/**
 * 消息
 * 
 * 
 * @version 1.0
 * @param <T>
 */
public class AppMessage {

	/**
	 * 类型
	 */
	public enum Type {

		/** 成功 */
		success,

		/** 警告 */
		warn,

		/** 错误 */
		error
	}

	/** 类型 */
	private Type type;

	/** 内容 */
	private String content;

	private List<?> list;
	
	private Map<?,?> map;
	/**
	 * 初始化一个新创建的 Message 对象，使其表示一个空消息。
	 */
	public AppMessage() {

	}

	/**
	 * 初始化一个新创建的 Message 对象
	 * 
	 * @param type
	 *            类型
	 * @param content
	 *            内容
	 */
	public AppMessage(Type type, String content) {
		this.type = type;
		this.content = content;
	}
	
	/**
	 * 初始化一个新创建的 Message 对象
	 * 
	 * @param type
	 *            类型
	 * @param content
	 *            内容
	 */
	public AppMessage(Type type, String content,List<?> list) {
		this.type = type;
		this.content = content;
		this.list = list;
	}
	
	/**
	 * 初始化一个新创建的 Message 对象
	 * 
	 * @param type
	 *            类型
	 * @param content
	 *            内容
	 */
	public AppMessage(Type type, String content,Map<?,?> map) {
		this.type = type;
		this.content = content;
		this.map = map;
	}

	/**
	 * 返回成功消息
	 * 
	 * @param content
	 *            内容
	 * @param args
	 *            参数
	 * @return 成功消息
	 */
	public static AppMessage success(String content) {
		return new AppMessage(Type.success, content);
	}

	/**
	 * 返回警告消息
	 * 
	 * @param content
	 *            内容
	 * @param args
	 *            参数
	 * @return 警告消息
	 */
	public static AppMessage warn(String content) {
		return new AppMessage(Type.warn, content);
	}

	/**
	 * 返回错误消息
	 * 
	 * @param content
	 *            内容
	 * @param args
	 *            参数
	 * @return 错误消息
	 */
	public static AppMessage error(String content) {
		return new AppMessage(Type.error, content);
	}

	/**
	 * 返回成功消息
	 * 
	 * @param content
	 *            内容
	 * @param args
	 *            参数
	 * @return 成功消息
	 */
	public static AppMessage success(String content, List<?> list) {
		return new AppMessage(Type.success, content,list);
	}

	/**
	 * 返回警告消息
	 * 
	 * @param content
	 *            内容
	 * @param args
	 *            参数
	 * @return 警告消息
	 */
	public static AppMessage warn(String content,List<?> list) {
		return new AppMessage(Type.warn, content,list);
	}

	/**
	 * 返回错误消息
	 * 
	 * @param content
	 *            内容
	 * @param args
	 *            参数
	 * @return 错误消息
	 */
	public static AppMessage error(String content, List<?> list) {
		return new AppMessage(Type.error, content,list);
	}
	
	/**
	 * 返回成功消息
	 * 
	 * @param content
	 *            内容
	 * @param args
	 *            参数
	 * @return 成功消息
	 */
	public static AppMessage success(String content, Map<?,?> map) {
		return new AppMessage(Type.success, content,map);
	}

	/**
	 * 返回警告消息
	 * 
	 * @param content
	 *            内容
	 * @param args
	 *            参数
	 * @return 警告消息
	 */
	public static AppMessage warn(String content,Map<?,?> map) {
		return new AppMessage(Type.warn, content,map);
	}

	/**
	 * 返回错误消息
	 * 
	 * @param content
	 *            内容
	 * @param args
	 *            参数
	 * @return 错误消息
	 */
	public static AppMessage error(String content, Map<?,?> map) {
		return new AppMessage(Type.error, content,map);
	}

	/**
	 * 获取类型
	 * 
	 * @return 类型
	 */
	public Type getType() {
		return type;
	}

	/**
	 * 设置类型
	 * 
	 * @param type
	 *            类型
	 */
	public void setType(Type type) {
		this.type = type;
	}

	/**
	 * 获取内容
	 * 
	 * @return 内容
	 */
	public String getContent() {
		return content;
	}

	/**
	 * 设置内容
	 * 
	 * @param content
	 *            内容
	 */
	public void setContent(String content) {
		this.content = content;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}

	public Map<?, ?> getMap() {
		return map;
	}

	public void setMap(Map<?, ?> map) {
		this.map = map;
	}
	
}