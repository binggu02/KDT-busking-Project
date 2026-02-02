<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인 화면</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body>

<div class="login-wrapper">
    <h2>Login</h2>

    <!-- ⭐ 여기서 컨트롤러로 보냄 -->
    <form method="post" action="<c:url value='/member/login'/>">
        <input type="text" name="memberId" placeholder="아이디"><br>
        <input type="password" name="pw" placeholder="비밀번호"><br>
        <button type="submit">로그인</button>
    </form>
</div>

</body>
</html>
