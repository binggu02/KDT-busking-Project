<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>아이디 / 비밀번호 찾기</title>
</head>
<body>

<!-- ================= 아이디 찾기 ================= -->
<h1>아이디 찾기</h1>

<form action="<c:url value='/member/find-id'/>" method="post">
    <table>
        <tr>
            <td>이름</td>
            <td><input type="text" name="name" required></td>
        </tr>
        <tr>
            <td>전화번호</td>
            <td><input type="text" name="phone" required></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td><input type="email" name="email" required></td>
        </tr>
    </table>

    <button type="submit">아이디 찾기</button>
</form>

<hr>

<!-- ================= 비밀번호 찾기 ================= -->
<h1>비밀번호 찾기</h1>

<form action="<c:url value='/member/find-pw'/>" method="post">
    <table>
        <tr>
            <td>이름</td>
            <td><input type="text" name="name" required></td>
        </tr>
        <tr>
            <td>ID</td>
            <td><input type="text" name="memberId" required></td>
        </tr>
        <tr>
            <td>전화번호</td>
            <td><input type="text" name="phone" required></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td><input type="email" name="email" required></td>
        </tr>
    </table>

    <button type="submit">비밀번호 찾기</button>
</form>

</body>
</html>
