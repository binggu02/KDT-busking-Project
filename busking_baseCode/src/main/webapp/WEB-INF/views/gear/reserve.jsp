<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>장비 예약</title>

  <!-- 공통 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/common.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/main.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/gear/gear.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/gear/gearreserve.css" />
</head>

<body>
<header class="header">
  <div class="container header-inner">
    <a class="logo" href="${pageContext.request.contextPath}/">
      <img src="${pageContext.request.contextPath}/buskinglogo.png" alt="BUSKING RESERVATION" />
    </a>

    <nav class="nav">
      <a href="${pageContext.request.contextPath}/gear/list">장비 예약</a>
      <a href="${pageContext.request.contextPath}/locale/list">지역별 장소 예약</a>
      <a href="${pageContext.request.contextPath}/board">게시판</a>
    </nav>

    <div class="auth">
      <a class="pill" href="${pageContext.request.contextPath}/mypage">my page</a>
      <a class="pill" href="${pageContext.request.contextPath}/member/logout">logout</a>
    </div>
  </div>
</header>

<main class="main">
  <div class="container">

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

      <!-- 선택 장비 -->
      <article class="selected-card">
        <div class="selected-thumb"></div>
        <div class="selected-body">
          <div class="selected-title">${gearName}</div>
          <div class="selected-price">₩${gearPrice}</div>
          <div class="selected-desc">${gearDesc}</div>
        </div>
      </article>

      <!-- 예약 폼 -->
      <section class="reserve-form">
        <h2 class="form-title">예약 정보</h2>

        <form action="${pageContext.request.contextPath}/gear/complete" method="get">
          <input type="hidden" name="gearId" value="${gearId}" />

          <div class="block">
            <div class="row">
              <label class="label">주소 :</label>
              <input class="input" type="text" name="address" required />
            </div>

            <div class="row">
              <label class="label">대여 시작</label>
              <input class="input" type="datetime-local" name="startDT" required />
            </div>

            <div class="row">
              <label class="label">대여 종료</label>
              <input class="input" type="datetime-local" name="endDT" required />
            </div>
          </div>

          <div class="form-actions">
            <button class="reserve-btn" type="submit">예약하기</button>
          </div>
        </form>
      </section>

    </section>
  </div>
</main>

<footer class="footer">
  <div class="container">
    <p>© Busking Reservation</p>
  </div>
</footer>
</body>
</html>
