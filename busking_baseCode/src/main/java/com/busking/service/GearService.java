package com.busking.service;

import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.busking.domain.Gear;
import com.busking.repository.GearRepository;

@Service
@Transactional
public class GearService {
	private final GearRepository gearRepository;

	public GearService(GearRepository gearRepository) {
		this.gearRepository = gearRepository;
	}

	public Optional<Gear> findById(String id){
		return gearRepository.findById(id);
	}
}
