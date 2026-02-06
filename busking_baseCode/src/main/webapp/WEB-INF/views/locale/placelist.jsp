<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>${pageTitle}</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/common.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/locale/locale.css">
</head>
<body>
<header>
  <a href="${pageContext.request.contextPath}/">홈</a>
</header>

<main class="main">
  <h1>${pageTitle}</h1>

  <div class="place-list">
    <c:if test="${empty places}">
      <p style="padding:16px;">등록된 장소가 없습니다.</p>
    </c:if>

    <c:forEach var="place" items="${places}">
      <div class="place-card">

        <!-- ✅ thumbnail이 있으면 출력, 없으면 기본 이미지 -->
        <c:choose>
          <c:when test="${not empty place.thumbnail}">
            <img src="${pageContext.request.contextPath}${place.thumbnail}" alt="${place.name}">
          </c:when>
          <c:otherwise>
            <img src="${pageContext.request.contextPath}/images/no-image.png" alt="no image">
          </c:otherwise>
        </c:choose>

        <h3>${place.name}</h3>
        <p>${place.address}</p>
        <p>${place.phone}</p>

        <!-- ✅ 예약하기: placeId를 쿼리로 넘겨서 reserve 페이지로 -->
        <a class="btn-reserve"
           href="${pageContext.request.contextPath}/locale/reserve?placeId=${place.id}">
          예약하기
        </a>
      </div>
    </c:forEach>
  </div>
</main>
</body>
</html>
