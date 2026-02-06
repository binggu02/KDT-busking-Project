package com.busking.service;

import com.busking.domain.Gear;
import com.busking.repository.GearRepository;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class GearService {

    private final GearRepository gearRepository;

    public GearService(GearRepository gearRepository) {
        this.gearRepository = gearRepository;
    }

    public List<Gear> findAll() {
        return gearRepository.findAll();
    }
}
