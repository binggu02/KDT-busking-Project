package com.busking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional

import com.busking.domain.Member;
// Member 엔티티와 그 PK 타입(String)을 지정하여 상속받습니다.
@Repository
public interface MemberRepository extends JpaRepository<Member, String> {
    
	Optional<Member> findByMemberIdAndPw(String memberId, String pw);
    // Spring Data JPA는 메서드 이름으로 쿼리를 자동 생성합니다.
    // 필요시 여기에 추가적인 커스텀 메서드를 정의할 수 있습니다.
    // 예: Member findByName(String name);
}