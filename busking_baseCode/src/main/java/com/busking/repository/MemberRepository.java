package com.busking.repository;

import org.springframework.data.jpa.repository.JpaRepository;



import com.busking.domain.Member;


public interface MemberRepository extends JpaRepository<Member, String> {

    Member findByMemberId(String memberId);

    boolean existsByMemberId(String memberId);
}