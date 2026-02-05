package com.busking.controller;

import com.busking.domain.Member;
import com.busking.service.GearReservationService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller("adminGearReservationController")
@RequestMapping("/admin/gear")
public class GearReservationController {

    private final GearReservationService reservationService;

    public GearReservationController(GearReservationService reservationService) {
        this.reservationService = reservationService;
    }

    // ================= 예약 페이지 =================
    @GetMapping("/reserve")
    public String reserveForm(@RequestParam Long gearId, Model model) {
        model.addAttribute("gearId", gearId);
        return "gear/reserve";
    }
    //====예약 완료 페이지
    @GetMapping("/reserveComplete")
    public String reserveComplete() {
        return "gear/reserveComplete";
    }


    // ================= 예약 처리 =================
    @PostMapping("/reserve")
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

        try {
            DateTimeFormatter formatter =
                    DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

            LocalDateTime start = LocalDateTime.parse(startDT, formatter);
            LocalDateTime end   = LocalDateTime.parse(endDT, formatter);

            reservationService.reserve(
                    gearId,
                    loginUser.getId(),
                    start,
                    end
            );

        } catch (Exception e) {
            session.setAttribute("errorMessage", e.getMessage());
            return "redirect:/gear/reserve?gearId=" + gearId;
        }

        return "redirect:/gear/reserveComplete";
    }
}
