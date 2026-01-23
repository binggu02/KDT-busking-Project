package com.busking.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.busking.domain.Member;


@Repository
public interface MemberRepository extends JpaRepository<Member, String> {
	@Override
	Optional<Member> findById(String id);

}
