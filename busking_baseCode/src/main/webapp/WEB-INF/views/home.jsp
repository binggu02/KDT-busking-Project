<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Busking Reservation - Main</title>
  <link rel="stylesheet" href="css/main.css" />
</head>
<body>

  <!-- 전체 래퍼 -->
  <div class="page">

    <!-- 헤더(로고 + 메뉴 + 로그인/가입) -->
    <header class="header">
      <div class="container header-inner">
        <a class="logo" href="images/logo.png">BUSKING</a>

        <nav class="nav">
          <a href="#">장비 예약</a>
          <a href="#">지역별 장소 예약</a>
          <a href="/boardmain">게시판</a>
        </nav>

        <div class="auth">
          <a href="/login">login</a>
          <a href="/join">join</a>
        </div>
      </div>
    </header>

    <!-- 히어로(배경이미지/문구 자리) -->
    <section class="hero">
      <div class="container hero-inner">
        <h1>나만의 버스킹 무대를 펼쳐보세요</h1>
        <p>여기는 메인 소개 문구 영역입니다. (나중에 문구/이미지 교체)</p>
        <div class="hero-actions">
          <a class="btn" href="#">바로 예약하기</a>
          <a class="btn" href="#">게시판 보기</a>
        </div>
      </div>
    </section>

    <!-- 메인 컨텐츠 -->
    <main class="main">
      <div class="container">

        <!-- 인기 장소 -->
        <section class="section">
          <div class="section-head">
            <h2>인기 장소</h2>
            <a class="more" href="#">더보기</a>
          </div>

          <div class="grid grid-3">
            <!-- 카드 3개(샘플) -->
            <article class="card place-card">
              <div class="thumb">이미지/썸네일</div>
              <div class="card-body">
                <h3 class="card-title">장소명</h3>
                <p class="card-desc">간단 설명/지역</p>
              </div>
            </article>

            <article class="card place-card">
              <div class="thumb">이미지/썸네일</div>
              <div class="card-body">
                <h3 class="card-title">장소명</h3>
                <p class="card-desc">간단 설명/지역</p>
              </div>
            </article>

            <article class="card place-card">
              <div class="thumb">이미지/썸네일</div>
              <div class="card-body">
                <h3 class="card-title">장소명</h3>
                <p class="card-desc">간단 설명/지역</p>
              </div>
            </article>
          </div>
        </section>

        <!-- 게시판 인기글 -->
        <section class="section">
          <div class="section-head">
            <h2>게시판 인기글</h2>
            <a class="more" href="#">더보기</a>
          </div>

          <ul class="list">
            <li class="list-item">
              <a href="#">인기글 제목 1 (샘플)</a>
              <span class="meta">2026-01-27</span>
            </li>
            <li class="list-item">
              <a href="#">인기글 제목 2 (샘플)</a>
              <span class="meta">2026-01-27</span>
            </li>
            <li class="list-item">
              <a href="#">인기글 제목 3 (샘플)</a>
              <span class="meta">2026-01-27</span>
            </li>
          </ul>
        </section>

      </div>
    </main>

    <!-- 푸터 -->
    <footer class="footer">
      <div class="container">
        <p>© Busking Reservation</p>
      </div>
    </footer>

  </div>

</body>
</html>