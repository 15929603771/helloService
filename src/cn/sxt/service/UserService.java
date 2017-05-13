package cn.sxt.service;

import java.util.List;

import cn.sxt.entity.Groups;
import cn.sxt.entity.User;

public interface UserService {

	void register(User user) throws Exception;

	User loginUser(User user);

	List<Groups> queryType();

	int querUsername(String username);

}
