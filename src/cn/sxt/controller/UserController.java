package cn.sxt.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.sxt.entity.Groups;
import cn.sxt.entity.User;
import cn.sxt.service.UserService;

@Controller("userController")
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("querUsername")
	@ResponseBody
	public Object querUsername(String username){
		System.out.println(username);
		Map<String,Integer> result = new HashMap<>();
		
		try{
			int i = this.userService.querUsername(username);
			result.put("exist", i);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("querType")
	@ResponseBody
	public Object querType(){
		
		List<Groups> dataList = this.userService.queryType();
		for(Groups d:dataList){
			System.out.println(d);
		}
		return dataList;
	}
	
	
	@RequestMapping("login")
	public Object login(User user,HttpSession session){
		try{
			User u = this.userService.loginUser(user);
			session.setAttribute("loginUser", u);
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("µÇÂ½Ê§°Ü£¡~");
			return "redirect:/index.jsp";
		}
		return "redirect:/toMain.do";
	}
	
	@RequestMapping("register")
	public Object register(User user){
		System.out.println(user);
		try{
			this.userService.register(user);
		}catch(Exception e){
			return "error";
		}
		return "success";
	}
	
	
}
