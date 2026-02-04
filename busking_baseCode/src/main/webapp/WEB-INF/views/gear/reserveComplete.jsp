<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>예약 완료</title>

  <!-- 공통 -->
  <link rel="stylesheet" href="../common.css" />
  <link rel="stylesheet" href="../main.css" />

  <!-- 완료 페이지 전용 -->
  <link rel="stylesheet" href="./gearreserveComplete.css" />
</head>

<body>
  <!-- 상단 헤더(기존 스타일 그대로) -->
  <header class="header">
      <div class="container header-inner">
        <a class="logo" href="../home.jsp">
          <img src="../buskinglogo.png" alt="BUSKING RESERVATION" class="logo-icon" />
        </a>

  	  <nav class="nav">
  	      <a href="../gear/list.jsp">장비 예약</a>
  	      <a href="../locale/list.jsp">지역별 장소 예약</a>
  	      <a href="../board/main.jsp">게시판</a>
  	    </nav>

  	    <div class="auth">
  	      <a class="pill" href="../mypage/main.jsp">my page</a>
  	      <a class="pill" href="../member/login.jsp">logout</a>
  	    </div>
  	  </div>
  </header>

  <main class="main complete-main">
    <div class="container">

      <section class="complete-wrap">
        <div class="complete-box">

          <!-- 체크 아이콘 -->
          <div class="check-icon" aria-hidden="true">
            <svg width="58" height="58" viewBox="0 0 24 24" fill="none">
              <path d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10Z"
                    stroke="currentColor" stroke-width="1.8"/>
              <path d="M7 12.2l3.1 3.1L17.4 8.9"
                    stroke="currentColor" stroke-width="2.0" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
          </div>

          <h2 class="complete-title">예약이 완료되었습니다 !</h2>

          <!-- 가운데 작은 카드 -->
          <article class="mini-card">
            <div class="mini-thumb" id="cThumb" aria-label="선택 장비 이미지"></div>

            <div class="mini-body">
              <div class="mini-gear" id="cGearName">-</div>

              <dl class="mini-info">
                <div class="mini-row">
                  <dt>예약자 명 :</dt>
                  <dd id="cUserName">-</dd>
                </div>
                <div class="mini-row">
                  <dt>전화번호 :</dt>
                  <dd id="cPhone">-</dd>
                </div>
                <div class="mini-row">
                  <dt>e-mail :</dt>
                  <dd id="cEmail">-</dd>
                </div>
                <div class="mini-row">
                  <dt>사용 기간 :</dt>
                  <dd id="cPeriod">-</dd>
                </div>
              </dl>
            </div>
          </article>

          <div class="complete-actions">
            <button class="btn-line" type="button" onclick="location.href='list.jsp'">장비 더 보기</button>
            <button class="btn-dark" type="button" onclick="location.href='../mypage/main.jsp'">마이페이지</button>
          </div>

        </div>
      </section>

    </div>
  </main>

  <footer class="footer">
    <div class="container">
      <p>© Busking Reservation</p>
    </div>
  </footer>

  <script>
    // reserve 페이지에서 저장한 예약정보 꺼내기
    const raw = sessionStorage.getItem("reservationInfo");

    if (!raw) {
      alert("예약 정보가 없습니다. 장비 목록으로 이동합니다.");
      location.href = "./list.jsp";
    } else {
      const data = JSON.parse(raw);

      const pretty = (dt) => (dt ? dt.replace("T", " ") : "-");

      // 장비 정보
      document.getElementById("cGearName").textContent = data.gear?.name || "-";

      const thumb = document.getElementById("cThumb");
      if (data.gear?.img) {
        thumb.style.backgroundImage = `url("${data.gear.img}")`;
        thumb.style.backgroundSize = "cover";
        thumb.style.backgroundPosition = "center";
      }

      // 사용자/예약 정보
      document.getElementById("cUserName").textContent = data.user?.name || "-";
      document.getElementById("cPhone").textContent    = data.user?.phone || "-";
      document.getElementById("cEmail").textContent    = data.user?.email || "-";

      const start = pretty(data.period?.start);
      const end   = pretty(data.period?.end);
      document.getElementById("cPeriod").textContent = `${start} ~ ${end}`;
    }
  </script>
</body>
</html>
