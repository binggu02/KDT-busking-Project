package com.busking.service;

import com.busking.domain.Gear;

import com.busking.domain.GearReservation;
import com.busking.domain.Member;
import com.busking.repository.GearRepository;
import com.busking.repository.GearReservationRepository;
import com.busking.repository.MemberRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDateTime;

@Service
public class GearReservationService {

    private final GearReservationRepository reservationRepository;
    private final GearRepository gearRepository;
    private final MemberRepository memberRepository;

    public GearReservationService(
            GearReservationRepository reservationRepository,
            GearRepository gearRepository,
            MemberRepository memberRepository
    ) {
        this.reservationRepository = reservationRepository;
        this.gearRepository = gearRepository;
        this.memberRepository = memberRepository;
    }

    @Transactional
    public void reserve(
            Long gearId,
            Long memberId,
            LocalDateTime start,
            LocalDateTime end
    ) {
        if (!start.isBefore(end)) {
            throw new IllegalArgumentException("종료 시간은 시작 시간 이후여야 합니다.");
        }

        if (start.isBefore(LocalDateTime.now())) {
            throw new IllegalArgumentException("과거 시간은 예약할 수 없습니다.");
        }

        long overlap = reservationRepository.countOverlap(gearId, start, end);
        if (overlap > 0) {
            throw new IllegalStateException("이미 해당 시간에 예약된 장비입니다.");
        }

        Gear gear = gearRepository.findById(gearId)
                .orElseThrow(() -> new IllegalArgumentException("장비가 존재하지 않습니다."));

        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new IllegalArgumentException("회원이 존재하지 않습니다."));

        GearReservation reservation = new GearReservation();
        reservation.setGear(gear);
        reservation.setMember(member);
        reservation.setStartDatetime(start);
        reservation.setEndDatetime(end);
        reservation.setStatus("RESERVED");

        reservationRepository.save(reservation);
    }
}
