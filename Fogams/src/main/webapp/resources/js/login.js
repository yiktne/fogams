
var inited = false;

$.ajax({
	contentType:"application/json",
	url:"getSecret.do",
	success:function(res) {
		Kakao.init(res.kakao);
		Kakao.isInitialized();
		
		  window.fbAsyncInit = function() {
		    FB.init({
		      appId      : res.fb,
		      cookie     : true,
		      xfbml      : true,
		      version    : 'v9.0'
		    });
		      
		    FB.AppEvents.logPageView();   
			
			inited = true;
		  };
	},
	error:function(res, status, err) {
		console.log(res);
		console.log(err);
	},
});

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

function handleKakaoLogin() {
	if(inited) {
		Kakao.Auth.login({
		    scope: 'profile account_email',
		    success: function(response) {
		    	Kakao.API.request({
		    	    url: '/v2/user/me',
		    	    success: function(response) {
		    	    	$.ajax({
		    	    		contentType:"application/json",
		    	    		url:encodeURI("login.do"),
		    	    		data:JSON.stringify({member_id:"K"+response.id, member_pw:"kakao",}),
		    	    		dataType:"json",
		    	    		method:"POST",
		    	    		success:function(res) {
		    	    			if(res.result) {
		    	    				location.href = "./";
		    	    			} else {
									registerKakao(response);
		    	    			}
		    	    		},
		    	    		error:function(res, status, err) {
		    	    			console.log(res);
		    	    			console.log(err);
		    	    		},
		    	    	});
		    	    },
		    	    fail: function(error) {
		    			alert("카카오 로그인에 실패하였습니다.");
		    	    }
		   		});
		    },
		    fail: function(error) {
				alert("카카오 로그인에 실패하였습니다.");
		    }
		});
	}
}

function handleFBLogin() {
	if(inited) {
		FB.login(function(response) {
			FB.api('/me?fields=email,name', function(response) {
				$.ajax({
		    		contentType:"application/json",
		    		url:encodeURI("login.do"),
		    		data:JSON.stringify({member_id:"F"+response.id, member_pw:"facebook",}),
		    		dataType:"json",
		    		method:"POST",
		    		success:function(res) {
		    			if(res.result) {
		    				location.href = "./";
		    			} else {
							registerFB(response);
		    			}
		    		},
		    		error:function(res, status, err) {
		    			console.log(res);
		    			console.log(err);
		    		},
		    	});
			});
			}, {scope: 'public_profile,email'});
	}
}

function handleRegister() {
	location.href = "registerform.do";
}

function registerKakao(response) {
	$.ajax({
		contentType:"application/json",
		url:"register.do",
		data:JSON.stringify({
			member_id:"K" + response.id,
			member_pw:"kakao",
			member_name:response.kakao_account.profile.nickname,
			member_email:response.kakao_account.email,
		}),
		dataType:"json",
		method:"POST",
		success:function(res) {
			if(res.result) {
				alert("회원가입에 성공하였습니다.");
				location.href = "./";
			} else {
				alert("회원가입에 실패하였습니다.");
			}
		},
		error:function(res, status, err) {
			console.log(res);
			console.log(err);
		},
	});
}

function registerFB(response) {
	$.ajax({
		contentType:"application/json",
		url:"register.do",
		data:JSON.stringify({
			member_id:"F" + response.id,
			member_pw:"facebook",
			member_name:response.name,
			member_email:response.email,
		}),
		dataType:"json",
		method:"POST",
		success:function(res) {
			if(res.result) {
				alert("회원가입에 성공하였습니다.");
				location.href = "./";
			} else {
				alert("회원가입에 실패하였습니다.");
			}
		},
		error:function(res, status, err) {
			console.log(res);
			console.log(err);
		},
	});
}
