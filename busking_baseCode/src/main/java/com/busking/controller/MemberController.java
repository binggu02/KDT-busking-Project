package com.busking.controller;

import com.busking.entity.Member;
import com.busking.service.MemberService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
            return "login"; // 로그인 실패
        }

        // ⭐ 로그인 성공 → 세션 생성
        session.setAttribute("loginUser", member);

        return "redirect:/mypage";
    }

    // 🚪 로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    // ================= 아이디 찾기 =================
    @PostMapping("/find-id")
    public String findId(@RequestParam String name,
                         @RequestParam String phone,
                         @RequestParam String email,
                         Model model) {

        String memberId = memberService.findMemberId(name, phone, email);

        model.addAttribute("memberId", memberId);
        return "member/findIdResult"; // 결과 JSP
    }

    // ================= 비밀번호 찾기 =================
    @PostMapping("/find-pw")
    public String findPw(@RequestParam String name,
                         @RequestParam String memberId,
                         @RequestParam String phone,
                         @RequestParam String email,
                         Model model) {

        boolean result = memberService.checkMemberForPw(name, memberId, phone, email);

        model.addAttribute("result", result);
        model.addAttribute("memberId", memberId);

        return "member/findPwResult"; // 결과 JSP
    }
}
