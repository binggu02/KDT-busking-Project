package com.busking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyPageController {

	@GetMapping("/3")
	public String home() {
		// TODO Auto-generated method stub
		return "home";
	}

}
