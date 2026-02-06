<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>${pageTitle}</title>

<link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
<link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
<link rel="stylesheet" href="<c:url value='/css/locale/reserve.css'/>" />
</head>

<body>
	<header class="header">
		<div class="container header-inner">
			<a class="logo" href="<c:url value='/'/>"> <img
				src="<c:url value='/images/buskinglogo.png'/>"
				alt="BUSKING RESERVATION" class="logo-icon" />
			</a>

			<nav class="nav">
				<a href="<c:url value='/gear/list'/>">장비 예약</a> <a
					href="<c:url value='/locale/list'/>" class="is-active">지역별 장소
					예약</a> <a href="<c:url value='/board/list'/>">게시판</a>
			</nav>

			<div class="auth">
				<a class="pill" href="<c:url value='/mypage/main'/>">my page</a> <a
					class="pill" href="<c:url value='/member/logout'/>">logout</a>
			</div>
		</div>
	</header>

	<main class="main">
		<div class="container">

			<section class="reserve-layout">

				<!-- 왼쪽: 선택 장소 (✅ 서버에서 내려준 place 사용) -->
				<aside class="place-side">
					<button class="place-thumb" type="button" id="placeThumb"
						aria-label="지도 보기"
						style="<c:if test='${not empty place.thumbnail}'>background-image:url('${pageContext.request.contextPath}${place.thumbnail}');</c:if>">
						<span class="pin">📍</span>
					</button>

					<div class="place-info">
						<div class="place-name" id="placeName">${place.placeName}</div>
						<div class="place-addr" id="placeAddr">${place.placeAddress}</div>
						<div class="place-phone" id="placePhone">${place.placePhone}</div>
					</div>

				</aside>

				<!-- ✅ 오른쪽: 입력 폼 (POST로 서버 전송) -->
				<form class="form-box" id="reserveForm" method="post"
					action="<c:url value='/locale/reserve'/>">

					<!-- placeId는 hidden으로 전달 -->
					<input type="hidden" name="placeId" value="${place.id}" />

					<div class="form-left">
						<div class="line">
							<span class="label">예약자 명 :</span> <span class="value" id="uName">${userName != null ? userName : '홍길동'}</span>
						</div>

						<div class="line input">
							<label class="label" for="bandName">밴드명 :</label> <input
								id="bandName" name="bandName" class="inputbox" type="text"
								placeholder="밴드명을 입력하세요" />
						</div>

						<div class="line input">
							<label class="label" for="bandCount">밴드 인원 :</label> <input
								id="bandCount" name="bandCount" class="inputbox" type="number"
								min="1" placeholder="예: 4" />
						</div>

						<div class="line input">
							<label class="label" for="phone">전화번호 :</label> <input id="phone"
								name="phone" class="inputbox" type="text" value="02-0000-0000" />
						</div>

						<div class="line input">
							<label class="label" for="email">e-mail :</label> <input
								id="email" name="email" class="inputbox" type="email"
								value="user@example.com" />
						</div>
					</div>

					<div class="form-right">
						<div class="right-block">
							<label class="rlabel" for="datePick">날짜 선택:</label> <input
								id="datePick" name="reservationDate" class="rinput" type="date" />
						</div>

						<div class="right-block">
							<label class="rlabel" for="timePick">시간 선택:</label> <input
								id="timePick" name="startTime" class="rinput" type="time" />
						</div>
					</div>

				</form>
			</section>

			<!-- 예약하기 버튼 -->
			<div class="actions">
				<button class="reserve-submit" id="reserveBtn" type="button">예약하기</button>
			</div>

		</div>
	</main>

	<footer class="footer">
		<div class="container">
			<p>© Busking Reservation</p>
		</div>
	</footer>

	<!-- 지도 모달 -->
	<div class="map-modal" id="mapModal" aria-hidden="true">
		<div class="map-dim" data-close="1"></div>
		<div class="map-box" role="dialog" aria-modal="true"
			aria-labelledby="mapTitle">
			<div class="map-head">
				<div class="map-title" id="mapTitle">지도</div>
				<button class="map-close" type="button" data-close="1">✕</button>
			</div>
			<div class="map-sub" id="mapSubAddr">-</div>
			<iframe id="mapFrame" class="map-frame" loading="lazy"
				referrerpolicy="no-referrer-when-downgrade" src=""></iframe>
		</div>
	</div>

	<script>
  const URL_LOCALE_LIST = "<c:url value='/locale/list'/>";
  const form = document.getElementById("reserveForm");

  // 지도 모달
  const modal = document.getElementById("mapModal");
  const mapFrame = document.getElementById("mapFrame");
  const mapTitle = document.getElementById("mapTitle");
  const mapSubAddr = document.getElementById("mapSubAddr");

  function openMap(title, address){
    mapTitle.textContent = title;
    mapSubAddr.textContent = address;
    const q = encodeURIComponent(address);
    mapFrame.src = `https://www.google.com/maps?q=${q}&output=embed`;
    modal.classList.add("show");
    modal.setAttribute("aria-hidden", "false");
    document.body.style.overflow = "hidden";
  }

  function closeMap(){
    modal.classList.remove("show");
    modal.setAttribute("aria-hidden", "true");
    mapFrame.src = "";
    document.body.style.overflow = "";
  }

  document.getElementById("placeThumb").addEventListener("click", () => {
    const title = document.getElementById("placeName").textContent;
    const addr  = document.getElementById("placeAddr").textContent;
    openMap(title, addr);
  });

  modal.addEventListener("click", (e) => {
    if (e.target.dataset.close === "1") closeMap();
  });

  window.addEventListener("keydown", (e) => {
    if (e.key === "Escape" && modal.classList.contains("show")) closeMap();
  });

  // 예약 버튼 -> 유효성 검사 + confirm 후 form submit
  document.getElementById("reserveBtn").addEventListener("click", () => {
    const placeName = document.getElementById("placeName").textContent;
    const bandName  = document.getElementById("bandName").value.trim();
    const bandCount = document.getElementById("bandCount").value.trim();
    const datePick  = document.getElementById("datePick").value;
    const timePick  = document.getElementById("timePick").value;

    if (!placeName) { alert("선택한 장소가 없습니다."); location.href = URL_LOCALE_LIST; return; }
    if (!bandName) { alert("밴드명을 입력해주세요."); return; }
    if (!bandCount || Number(bandCount) < 1) { alert("밴드 인원을 올바르게 입력해주세요."); return; }
    if (!datePick) { alert("날짜를 선택해주세요."); return; }
    if (!timePick) { alert("시간을 선택해주세요."); return; }

    const ok = confirm(
      `[예약 확인]\n` +
      `장소: ${placeName}\n` +
      `날짜/시간: ${datePick} ${timePick}\n` +
      `밴드: ${bandName} (${bandCount}명)\n\n` +
      `예약하시겠습니까?`
    );
    if (!ok) return;

    form.submit();
  });
</script>
</body>
</html>
