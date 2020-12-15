
	var idValid = false;
	var checkId = false;
	var pwValid = false;
	var emailValid = false;
	
	var certString = undefined;
	
	$(function() {
		
		$("#idInvalid").css("visibility", "hidden");
		$("#pwInvalid").css("visibility", "hidden");
		$("#emailInfo").css("visibility", "hidden");
		$("#emailValid").css("visibility", "hidden");
		
		$("#checkId").on("click", function(obj){
			checkIdOverlap();
		});
		
		$("#id").on("change", function() {
			var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
	        if( !idReg.test( $("#id").val() ) ) {
				$("#idInvalid").css("visibility", "visible");
				idValid = false;
	        } else {
				$("#idInvalid").css("visibility", "hidden");
				idValid = true;
			}
			checkId = false;
		});

		$("#pw1").on("change", function() {
			checkPassword();
		});
		
		$("#pw2").on("change", function() {
			checkPassword();
		});
		
		$("#email").on("change", function() {
			emailValid = false;
		})
		
		$("#sendEmail").on("click", function() {
			if(checkEmail()) {
				$("#emailInfo").css("visibility", "visible");
				$("#emailValid").css("visibility", "visible");
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
		});
		
		$("#checkCert").on("click", function() {
			if($("#cert").val() === certString) {
				alert("이메일 인증이 완료되었습니다.");
				emailValid = true;
			} else {
				alert("인증번호가 다릅니다. 다시 한 번 확인해주세요.")
			}
		});
		
		$("#register").on("click", function() {

			if(!checkId) {
				alert("아이디 중복을 확인해주세요.");
				return;
			}
			
			if(!pwValid) {
				alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
				return;
			}
			
			if($("#name").val() == "") {
				alert("이름을 입력해주세요.");
				return;
			}
			
			if(!emailValid) {
				alert("이메일 인증을 완료해주세요. 메일이 도착하지 않았다면 다시 인증번호 전송 버튼을 눌러주세요.");
				return;
			}
				
			$.ajax({
				contentType:"application/json",
				url:"register.do",
				data:JSON.stringify({
					member_id:$("#id").val(),
					member_pw:$("#pw1").val(),
					member_name:$("#name").val(),
					member_email:$("#email").val()
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
		});
	});
	
	function checkIdOverlap() {
		if(idValid) {
			var id = $("#id");
			
			$.ajax({
				contentType:"application/json",
				url:encodeURI("checkIdOverlap.do?id=" + id.val()),
				success:function(res) {
					if(res.result) {
						alert("사용 가능한 아이디입니다.");
						checkId = true;
					} else {
						alert("이미 사용중인 아이디입니다.");
					}
				},
				error:function(res, status, err) {
					console.log(res);
					console.log(err);
				},
			});
		} else {
			alert("6자 이상, 20자 이하의 영문, 숫자로 이루어진 아이디를 입력해주세요.");
		}
	}
	
	function checkPassword() {
		var pw1 = $("#pw1");
		var pw2 = $("#pw2");
		var info = $("#pwInvalid");

		if(pw1.val() !== "") {
			if(pw1.val().length < 8) {
				info.html("비밀번호는 8자리 이상으로 입력해주세요.");
				pwValid = false;
			} else if(pw1.val() === pw2.val()) {
				pwValid = true;
			} else {
				pwValid = false;
				info.html("비밀번호가 일치하지 않습니다.");
			}
		}
			
		if(pwValid) {
			info.css("visibility", "hidden");
		} else {
			info.css("visibility", "visible");
		}
	}
		
	function checkEmail() {
		var email = $("#email").val();

		const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		return re.test(email);
	}
	