package com.busking.repository;

import com.busking.domain.Gear;

import org.springframework.data.jpa.repository.JpaRepository;

public interface GearRepository extends JpaRepository<Gear, Long> {
}
