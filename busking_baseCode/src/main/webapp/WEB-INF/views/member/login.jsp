<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>로그인</title>

  <!-- (선택) 공통 css: member 폴더라서 ../ 필요 -->
  <link rel="stylesheet" href="../common.css" />
  <link rel="stylesheet" href="../main.css" />

  <style>
    /* ====== 로그인 페이지 단일 파일 CSS ====== */

    /* 페이지 기본 */
    body.login-page {
      margin: 0;
      min-height: 100vh;
      font-family: "맑은 고딕", sans-serif;
    }

    /* 배경 (buskinglogin.png) + 어두운 오버레이 */
    .login-bg {
      position: fixed;
      inset: 0;
      background: url("../buskinglogin.png") center / cover no-repeat;
      z-index: 0;
    }
    .login-bg::after {
      content: "";
      position: absolute;
      inset: 0;
      background: rgba(0, 0, 0, 0.45);
    }

    /* 가운데 정렬 컨테이너 */
    .login-wrap {
      position: relative;
      z-index: 1;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      padding: 40px 16px;
      gap: 8px;
    }

    /* 상단 로고 */
    .login-brand img {
      width: 400px;   /* 필요하면 220~320 조절 */
      height: auto;
      display: block;
      filter: drop-shadow(0 10px 18px rgba(0,0,0,0.35));
    }

    /* 카드 */
    .login-card {
      width: 420px;
      max-width: 92vw;
      background: rgba(255, 255, 255, 0.92);
      border-radius: 16px;
      padding: 26px 28px 22px;
      box-shadow: 0 20px 60px rgba(0,0,0,0.35);
    }

    /* 라벨/인풋 */
    .login-label {
      display: block;
      font-size: 12px;
      color: #333;
      margin: 12px 0 6px;
    }

    .login-input {
      width: 100%;
      height: 38px;
      border: 1px solid #d6d6d6;
      border-radius: 8px;
      padding: 0 12px;
      outline: none;
      background: #fff;
    }
    .login-input:focus {
      border-color: #888;
    }

    /* 버튼 */
    .login-btn {
      width: 100%;
      height: 40px;
      margin-top: 14px;
      border: none;
      border-radius: 8px;
      background: #222;
      color: #fff;
      cursor: pointer;
      font-weight: 600;
    }
    .login-btn:hover {
      background: #111;
    }

    /* =========================
       ID / PW 찾기 / 회원가입 링크
    ========================= */
    .login-links {
      margin-top: 14px;
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 6px;
      font-size: 12px;
      color: #666;
    }

    .find-link {
      color: #666;
      text-decoration: none;
      font-weight: 600;
    }

    .find-link:hover {
      text-decoration: underline;
    }

    .slash {
      color: #999;
      margin: 0 2px;
    }

    .find-text {
      color: #666;
      margin-left: 2px;
    }

    .divider {
      width: 1px;
      height: 10px;
      background: #cfcfcf;
      display: inline-block;
      margin: 0 10px;
    }

    .login-links a {
      color: #666;
      text-decoration: none;
    }
    .login-links a:hover {
      text-decoration: underline;
    }

    /* =========================
       ✅ 상단 표지(토스트) 추가
    ========================= */
    .toast{
      position: fixed;
      top: 16px;
      left: 50%;
      transform: translateX(-50%);
      z-index: 9999;

      min-width: 280px;
      max-width: 92vw;
      padding: 12px 16px;
      border-radius: 10px;

      background: rgba(255, 70, 70, 0.95);
      color: #fff;
      font-size: 13px;
      font-weight: 700;
      text-align: center;

      box-shadow: 0 12px 30px rgba(0,0,0,0.35);
      display: none;
    }
    .toast.show{
      display: block;
    }
  </style>
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
