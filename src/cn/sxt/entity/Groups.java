package cn.sxt.entity;

import java.io.Serializable;

public class Groups implements Serializable{
	private Integer id;
	private String name;
	private String userNum;
	
	
	@Override
	public String toString() {
		return "Groups [id=" + id + ", name=" + name + ", userNum=" + userNum + "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserNum() {
		return userNum;
	}
	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}
	
}
