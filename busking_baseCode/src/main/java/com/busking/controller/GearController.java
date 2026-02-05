package com.busking.controller;

import com.busking.service.GearService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/gear")
public class GearController {

    private final GearService gearService;

    public GearController(GearService gearService) {
        this.gearService = gearService;
    }

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("gearList", gearService.findAll());
        return "gear/list";
    }
}

