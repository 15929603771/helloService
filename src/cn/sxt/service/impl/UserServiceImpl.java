package cn.sxt.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sxt.dao.UserDao;
import cn.sxt.entity.Groups;
import cn.sxt.entity.User;
import cn.sxt.service.UserService;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	
	
	
	@Override
	public int querUsername(String username) {
		
		List<User> dataList =new ArrayList<>();
		
		dataList = this.userDao.querUsername();
		for(User u : dataList){
			if(username.equals(u.getUsername())){
				return 1;
			}
		}
		
		return 0;
	}



	@Override
	public List<Groups> queryType() {
		List<Groups> dataList = this.userDao.queryType();
		return dataList;
	}



	@Override
	public User loginUser(User user) {
			User u = this.userDao.getUser(user);
			if(u == null)
				throw new RuntimeException("ÓÃ»§µÇÂ¼Ê§°Ü");
			return u;
	}



	@Override
	public void register(User user) throws Exception{
		
		int n = this.userDao.register(user);
		System.out.println(n);
		this.userDao.updateNum(user);
		
	}
	
	
}
