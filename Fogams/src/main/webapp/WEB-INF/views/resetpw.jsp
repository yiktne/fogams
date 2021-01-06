<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/css/resetpw.css"/>

<!-- <style type="text/css">

 	body {
		text-align: center;
	}
	
	table {
		margin: auto;
		background-color: silver;
	}
	
	td {
		padding:10px;
	}
	
	#change {
		width: 200px;
		height: 30px;
		margin: 8px;
	}
</style> -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

function updatePassword() {
	if($("#pw1").val().length >= 8) {
		if($("#pw1").val() === $("#pw2").val()) {
			$.ajax({
				contentType:"application/json",
				url:encodeURI("updatePassword.do"),
				data:JSON.stringify({id:'${id}', password:$("#pw1").val()}),
				dataType:"json",
				method:"POST",
				success:function(res) {
					if(res.result) {
						alert("비밀번호를 변경하였습니다.")
						location.href = "loginform.do";
					} else {
						alert("비밀번호 변경에 실패했습니다. 다시 시도해주세요.")
					}
				},
				error:function(res, status, err) {
					console.log(res);
					console.log(err);
				},
			});
		} else {
			alert("비밀번호 확인이 맞지 않습니다. 다시 한 번 입력해주세요.")
		}
	} else {
		alert("비밀번호는 8자 이상으로 입력해주세요.")
	}
}

</script>
</head>
<body>

	<%-- <h1>Fogams</h1>

	<table>
		<tr>
			<td colspan="2">${id }의 비밀번호를 다시 설정합니다.</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" id="pw1"/></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" id="pw2"/></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="변경하기" id="change" onclick="updatePassword()"/></td>
		</tr>
	</table> --%>
	
	
	<div class="login-reg-panel">
		<div class="login-info-box">
			<h2>Have an account?</h2>
			<p>Lorem ipsum dolor sit amet</p>
			<label id="label-register" for="log-reg-show">Password</label>
			<input type="radio" name="active-log-panel" id="log-reg-show"  checked="checked">
		</div>
							
		<div class="register-info-box">
			<h2>Don't have an account?</h2>
			<p>Lorem ipsum dolor sit amet</p>
		</div>
							
		<div class="white-panel">
			<div class="login-show">
				<h2>Password</h2>
				<input type="password" id="pw1" placeholder="Password">
				<input type="password" id="pw2" placeholder="Confirm Password">
				<input type="button" value="비밀번호 수정" onclick="updatePassword()">
			</div>
			
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