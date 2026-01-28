<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인 화면</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="login-wrapper">
        <h2>Login</h2>
        <form method="post" action="#">
            <input type="text" name="userName" placeholder="아이디"><br>
            <input type="password" name="userPassword" placeholder="비밀번호"><br>
            <button type="submit">로그인</button>
        </form>
    </div>
</body>
</html>
