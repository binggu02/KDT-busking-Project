package com.busking.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.busking.domain.Gear;


@Repository
public interface GearRepository extends JpaRepository<Gear, String>{
	// 아이디로 찾기
	@Override
	Optional<Gear> findById(String id);
}
