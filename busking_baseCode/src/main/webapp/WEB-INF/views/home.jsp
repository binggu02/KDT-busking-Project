<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>Busking Reservation - Main</title>

<!-- CSS -->
<link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
<link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
</head>
<body>

   <div class="page">

      <!-- ================= HEADER ================= -->
      <header class="header">
         <div class="container header-inner">

            <a class="logo" href="<c:url value='/'/>"> <img
               src="<c:url value='/images/buskinglogo.png'/>" class="logo-icon" />
               <div class="logo-text">
                  <strong>BUSKING</strong><br />RESERVATION
               </div>
            </a>

            <nav class="nav">
               <a href="/gear/list">장비 예약</a> <a href="/locale/list">지역별
                  장소 예약</a> <a href="/board/main.jsp">게시판</a>
            </nav>

            <div class="auth">

               <!-- 로그인 안 한 상태 -->
               <c:if test="${empty loginUser}">
                  <a href="<c:url value='/member/login'/>">login</a>
                  <a href="<c:url value='/member/register'/>">register</a>
               </c:if>

               <!-- 로그인 한 상태 -->
               <c:if test="${not empty loginUser}">
                  <a href="<c:url value='/mypage'/>"> ${loginUser.memberId} </a>
                  <a href="<c:url value='/member/logout'/>">logout</a>


                  </a>
               </c:if>

            </div>

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
                  <a class="more" href="./locale/list.jsp">더보기</a>
               </div>

               <div class="grid grid-3">
                  <article class="card place-card">
                     <div class="thumb">
                        <img src="/images/Hongdae.png" alt="인기 장소 1">
                     </div>

                     <div class="card-body">
                        <h3>홍대 걷고싶은거리</h3>
                        <p>서울 마포구</p>
                     </div>
                  </article>

                  <article class="card place-card">
                     <div class="thumb">
                        <img src="/images/Han River.png" alt="인기 장소 2">
                     </div>
                     <div class="card-body">
                        <h3>한강 반포공원</h3>
                        <p>서울 서초구</p>
                     </div>
                  </article>

                  <article class="card place-card">
                     <div class="thumb">
                        <img src="/images/Gwanganri.png" alt="인기 장소 3">
                     </div>
                     <div class="card-body">
                        <h3>광안리 해변</h3>
                        <p>부산 수영구</p>
                     </div>
                  </article>
               </div>
            </section>

            <!-- ✅ 게시판 인기글 (임시 데이터) -->
            <section class="section">
               <div class="section-head">
                  <h2>게시판 인기글</h2>
                  <a class="more" href="#">더보기</a>
               </div>

               <ul class="list">
                  <li class="list-item"><a href="#">[공지] 2월 대관 신청 오픈 안내</a> <span
                     class="meta">2026-01-27</span></li>
                  <li class="list-item"><a href="#">홍대 버스킹 스피커 추천 / 세팅 팁</a> <span
                     class="meta">2026-01-26</span></li>
                  <li class="list-item"><a href="#">야외 공연 시 전원(배터리) 구성 어떻게
                        해요?</a> <span class="meta">2026-01-25</span></li>
                  <li class="list-item"><a href="#">[후기] 반포에서 버스킹했는데 반응
                        미쳤다…</a> <span class="meta">2026-01-24</span></li>
                  <li class="list-item"><a href="#">처음 버스킹하는데 곡 구성 조언
                        부탁드립니다!</a> <span class="meta">2026-01-23</span></li>
               </ul>
            </section>

         </div>
      </main>

      <!-- ================= FOOTER ================= -->
      <footer class="footer">
         <p>© Busking Reservation</p>
      </footer>

   </div>

</body>
</html>
