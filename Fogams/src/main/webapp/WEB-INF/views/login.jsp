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
<script type="text/javascript">

function handleLogin() {
	$.ajax({
		contentType:"application/json",
		url:encodeURI("login.do"),
		data:JSON.stringify({member_id:$("#id").val(),
			member_pw:$("#pw").val()}),
		dataType:"json",
		method:"POST",
		success:function(res) {
			if(res.result) {
				location.href = "./";
			} else {
				alert("로그인에 실패하였습니다. 아이디와 비밀번호를 다시 확인해주세요.");
			}
		},
		error:function(res, status, err) {
			console.log(res);
			console.log(err);
		},
	});
}

function handleRegister() {
	location.href = "registerform.do";
}

</script>
</head>
<body>

	<h1>Fogams</h1>
	
	<div>
		<h2>로그인</h2>
		아이디 <input type="text" id="id"/><br/><br/>
		비밀번호 <input type="password" id="pw"/><br/><br/>
		<input class="button" type="button" value="로그인" onclick="handleLogin()"/><br/>
		<input class="button" type="button" value="카카오ID를 이용하여 로그인"/><br/>
		<input class="button" type="button" value="Facebook을 이용하여 로그인"/><br/>
		<input class="button" type="button" value="회원가입" onclick="handleRegister()"/><br/>
		<a href="">아이디/비밀번호를 잃어버리셨나요?</a>
	</div>
</body>
</html>