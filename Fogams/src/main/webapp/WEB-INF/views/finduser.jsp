<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

 	/* body {
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
	} */
	
	
	
	
	
</style>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/finduser.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
// id
var emailValid = false;

var certString = "";

$("#email").on("change", function() {
	emailValid = false;
});


$("#email_2").on("change", function() {
	emailValid = false;
});

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

function handleSendCert2() {
	if(checkEmail2()) {
		$.ajax({
			contentType:"application/json",
			url:encodeURI("sendCert.do"),
			data:JSON.stringify({mail:$("#email_2").val()}),
			dataType:"json",
			method:"POST",
			success:function(res) {
				certString = res.cert;
				alert($("#email_2").val() + "으로 인증번호를 보냈습니다.");
				$("#cert_2").val(certString);
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

function handleCheckCert2() {
	if($("#cert_2").val() === certString) {
		alert("이메일 인증이 완료되었습니다.");
		emailValid = true;
	} else {
		alert("인증번호가 다릅니다. 다시 한 번 확인해주세요.")
	}
}

function findID() {
	if(emailValid) {
		$.ajax({
			contentType:"application/json",
			url:encodeURI("findUserID.do?name=" + $("#name").val() + "&email=" + $("#email").val()),
			dataType:"json",
			success:function(res) {
				if(res.id !== undefined) {
					alert($("#name").val() + "님의 아이디는 " + res.id + "입니다.");
				} else {
					alert("이름 또는 이메일이 맞지 않습니다. 다시 한 번 확인해주세요.");
				}
			},
			error:function(res, status, err) {
				console.log(res);
				console.log(err);
			},
		});
	} else {
		alert("이메일 인증을 받아주세요.");
	}
}

function checkEmail() {
	var email = $("#email").val();

	const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	return re.test(email);
}

function checkEmail2() {
	var email = $("#email_2").val();

	const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	return re.test(email);
}

// pw찾기
var idValid = false;
var idValid2 = false;
var emailValid = false;

var certString = "";

$(function() {
	$("#id_2").on("change", function() {
		
		if(checkId($("#id_2").val())) {
			idValid2 = true;
		} else {
			idValid2 = false;
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
	if(idValid2 & emailValid) {
		$.ajax({
			contentType:"application/json",
			url:encodeURI("findUser.do?id=" + $("#id_2").val() + "&name=" + $("#name_2").val() + "&email=" + $("#email_2").val()),
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
		if(!idValid2) {
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


	<!-- <h1>Fogams</h1>
	<table border="1">
		<tr>
			<td>아이디 찾기</td>
			<td><a href="findpwauth.do">비밀번호 재설정</a></td>
		</tr>
		<tr>
			<td colspan="2">
				<table>
					<tr>
						<td>이름</td>
						<td><input type="text" id="name"/></td>
						<td></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="email" id="email"/></td>
						<td><input type="button" value="인증번호 생성" onclick="handleSendCert()"/></td>
					</tr>
					<tr>
						<td>인증번호</td>
						<td><input type="text" id="cert"/></td>
						<td><input type="button" value="인증하기" onclick="handleCheckCert()"/></td>
					</tr>
					<tr>
						<td colspan="3"><input id="find" type="button" value="아이디 찾기" onclick="findID()"/></td>
					</tr>
				</table>
			</td>
		</tr>
	</table> -->
	
	
	<div class="login-reg-panel">
		<div class="login-info-box">
			<h2>Have an account?</h2>
			<p>Lorem ipsum dolor sit amet</p>
			<label id="label-register" for="log-reg-show">ID</label>
			<input type="radio" name="active-log-panel" id="log-reg-show"  checked="checked">
		</div>
							
		<div class="register-info-box">
			<h2>Don't have an account?</h2>
			<p>Lorem ipsum dolor sit amet</p>
			<label id="label-login" for="log-login-show">Password</label>
			<input type="radio" name="active-log-panel" id="log-login-show">
		</div>
						
						
						
						
							
		<div class="white-panel">
			<div class="login-show">
				<h2>ID</h2>
				<input type="text" id="name" placeholder="Name">
				<input type="button" value="인증번호 생성" onclick="handleSendCert()"/>
				<input type="email" id="email" placeholder="Email"/>
				<input type="button" value="인증하기" onclick="handleCheckCert()"/>
				<input type="text" id="cert"/>
				<input type="button" value="아이디 찾기" id="find" style="float: left;" onclick="findID()" >
			</div>
			
			
			
			<form action="resetpwform.do" method="post" id="form">
			<div class="register-show">
				<h2>Password</h2>
				<input id="id_2" name="id" type="text" placeholder="ID"/>
				<input id="name_2" type="text" placeholder="Name"/>
				<input type="button" value="인증번호 생성" onclick="handleSendCert2()"/>
				<input type="email" id="email_2" placeholder="Email"/>
				<input type="button" value="인증하기" onclick="handleCheckCert2()"/>
				<input type="text" id="cert_2"/>
				<input type="button" value="비밀번호 재설정" id="find" onclick="handleResetPW()" style="float: left;" >
			</div>
			</form>
			
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	<script type="text/javascript">

    $(document).ready(function(){
    $('.login-info-box').fadeOut();
    $('.login-show').addClass('show-log-panel');
});


$('.login-reg-panel input[type="radio"]').on('change', function() {
    if($('#log-login-show').is(':checked')) {
        $('.register-info-box').fadeOut(); 
        $('.login-info-box').fadeIn();
        
        $('.white-panel').addClass('right-log');
        $('.register-show').addClass('show-log-panel');
        $('.login-show').removeClass('show-log-panel');
        
    }
    else if($('#log-reg-show').is(':checked')) {
        $('.register-info-box').fadeIn();
        $('.login-info-box').fadeOut();
        
        $('.white-panel').removeClass('right-log');
        
        $('.login-show').addClass('show-log-panel');
        $('.register-show').removeClass('show-log-panel');
    }
});
  
	</script>
	
	
	
</body>
</html>