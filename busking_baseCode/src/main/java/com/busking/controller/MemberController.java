package com.busking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.busking.domain.Member;
import com.busking.service.MemberService;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/members")
public class MemberController {

    private final MemberService memberService;
x
    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }

    // 1. 회원 목록 조회 (READ ALL)
    @GetMapping
    public String list(Model model) {
        List<Member> members = memberService.findAllMembers();
        model.addAttribute("members", members);  
        return "member_list"; // /WEB-INF/views/member_list.jsp
    }

    // 2. 회원 등록 폼 (CREATE FORM)
    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("member", new Member()); // 빈 Member 객체를 전달
        return "member_register_form"; // member_register.jsp로 이동
    } // /WEB-INF/views/member_register_form.jsp
    

    // 3. 회원 등록 처리 (CREATE POST)
    @PostMapping("/register")
    public String register(@ModelAttribute Member member) {
        memberService.join(member);
        // 등록 후 목록 페이지로 리다이렉트
        return "redirect:/members"; // 가입 후 목록 페이지로 리다이렉트
    }
    
    // 4. 특정 회원 상세 조회 (READ ONE)
    @GetMapping("/update/{id}")
    public String showUpdateForm(@PathVariable("id") String id, Model model) {
       Member member = memberService.getMemberById(id);
       model.addAttribute("member", member);
            return "member_update"; // member_update.jsp로 이동
        }

            
 //      return "member_view"; // /WEB-INF/views/member_view.jsp
            
//        else {
//            return "redirect:/members"; // 회원이 없으면 목록으로 돌아가기
//        }


  
        // 5. 회원 정보 수정 처리
        @PostMapping("/update")
        public String updateMember(@ModelAttribute Member member) {
            // 폼에서 전송된 Member 객체(수정된 데이터)를 Service로 전달하여 저장(업데이트)합니다.
            memberService.updateMember(member);
            return "redirect:/members"; // 수정 후 목록 페이지로 리다이렉트
        }

        // 6. 회원 정보 삭제 처리
        @PostMapping("/delete/{id}")
        public String delete(@PathVariable("id") String id) {
            memberService.deleteMember(id);
            return "redirect:/members"; // 삭제 후 목록 페이지로 리다이렉트
        }
    }
