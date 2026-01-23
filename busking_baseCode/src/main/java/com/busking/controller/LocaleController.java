package com.busking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/locale")
public class LocaleController {

	@GetMapping("/test")
	public String test() {
		// TODO Auto-generated method stub
		return "test";
	}
}
