<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<style type="text/css">

 	div {
		text-align: center;
		
		margin: 12px;
	}
	
	h1 {
		font-size: 60px;
	}
	
	input {
		margin: 4px;
	}

	table {
		margin: auto;
		padding: 5px;
		background-color: silver;
		border-radius: 10px;
		border-color: sliver;
	}
	
	#idInvalid, #pwInvalid {
		color:red;
	}
	
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="resources/js/register.js"></script>
</head>
<body>

	<div>
	<h1>Fogams</h1>
	
		<table border="1">
			<tr>
				<td colspan="3" rowspan="2">
					<h2>회원가입</h2>
				</td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="register_id"/></td>
				<td><input type="button" value="중복 체크" id="checkId"/></td>
			</tr>
			<tr>
				<td colspan="3" id="idInvalid">
					아이디는 영어 소문자로 시작하며,<br/>소문자, 숫자로만 이루어진 6~20자만 가능합니다.
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="pw1"/></td>
				<td></td>
			</tr>
			<tr>
				<td>비밀번호 재확인</td>
				<td><input type="password" id="pw2"/></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3" id="pwInvalid">
					비밀번호가 일치하지 않습니다.
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="name"/></td>
				<td> </td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" id="email"/></td>
				<td><input type="button" value="인증번호 전송" id="sendEmail"/></td>
			</tr>
			<tr id="emailInfo">
				<td colspan="3">
					이메일로 받은 6자리 인증번호를 입력해주세요.
				</td>
			</tr>
			<tr id="emailCheck">
				<td>인증번호</td>
				<td><input type="text" id="cert"/></td>
				<td><input type="button" value="인증번호 확인" id="checkCert"/></td>
			</tr>
			<tr>
				<td colspan="3" rowspan="2">
					<input type="button" value="회원가입" id="register"/>
				</td>
			</tr>
			<tr>
			</tr>
		</table>
	</div>
	

	
	
	
</body>
</html>