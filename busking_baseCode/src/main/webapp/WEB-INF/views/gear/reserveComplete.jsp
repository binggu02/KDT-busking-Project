<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>예약 완료</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/common.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/main.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/gear/gearreserveComplete.css" />
</head>
<body>

<header class="header">
  <div class="container header-inner">
    <a class="logo" href="${pageContext.request.contextPath}/">
      <img src="${pageContext.request.contextPath}/buskinglogo.png" class="logo-icon" />
    </a>
  </div>
</header>

<main class="main complete-main">
  <div class="container">
    <div class="complete-box">
      <h2>🎉 예약이 완료되었습니다!</h2>

      <div class="complete-actions">
        <button onclick="location.href='${pageContext.request.contextPath}/gear/list'">
          장비 더 보기
        </button>

        <button onclick="location.href='${pageContext.request.contextPath}/mypage'">
          마이페이지
        </button>
      </div>
    </div>
  </div>
</main>

</body>
</html>
