package com.busking.controller;

import com.busking.domain.Member;
import com.busking.service.GearReservationService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
public class GearReservationController {

    private final GearReservationService reservationService;

    public GearReservationController(GearReservationService reservationService) {
        this.reservationService = reservationService;
    }

    @PostMapping("/gear/reserve")
    public String reserve(
            @RequestParam Long gearId,
            @RequestParam String startDT,
            @RequestParam String endDT,
            HttpSession session
    ) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/member/login";
        }

        Long memberId = loginUser.getId(); // 반드시 Long

        DateTimeFormatter formatter =
                DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

        LocalDateTime start = LocalDateTime.parse(startDT, formatter);
        LocalDateTime end   = LocalDateTime.parse(endDT, formatter);

        reservationService.reserve(gearId, memberId, start, end);

        return "redirect:/gear/reserveComplete";
    }
}
