<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>장비 예약</title>

  <link rel="stylesheet" href="../common.css" />
  <link rel="stylesheet" href="../main.css" />
  <link rel="stylesheet" href="./gear.css" />
</head>

<body>
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
    </div>
  </header>

  <main class="main">
    <div class="container">
      <section class="gear-grid">

        <!-- ✅ 중요: href를 "예약페이지 파일명"과 100% 동일하게 -->
        <a class="gear-link gear-card" href="./gearreserve.html"
           data-name="기타" data-price="0" data-desc="Body text." data-img="../01.jpg">
          <div class="thumb" style="background-image:url('../01.jpg')" aria-label="기타 이미지"></div>
          <div class="card-body">
            <div class="card-title">기타</div>
            <div class="card-price">$0</div>
            <div class="card-desc">Body text.</div>
          </div>
        </a>

        <a class="gear-link gear-card" href="./gearreserve.html"
           data-name="피아노" data-price="0" data-desc="Body text." data-img="../02.jpg">
          <div class="thumb" style="background-image:url('../02.jpg')" aria-label="피아노 이미지"></div>
          <div class="card-body">
            <div class="card-title">피아노</div>
            <div class="card-price">$0</div>
            <div class="card-desc">Body text.</div>
          </div>
        </a>

        <a class="gear-link gear-card" href="./gearreserve.html"
           data-name="일렉 기타" data-price="0" data-desc="Body text." data-img="../03.jpg">
          <div class="thumb" style="background-image:url('../03.jpg')" aria-label="일렉 기타 이미지"></div>
          <div class="card-body">
            <div class="card-title">일렉 기타</div>
            <div class="card-price">$0</div>
            <div class="card-desc">Body text.</div>
          </div>
        </a>

        <a class="gear-link gear-card" href="./gearreserve.html"
           data-name="전자 드럼" data-price="0" data-desc="Body text." data-img="../01.jpg">
          <div class="thumb" style="background-image:url('../01.jpg')" aria-label="전자 드럼 이미지"></div>
          <div class="card-body">
            <div class="card-title">전자 드럼</div>
            <div class="card-price">$0</div>
            <div class="card-desc">Body text.</div>
          </div>
        </a>

        <a class="gear-link gear-card" href="./gearreserve.html"
           data-name="베이스" data-price="0" data-desc="Body text." data-img="../02.jpg">
          <div class="thumb" style="background-image:url('../02.jpg')" aria-label="베이스 이미지"></div>
          <div class="card-body">
            <div class="card-title">베이스</div>
            <div class="card-price">$0</div>
            <div class="card-desc">Body text.</div>
          </div>
        </a>

        <a class="gear-link gear-card" href="./gearreserve.html"
           data-name="통기타" data-price="0" data-desc="Body text." data-img="../03.jpg">
          <div class="thumb" style="background-image:url('../03.jpg')" aria-label="통기타 이미지"></div>
          <div class="card-body">
            <div class="card-title">통기타</div>
            <div class="card-price">$0</div>
            <div class="card-desc">Body text.</div>
          </div>
        </a>

        <a class="gear-link gear-card" href="./gearreserve.html"
           data-name="마이크" data-price="0" data-desc="Body text." data-img="../01.jpg">
          <div class="thumb" style="background-image:url('../01.jpg')" aria-label="마이크 이미지"></div>
          <div class="card-body">
            <div class="card-title">마이크</div>
            <div class="card-price">$0</div>
            <div class="card-desc">Body text.</div>
          </div>
        </a>

        <a class="gear-link gear-card" href="./gearreserve.html"
           data-name="스피커" data-price="0" data-desc="Body text." data-img="../02.jpg">
          <div class="thumb" style="background-image:url('../02.jpg')" aria-label="스피커 이미지"></div>
          <div class="card-body">
            <div class="card-title">스피커</div>
            <div class="card-price">$0</div>
            <div class="card-desc">Body text.</div>
          </div>
        </a>

      </section>
    </div>
  </main>

  <footer class="footer">
    <div class="container">
      <p>© Busking Reservation</p>
    </div>
  </footer>

  <script>
    document.querySelectorAll(".gear-link").forEach((link) => {
      link.addEventListener("click", (e) => {
        // ✅ 혹시 다른 코드가 클릭 막는지 체크용
        // console.log("clicked", link.dataset.name);

        e.preventDefault();

        const item = {
          name: link.dataset.name,
          price: link.dataset.price,
          desc: link.dataset.desc,
          img: link.dataset.img
        };

        sessionStorage.setItem("selectedGear", JSON.stringify(item));

        // ✅ 이동
        window.location.href = link.getAttribute("href");
      });
    });
  </script>
</body>
</html>
