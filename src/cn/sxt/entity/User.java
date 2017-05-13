package cn.sxt.entity;

import java.io.Serializable;

public class User implements Serializable{
	private Integer id;
	private String username;
	private String password;
	private Integer groupId;
	private Groups group;
	
	
	
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", groupId=" + groupId
				+ ", group=" + group + "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Groups getGroup() {
		return group;
	}
	public void setGroup(Groups group) {
		this.group = group;
	}
}
