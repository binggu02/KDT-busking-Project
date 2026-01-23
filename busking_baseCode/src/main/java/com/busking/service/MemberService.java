package com.busking.service;

import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.busking.domain.Member;
import com.busking.repository.MemberRepository;

// 회원 관리에 필요한 메소드 정의하시면 됩니다.

@Service
@Transactional
public class MemberService {

	private final MemberRepository memberRepository;

	// 의존성 주입
	public MemberService(MemberRepository memberRepository) {
		// TODO Auto-generated constructor stub
		this.memberRepository = memberRepository;
	}

	public Optional<Member> findById(String id) {
		return memberRepository.findById(id);
	}
}
