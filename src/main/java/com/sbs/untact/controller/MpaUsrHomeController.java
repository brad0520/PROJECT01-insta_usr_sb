package com.sbs.untact.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

//http://localhost:8024/mpaUsr/home/main

@Controller
public class MpaUsrHomeController {
	@RequestMapping("/mpaUsr/home/main")
	@ResponseBody
	public String showMain() {
		return "안녕";
	}
	@RequestMapping("/mpaUsr/home/main2")
	@ResponseBody
	public String showMain2() {
		return "잘가";
	}
	@RequestMapping("/mpaUsr/home/main3")
	@ResponseBody
	public int showMain3(int a, int b) {
		return a + b;
	}
	@RequestMapping("/mpaUsr/home/main4")
	@ResponseBody
	public int showMain4(int a, int b) {
		return a - b;
	}
	
}
