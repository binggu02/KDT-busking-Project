package com.busking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

import com.busking.domain.Member;

@Repository
public interface MemberRepository extends JpaRepository<Member, String> {

    Optional<Member> findByMemberIdAndPw(String memberId, String pw);

}