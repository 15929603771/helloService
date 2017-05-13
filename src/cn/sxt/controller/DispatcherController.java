package cn.sxt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("dispatcherController")
public class DispatcherController {
	@RequestMapping("/toMain")
	public Object toMain(){
		return "main";
	}
	
}
