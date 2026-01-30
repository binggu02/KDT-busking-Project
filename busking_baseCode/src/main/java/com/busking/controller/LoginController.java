package com.busking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    // 고정 계정 (나중에 DB로 교체)
    private static final String FIXED_ID = "busking";
    private static final String FIXED_PW = "1234";

    @PostMapping("/login")
    public String login(
            @RequestParam String userName,
            @RequestParam String userPassword,
            Model model
    ) {
        if (!FIXED_ID.equals(userName)) {
            model.addAttribute("error", "아이디가 틀렸습니다.");
            return "member/login"; // 로그인 페이지로 다시
        }

        if (!FIXED_PW.equals(userPassword)) {
            model.addAttribute("error", "비밀번호가 틀렸습니다.");
            return "member/login";
        }

        // 로그인 성공
        return "redirect:/loginhome";
    }
}
