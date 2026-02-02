<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Busking Reservation - Main</title>

  <!-- ✅ static 바로 아래에 있는 CSS -->
  <link rel="stylesheet" href="/css/common.css" />
  <link rel="stylesheet" href="/css/main.css/" />
</head>
<body>

  <div class="page">

    <!-- ================= HEADER ================= -->
    <header class="header">
      <div class="container header-inner">

        <a class="logo" href="<c:url value='/'/>">
          <!-- ✅ static/image 아래 이미지 -->
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

        <!-- 로그인/회원가입: sessionScope.loginUser 기준 -->
        <div class="auth">
          <c:choose>
            <c:when test="${not empty sessionScope.loginUser}">
              <span>${sessionScope.loginUser.nickname}님</span>
              <a href="<c:url value='/member/logout'/>">logout</a>
            </c:when>
            <c:otherwise>
              <a href="/login">로그인</a>
              <a href="<c:url value='/member/join'/>">join</a>
            </c:otherwise>
          </c:choose>
        </div>

      </div>
    </header>

    <!-- ================= HERO ================= -->
    <!-- ✅ 배너는 main.css에서 .hero { background-image: url("/image/busking.png"); } 로 처리 -->
    <section class="hero">
      <div class="container hero-inner">
        <h1>나만의 버스킹 무대를 펼쳐보세요</h1>
        <!-- 필요하면 설명/버튼 추가 가능
        <p>원하는 장소와 시간을 예약하고 멋진 공연을 시작하세요</p>
        <div class="hero-actions">
          <a class="btn" href="<c:url value='/local/locallist'/>">장소 보러가기</a>
          <a class="btn" href="<c:url value='/gear/gearlist'/>">장비 보러가기</a>
        </div>
        -->
      </div>
    </section>

    <!-- ================= MAIN ================= -->
    <main class="main">
      <div class="container">

        <!-- ✅ 인기 장소 -->
        <section class="section">
          <div class="section-head">
            <h2>인기 장소</h2>
            <a class="more" href="<c:url value='/local/locallist'/>">더보기</a>
          </div>

          <div class="grid grid-3">
            <article class="card place-card">
              <a href="<c:url value='/local/detail?placeId=1'/>" class="place-link">
                <div class="thumb">
                  <img src="<c:url value='/image/01.jpg'/>" alt="인기 장소 1">
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
                  <img src="<c:url value='/image/02.jpg'/>" alt="인기 장소 2">
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
                  <img src="<c:url value='/image/03.jpg'/>" alt="인기 장소 3">
                </div>
                <div class="card-body">
                  <h3 class="card-title">광안리 해변</h3>
                  <p class="card-desc">부산 수영구</p>
                </div>
              </a>
            </article>
          </div>
        </section>

        <!-- ✅ 게시판 인기글 (임시 데이터) -->
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
