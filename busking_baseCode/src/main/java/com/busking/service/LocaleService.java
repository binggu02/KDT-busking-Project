package com.busking.service;

import java.util.Optional;

import com.busking.domain.Locale;
import com.busking.repository.LocaleRepository;

public class LocaleService {

	private final LocaleRepository localeRepository;

	public LocaleService(LocaleRepository localeRepository) {
		this.localeRepository = localeRepository;
	}

	public Optional<Locale> findById(String id){
		return localeRepository.findById(id);
	}
}
