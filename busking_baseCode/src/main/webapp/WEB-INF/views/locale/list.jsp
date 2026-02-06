<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>${pageTitle}</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/common.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/main.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/locale/locale.css">
</head>
<body>
<header>
  <a href="${pageContext.request.contextPath}/">홈</a>
</header>

<main class="main">
  <h1>${pageTitle}</h1>

  <div class="region-list">

    <!-- ✅ DB에서 city 목록 출력 -->
  <c:forEach var="city" items="${cities}">
  <a class="region-card"
     href="${pageContext.request.contextPath}/locale/${city.cityCode}">
    ${city.cityName}
  </a>
</c:forEach>


    <!-- ✅ 혹시 cities가 비어있을 때 안내 -->
    <c:if test="${empty cities}">
      <p style="padding:16px;">등록된 지역이 없습니다.</p>
    </c:if>

  </div>
</main>
</body>
</html>
