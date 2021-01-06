<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script> -->
<!-- <style type="text/css">

 	h1, div {
		text-align: center;
	}
	
	.button {
		width: 200px;
		height: 30px;
		margin: 8px;
	}
</style> -->


<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="resources/css/login.css"/>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
<script type="text/javascript" src="resources/js/login.js"></script>
<script type="text/javascript" src="resources/js/register.js"></script>


 </head>
<body>


	
	<!-- <div>
		아이디 <input type="text" id="id"/><br/><br/>
		비밀번호 <input type="password" id="pw"/><br/><br/> -->
		<!-- <input class="button" type="button" value="로그인" onclick="handleLogin()"/><br/>
		<input class="button" type="button" value="카카오 로그인" onclick="handleKakaoLogin()"/><br/>
		<input class="button" type="button" value="Facebook 로그인" onclick="handleFBLogin()"/><br/>
		<input class="button" type="button" value="회원가입" onclick="handleRegister()"/><br/>  -->
		
		<!-- 
		<div class="container">
      <div class="row">
        <div class="col-12">
          <div class="btn-group-vertical">
		<button type="button" class="btn btn-outline-primary" onclick="handleLogin()">로그인</button>
		<button type="button" class="btn btn-outline-primary" onclick="handleRegister()">회원가입</button><br>
		<button type="button" class="btn btn-outline-primary" onclick="handleKakaoLogin()">Kakao 로그인</button>
		<button type="button" class="btn btn-outline-primary" onclick="handleFBLogin()">Facebook 로그인</button><br><br>
		<a href="finduserform.do">아이디/비밀번호를 잃어버리셨나요?</a>
		</div>
		</div>
		</div>
	</div>
	 -->
	
	
	
	
	<div class="login-reg-panel">
		<div class="login-info-box">
			<h2>Have an account?</h2>
			<p>Lorem ipsum dolor sit amet</p>
			<label id="label-register" for="log-reg-show">Login</label>
			<input type="radio" name="active-log-panel" id="log-reg-show"  checked="checked">
		</div>
							
		<div class="register-info-box">
			<h2>Don't have an account?</h2>
			<p>Lorem ipsum dolor sit amet</p>
			<label id="label-login" for="log-login-show">Register</label>
			<input type="radio" name="active-log-panel" id="log-login-show">
		</div>
							
		<div class="white-panel">
			<div class="login-show">
				<h2>LOGIN</h2>
				<input type="text" id="id">
				<input type="password" id="pw" placeholder="Password">
				<input type="button" value="Login" onclick="handleLogin()">
				<a href="finduserform.do">Forgot password?</a>
			</div>
			<div class="register-show">
				<h2>REGISTER</h2>
				<input type="button" value="중복 체크" id="checkId"/>

				<input type="text" placeholder="ID" id="register_id">
				<input type="password" placeholder="Password" id="pw1">
				<input type="password" placeholder="Confirm Password" id="pw2">
				<input type="text" placeholder="Name" id="name">
				<input type="button" value="인증번호 전송" id="sendEmail"/>
				<input type="text" placeholder="Email" id="email">
				<input type="button" value="인증번호 확인" id="checkCert"/>
				<input type="text" id="cert">
				<input type="button" value="Register" id="register" style="float: left;" >
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