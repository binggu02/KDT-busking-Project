<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인 화면</title>
    <link rel="stylesheet" href="<c:url value='/css/login.css'/>">
</head>

<body class="login-page">
  <div class="login-bg"></div>

  <!-- ✅ 상단 표지(토스트): 기본 숨김 -->
  <div id="toast" class="toast" role="alert" aria-live="assertive"></div>

  <div class="login-wrap">
    <div class="login-brand">
      <a href="../home.html" aria-label="메인페이지로 이동">
    <img src="../buskinglogo.png" alt="BUSKING RESERVATION" />
  </a>
    </div>
    


    <div class="login-card">
      <!-- ✅ form에 id 부여 (JS에서 submit 제어) -->
      <form id="loginForm" method="post" action="#">
        <label class="login-label" for="userId">ID</label>
        <input
          id="userId"
          class="login-input"
          type="text"
          name="userName"
          placeholder="아이디를 입력하세요"
          required
        />

        <label class="login-label" for="userPw">Password</label>
        <input
          id="userPw"
          class="login-input"
          type="password"
          name="userPassword"
          placeholder="비밀번호를 입력하세요"
          required
        />

        <button class="login-btn" type="submit">Sign In</button>

        <div class="login-links">
          <a class="find-link" href="./idfind.html">ID</a>
          <span class="slash">/</span>
          <a class="find-link" href="./pwfind.html">PW</a>
          <span class="find-text">찾기</span>

          <span class="divider"></span>
          <a href="./join.html">회원가입</a>
        </div>

      </form>
    </div>
  </div>

  <!-- ✅ 고정 ID/비번 로그인 처리 + 실패 시 상단 표지 -->
  <script>
    // 🔒 고정 계정(원하는 값으로 변경 가능)
    const FIXED_ID = "test";
    const FIXED_PW = "1234";

    const form = document.getElementById("loginForm");
    const toast = document.getElementById("toast");

    function showToast(message){
      toast.textContent = message;
      toast.classList.add("show");

      clearTimeout(window.__toastTimer);
      window.__toastTimer = setTimeout(() => {
        toast.classList.remove("show");
      }, 2000);
    }

    form.addEventListener("submit", (e) => {
      e.preventDefault();

      const id = document.getElementById("userId").value.trim();
      const pw = document.getElementById("userPw").value.trim();

      if (id !== FIXED_ID) {
        showToast("아이디가 틀렸습니다.");
        return;
      }

      if (pw !== FIXED_PW) {
        showToast("비밀번호가 틀렸습니다.");
        return;
      }

      // ✅ 로그인 성공 → 메인 페이지로 이동 (경로 맞게 필요하면 수정)
      location.href = "../loginhome.html";
    });
  </script>
</body>
</html>
