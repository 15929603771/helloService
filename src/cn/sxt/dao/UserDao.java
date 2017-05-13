package cn.sxt.dao;

import java.util.List;

import cn.sxt.entity.Groups;
import cn.sxt.entity.User;

public interface UserDao {

	int register(User user);

	void updateNum(User groupId);

	User getUser(User user);

	List<Groups> queryType();

	List<User> querUsername();

	Integer querUser(User user);

}
