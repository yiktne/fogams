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
<script type="text/javascript">

function handleRegister() {
	location.href = "registerform.do";
}

</script>
</head>
<body>

	<h1>Fogams</h1>
	
	<div>
		<h2>로그인</h2>
		아이디 <input type="text" /><br/><br/>
		비밀번호 <input type="password"/><br/><br/>
		<input class="button" type="button" value="로그인"/><br/>
		<input class="button" type="button" value="카카오ID를 이용하여 로그인"/><br/>
		<input class="button" type="button" value="Facebook을 이용하여 로그인"/><br/>
		<input class="button" type="button" value="회원가입" onclick="handleRegister()"/><br/>
		<a href="">아이디/비밀번호를 잃어버리셨나요?</a>
	</div>
</body>
</html>