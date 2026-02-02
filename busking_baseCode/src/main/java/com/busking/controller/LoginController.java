package com.busking.controller;

import com.busking.entity.Member;
import com.busking.service.MemberService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    // 🔐 로그인 처리
    @PostMapping("/login")
    public String login(@RequestParam String memberId,
                        @RequestParam String pw,
                        HttpSession session) {

        Member member = memberService.login(memberId, pw);

        if (member == null) {
            // 로그인 실패 → 다시 로그인 페이지
            return "login";
        }

        // ⭐ 로그인 성공 → 세션 생성
        session.setAttribute("loginUser", member);

        return "redirect:/mypage";
    }

    // 🚪 로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 삭제
        return "redirect:/";
    }
}
