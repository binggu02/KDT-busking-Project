<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>예약 완료</title>

  <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/locale/list.css'/>" />
</head>

<body>
  <header class="header"
          style="background-image: url('<c:url value='/images/busking.png'/>');">
    <div class="container header-inner">
      <a class="logo" href="<c:url value='/'/>">
        <img src="<c:url value='/images/buskinglogo.png'/>"
             alt="BUSKING RESERVATION" class="logo-icon" />
      </a>

      <nav class="nav">
        <a href="<c:url value='/gear/list'/>">장비 예약</a>
        <a href="<c:url value='/locale/list'/>" class="is-active">지역별 장소 예약</a>
        <a href="<c:url value='/board/list'/>">게시판</a>
      </nav>

      <div class="auth">
        <a class="pill" href="<c:url value='/mypage/main'/>">my page</a>
        <a class="pill" href="<c:url value='/member/logout'/>">logout</a>
      </div>
    </div>
  </header>

  <main class="main">
    <div class="container">
      <h2 style="margin-bottom:16px;">예약 완료</h2>

      <div class="reservation-complete">
        <p>예약이 정상적으로 완료되었습니다!</p>

        <!-- ✅ reservation 모델 기반 출력 -->
        <div class="reservation-info">
          <p><strong>장소:</strong> <span>${reservation.place.name}</span></p>
          <p><strong>주소:</strong> <span>${reservation.place.address}</span></p>
          <p><strong>전화:</strong> <span>${reservation.place.phone}</span></p>

          <!-- userName은 세션/모델로 내려온 걸 쓰거나 없으면 '-' -->
          <p><strong>예약자:</strong>
            <span>
              <c:choose>
                <c:when test="${not empty userName}">${userName}</c:when>
                <c:otherwise>-</c:otherwise>
              </c:choose>
            </span>
          </p>

          <p><strong>밴드명:</strong> <span>${reservation.bandName}</span></p>
          <p><strong>인원:</strong> <span>${reservation.bandCount}</span></p>

          <p><strong>날짜/시간:</strong>
            <span>${reservation.reservationDate} ${reservation.startTime}</span>
          </p>

          <p><strong>전화번호:</strong>
            <span>
              <c:choose>
                <c:when test="${not empty reservation.phone}">${reservation.phone}</c:when>
                <c:otherwise>-</c:otherwise>
              </c:choose>
            </span>
          </p>

          <p><strong>이메일:</strong>
            <span>
              <c:choose>
                <c:when test="${not empty reservation.email}">${reservation.email}</c:when>
                <c:otherwise>-</c:otherwise>
              </c:choose>
            </span>
          </p>
        </div>

        <div class="actions" style="margin-top:24px;">
          <button id="goHome" class="region-btn">홈으로 돌아가기</button>
        </div>
      </div>
    </div>
  </main>

  <footer class="footer">
    <div class="container">
      <p>© Busking Reservation</p>
    </div>
  </footer>

  <script>
    document.getElementById('goHome').addEventListener('click', () => {
      location.href = "<c:url value='/'/>";
    });
  </script>
</body>
</html>
