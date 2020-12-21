<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

 	body {
		text-align: center;
	}
	
	table {
		margin: auto;
	}
	
	td {
		padding:10px;
	}
	
	#find {
		width: 200px;
		height: 30px;
		margin: 8px;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

var idValid = false;
var emailValid = false;

var certString = "";

$(function() {
	$("#id").on("change", function() {
		
		if(checkId($("#id").val())) {
			idValid = true;
		} else {
			idValid = false;
		}
	});

	$("#email").on("change", function() {
		emailValid = false;
	});
})

function handleSendCert() {
	if(checkEmail()) {
		$.ajax({
			contentType:"application/json",
			url:encodeURI("sendCert.do"),
			data:JSON.stringify({mail:$("#email").val()}),
			dataType:"json",
			method:"POST",
			success:function(res) {
				certString = res.cert;
				alert($("#email").val() + "으로 인증번호를 보냈습니다.");
				$("#cert").val(certString);
			},
			error:function(res, status, err) {
				console.log(res);
				console.log(err);
			},
		});
	} else {
		alert("이메일 형식이 맞지 않습니다. 다시 확인해주세요.");
	}
}

function handleCheckCert() {
	if($("#cert").val() === certString) {
		alert("이메일 인증이 완료되었습니다.");
		emailValid = true;
	} else {
		alert("인증번호가 다릅니다. 다시 한 번 확인해주세요.")
	}
}

function handleResetPW() {
	if(idValid & emailValid) {
		$.ajax({
			contentType:"application/json",
			url:encodeURI("findUser.do?id=" + $("#id").val() + "&name=" + $("#name").val() + "&email=" + $("#email").val()),
			success:function(res) {
				if(res.result) {
					$("#form").submit();
				} else {
					alert("입력하신 정보가 정확하지 않습니다. 다시 한 번 확인해주세요.")
				}
			},
			error:function(res, status, err) {
				console.log(res);
				console.log(err);
			},
		});
	} else {
		if(!idValid) {
			alert("아이디 형식을 확인해주세요.");
		} else {
			alert("이메일 인증을 받아주세요.");
		}
	}
}

function checkId() {
	var id = $("#id").val();
	var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
	
	return idReg.test(id);
}

function checkEmail() {
	var email = $("#email").val();

	const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	return re.test(email);
}
</script>
</head>
<body>

	<h1>Fogams</h1>
	
	<form action="resetpwform.do" method="post" id="form">
		<table border="1">
			<tr>
				<td><a href="finduserform.do">아이디 찾기</a></td>
				<td>비밀번호 재설정</td>
			</tr>
			<tr>
				<td colspan="2">
					<table>
						<tr>
							<td>아이디</td>
							<td><input id="id" name="id" type="text"/></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input id="name" type="text"/></td>
							<td></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input id="email" type="email"/></td>
							<td><input type="button" value="인증번호 생성" onclick="handleSendCert()"/></td>
						</tr>
						<tr>
							<td>인증번호</td>
							<td><input id="cert" type="text"/></td>
							<td><input type="button" value="인증하기" onclick="handleCheckCert()"/></td>
						</tr>
						<tr>
							<td colspan="3"><input id="find" type="button" value="비밀번호 재설정" onclick="handleResetPW()"/></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>