package com.busking.service;


import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.busking.domain.Border;
import com.busking.repository.BorderRepository;

@Service
@Transactional
public class BorderService {
	private final BorderRepository borderRepository;

	public BorderService(BorderRepository borderRepository) {
		this.borderRepository = borderRepository;
	}

	public Optional<Border> findById(String id){
		return borderRepository.findById(id);
	}
}
