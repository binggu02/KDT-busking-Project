<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Busking Reservation - Main</title>

  <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
</head>
<body>

<div class="page">

  <!-- ================= HEADER ================= -->
  <header class="header">
    <div class="container header-inner">

      <a class="logo" href="<c:url value='/'/>">
        <img src="<c:url value='/images/buskinglogo.png'/>" alt="Busking Logo" class="logo-icon" />
        <div class="logo-text">
          <strong>BUSKING</strong><br />
          RESERVATION
        </div>
      </a>

      <nav class="nav">
        <a href="<c:url value='/gear/gearlist'/>">장비 예약</a>
        <a href="<c:url value='/local/locallist'/>">지역별 장소 예약</a>
        <a href="<c:url value='/board/boardmain'/>">게시판</a>
      </nav>

      <!-- ✅ 로그인 상태일 때만 표시 -->
      <c:if test="${not empty sessionScope.loginUser}">
        <div class="auth">
          <span>
            <c:choose>
              <c:when test="${not empty sessionScope.loginUser.nickname}">
                ${sessionScope.loginUser.nickname}님
              </c:when>
              <c:otherwise>
                ${sessionScope.loginUser.memberId}님
              </c:otherwise>
            </c:choose>
          </span>
          <a href="<c:url value='/member/logout'/>">logout</a>
        </div>
      </c:if>

    </div>
  </header>

  <!-- ================= HERO ================= -->
  <section class="hero">
    <div class="container hero-inner">
      <h1>나만의 버스킹 무대를 펼쳐보세요</h1>
    </div>
  </section>

  <!-- ================= MAIN ================= -->
  <main class="main">
    <div class="container">

      <!-- 인기 장소 -->
      <section class="section">
        <div class="section-head">
          <h2>인기 장소</h2>
          <a class="more" href="<c:url value='/local/locallist'/>">더보기</a>
        </div>

        <div class="grid grid-3">

          <article class="card place-card">
            <a href="<c:url value='/local/detail?placeId=1'/>" class="place-link">
              <div class="thumb">
                <img src="<c:url value='/images/01.jpg'/>" alt="홍대 걷고싶은거리">
              </div>
              <div class="card-body">
                <h3 class="card-title">홍대 걷고싶은거리</h3>
                <p class="card-desc">서울 마포구</p>
              </div>
            </a>
          </article>

          <article class="card place-card">
            <a href="<c:url value='/local/detail?placeId=2'/>" class="place-link">
              <div class="thumb">
                <img src="<c:url value='/images/02.jpg'/>" alt="한강 반포공원">
              </div>
              <div class="card-body">
                <h3 class="card-title">한강 반포공원</h3>
                <p class="card-desc">서울 서초구</p>
              </div>
            </a>
          </article>

          <article class="card place-card">
            <a href="<c:url value='/local/detail?placeId=3'/>" class="place-link">
              <div class="thumb">
                <img src="<c:url value='/images/03.jpg'/>" alt="광안리 해변">
              </div>
              <div class="card-body">
                <h3 class="card-title">광안리 해변</h3>
                <p class="card-desc">부산 수영구</p>
              </div>
            </a>
          </article>

        </div>
      </section>

      <!-- 게시판 인기글 -->
      <section class="section">
        <div class="section-head">
          <h2>게시판 인기글</h2>
          <a class="more" href="<c:url value='/board/boardmain'/>">더보기</a>
        </div>

        <ul class="list">
          <li class="list-item">
            <a href="<c:url value='/board/detail?postId=101'/>">[공지] 2월 대관 신청 오픈 안내</a>
            <span class="meta">2026-01-27</span>
          </li>
          <li class="list-item">
            <a href="<c:url value='/board/detail?postId=102'/>">홍대 버스킹 스피커 추천 / 세팅 팁</a>
            <span class="meta">2026-01-26</span>
          </li>
          <li class="list-item">
            <a href="<c:url value='/board/detail?postId=103'/>">야외 공연 시 전원(배터리) 구성 어떻게 해요?</a>
            <span class="meta">2026-01-25</span>
          </li>
          <li class="list-item">
            <a href="<c:url value='/board/detail?postId=104'/>">[후기] 반포에서 버스킹했는데 반응 미쳤다…</a>
            <span class="meta">2026-01-24</span>
          </li>
          <li class="list-item">
            <a href="<c:url value='/board/detail?postId=105'/>">처음 버스킹하는데 곡 구성 조언 부탁드립니다!</a>
            <span class="meta">2026-01-23</span>
          </li>
        </ul>
      </section>

    </div>
  </main>

  <!-- ================= FOOTER ================= -->
  <footer class="footer">
    <div class="container">
      <p>© Busking Reservation</p>
    </div>
  </footer>

</div>

</body>
</html>
