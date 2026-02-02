<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>버스킹 회원가입</title>
</head>
<body>

<h2>회원가입</h2>

<form action="/register" method="POST">

    <!-- 아이디 -->
    <p>
        <label for="user_id">아이디</label><br>
        <input type="text" id="user_id" name="user_id" required placeholder="아이디를 입력하세요">
    </p>

    <!-- 비밀번호 -->
    <p>
        <label for="password">비밀번호</label><br>
        <input type="password" id="password" name="password" required>
    </p>

    <!-- 이름 -->
    <p>
        <label for="name">이름</label><br>
        <input type="text" id="name" name="name" required>
    </p>

    <!-- 닉네임 -->
    <p>
        <label for="nickname">닉네임</label><br>
        <input type="text" id="nickname" name="nickname" required>
    </p>

    <!-- 이메일 -->
    <p>
        <label for="useremail">이메일</label><br>
        <input type="email" id="useremail" name="useremail" placeholder="example@email.com">
    </p>

    <!-- 전화번호 -->
    <p>
        <label for="phone">전화번호</label><br>
        <input type="tel" id="phone" name="phone" placeholder="010-1234-5678">
    </p>

    <!-- 생년월일 -->
    <p>
        <label for="birth_date">생년월일</label><br>
        <input type="date" id="birth_date" name="birth_date">
    </p>

    <!-- 성별 -->
    <p>
        <label>성별</label><br>
        <input type="radio" name="gender" value="M" id="gender_m">
        <label for="gender_m">남</label>

        <input type="radio" name="gender" value="F" id="gender_f">
        <label for="gender_f">여</label>
    </p>

    <!-- 가입 버튼 -->
    <button type="submit">가입하기</button>

</form>

</body>
</html>