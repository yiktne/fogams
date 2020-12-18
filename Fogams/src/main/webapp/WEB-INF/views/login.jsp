<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

 	h1, div {
		text-align: center;
	}
	
	.button {
		width: 200px;
		height: 30px;
		margin: 8px;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
<script type="text/javascript" src="resources/js/login.js"></script>
</head>
<body>

	<h1>Fogams</h1>
	
	<div>
		<h2>로그인</h2>
		아이디 <input type="text" id="id"/><br/><br/>
		비밀번호 <input type="password" id="pw"/><br/><br/>
		<input class="button" type="button" value="로그인" onclick="handleLogin()"/><br/>
		<input class="button" type="button" value="카카오ID를 이용하여 로그인" onclick="handleKakaoLogin()"/><br/>
		<input class="button" type="button" value="Facebook을 이용하여 로그인" onclick="handleFBLogin()"/><br/>
		<input class="button" type="button" value="회원가입" onclick="handleRegister()"/><br/>
		<a href="">아이디/비밀번호를 잃어버리셨나요?</a>
	</div>
</body>
</html>