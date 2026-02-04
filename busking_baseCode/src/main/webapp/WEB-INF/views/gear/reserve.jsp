<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>장비 예약</title>

  <!-- 공통 -->
  <link rel="stylesheet" href="../common.css" />
  <link rel="stylesheet" href="../main.css" />
  <link rel="stylesheet" href="./gear.css" />

  <!-- ✅ 예약 전용 CSS -->
  <link rel="stylesheet" href="./gearreserve.css" />
</head>

<body>
  <!-- ✅ 상단 헤더 -->
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

  <main class="main">
    <div class="container">

      <!-- ✅ 단계 표시 -->
      <div class="step">
        <div class="step-item on">
          <span class="dot">✔</span>
          <span class="txt">1. 장비 선택</span>
        </div>
        <div class="step-item">
          <span class="dot">2</span>
          <span class="txt">2. 정보 입력</span>
        </div>
      </div>

      <section class="reserve-wrap">
        <!-- ✅ 왼쪽: 선택 장비 카드 -->
        <article class="selected-card">
          <div class="selected-thumb" id="selThumb" aria-label="선택 장비 이미지"></div>
          <div class="selected-body">
            <div class="selected-title" id="selName">-</div>
            <div class="selected-price" id="selPrice">$0</div>
            <div class="selected-desc" id="selDesc">-</div>
          </div>
        </article>

        <!-- ✅ 오른쪽: 예약 폼 -->
        <section class="reserve-form">
          <h2 class="form-title">예약 정보 및 결제</h2>

          <div class="two-col">
            <!-- 예약자 정보 + 대여기간 + 주소 -->
            <div class="block">
              <div class="row">
                <div class="label">예약자명 :</div>
                <div class="value" id="uName">홍길동</div>
              </div>
              <div class="row">
                <div class="label">e-mail :</div>
                <div class="value" id="uEmail">user@example.com</div>
              </div>
              <div class="row">
                <div class="label">전화번호 :</div>
                <div class="value" id="uPhone">010-1234-5678</div>
              </div>

              <!-- ✅ 연락처 대신 주소 입력 -->
              <div class="row">
                <label class="label" for="address">주소 :</label>
                <input class="input" type="text" id="address" placeholder="주소를 입력하세요" />
              </div>

              <!-- ✅ 대여기간: 시작~종료 -->
              <div class="row row-top">
                <div class="label">대여 기간</div>
                <div class="range">
                  <div class="range-item">
                    <span class="mini">시작</span>
                    <input class="input" type="datetime-local" id="startDT" />
                  </div>
                  <div class="range-item">
                    <span class="mini">종료</span>
                    <input class="input" type="datetime-local" id="endDT" />
                  </div>
                </div>
              </div>
            </div>

            <!-- 결제 방식 -->
            <div class="block">
              <div class="row row-last">
                <div class="label">결제 방식 :</div>
                <div class="pay">
                  <label class="radio">
                    <input type="radio" name="payType" value="휴대폰 결제" checked />
                    <span>휴대폰 결제</span>
                  </label>

                  <label class="radio">
                    <input type="radio" name="payType" value="간편 결제" />
                    <span>간편 결제</span>
                  </label>
                </div>
              </div>
            </div>
          </div>

          <!-- 예약 버튼 -->
          <div class="form-actions">
            <button class="reserve-btn" type="button" id="reserveBtn">예약하기</button>
          </div>
        </section>
      </section>

    </div>
  </main>

  <footer class="footer">
    <div class="container">
      <p>© Busking Reservation</p>
    </div>
  </footer>

  <script>
    // ✅ 선택 장비 표시(sessionStorage)
    const raw = sessionStorage.getItem("selectedGear");

    if (!raw) {
      alert("선택한 장비가 없습니다. 장비 목록으로 이동합니다.");
      location.href = "./gearmain.html";
    }

    const gear = raw ? JSON.parse(raw) : null;

    // 왼쪽 카드 채우기
    const selThumb = document.getElementById("selThumb");
    const selName  = document.getElementById("selName");
    const selPrice = document.getElementById("selPrice");
    const selDesc  = document.getElementById("selDesc");

    if (gear) {
      selName.textContent = gear.name || "-";
      selPrice.textContent = `$${gear.price ?? 0}`;
      selDesc.textContent = gear.desc || "-";

      if (gear.img) {
        selThumb.style.backgroundImage = `url("${gear.img}")`;
      }
      selThumb.style.backgroundSize = "cover";
      selThumb.style.backgroundPosition = "center";
      selThumb.setAttribute("aria-label", (gear.name || "선택 장비") + " 이미지");
    }

    // ✅ 예약 버튼: 유효성 검사 + confirm
 // ✅ 예약 버튼: 유효성 + confirm 팝업
document.getElementById("reserveBtn").addEventListener("click", () => {
  const address = document.getElementById("address").value.trim();
  const startDT = document.getElementById("startDT").value;
  const endDT   = document.getElementById("endDT").value;
  const payType = document.querySelector('input[name="payType"]:checked').value;

  if (!gear) {
    alert("선택한 장비가 없습니다. 장비를 다시 선택해주세요.");
    location.href = "./list.jsp";
    return;
  }
  if (!address) { alert("주소를 입력해주세요."); return; }
  if (!startDT || !endDT) { alert("대여 시작/종료 날짜와 시간을 모두 선택해주세요."); return; }
  if (new Date(startDT) >= new Date(endDT)) { alert("종료 시간이 시작 시간보다 이후여야 합니다."); return; }

  const ok = confirm(
    `[예약 확인]\n` +
    `장비: ${gear.name}\n` +
    `기간: ${startDT} ~ ${endDT}\n` +
    `결제: ${payType}\n\n` +
    `예약하시겠습니까?`
  );
  if (!ok) return;

  // ✅ 완료페이지에서 쓸 정보 저장
  const reservationInfo = {
    gear,
    user: {
      name: "홍길동",                 // 로그인된 상태 가정(임의)
      phone: "010-1234-5678",
      email: "user@example.com"
    },
    address,
    payType,
    period: { start: startDT, end: endDT }
  };

  sessionStorage.setItem("reservationInfo", JSON.stringify(reservationInfo));

  // ✅ 완료 페이지로 이동
  location.href = "./reserveComplete.jsp";
});
  </script>
</body>
</html>
