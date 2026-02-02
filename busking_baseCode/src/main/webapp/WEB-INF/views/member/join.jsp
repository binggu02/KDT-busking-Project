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

<form action="<c:url value='/member/register'/>" method="post">

    <!-- 아이디 -->
    <p>
        <label>아이디</label><br>
        <input type="text" name="memberId" required>
    </p>

    <!-- 비밀번호 -->
    <p>
        <label>비밀번호</label><br>
        <input type="password" name="pw" required>
    </p>

    <!-- 이름 -->
    <p>
        <label>이름</label><br>
        <input type="text" name="name" required>
    </p>

    <!-- 닉네임 -->
    <p>
        <label>닉네임</label><br>
        <input type="text" name="nickname">
    </p>

    <!-- 이메일 -->
    <p>
        <label>이메일</label><br>
        <input type="email" name="email">
    </p>

    <!-- 전화번호 -->
    <p>
        <label>전화번호</label><br>
        <input type="tel" name="phone">
    </p>

    <!-- 생년월일 -->
    <p>
        <label>생년월일</label><br>
        <input type="date" name="birthDate">
    </p>

    <!-- 성별 -->
    <p>
        <label>성별</label><br>
        <input type="radio" name="gender" value="M"> 남
        <input type="radio" name="gender" value="F"> 여
    </p>

    <button type="submit">가입하기</button>

</form>

</body>
</html>
