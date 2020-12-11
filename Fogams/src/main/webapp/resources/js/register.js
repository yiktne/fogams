
	var checkId = false;
	var pwCheck = false;
	var emailCheck = false;
	
	var certString = 0;
	
	$(function() {
		
		$("#pwIncorrect").css("visibility", "hidden");
		$("#emailInfo").css("visibility", "hidden");
		$("#emailCheck").css("visibility", "hidden");
		
		$("#checkId").on("click", function(obj){
			checkIdOverlap();
		});
		
		$("#id").on("change", function() {
			checkId = false;
		});

		$("#pw1").on("change", function() {
			checkPassword();
		});
		
		$("#pw2").on("change", function() {
			checkPassword();
		});
		
		$("#email").on("change", function() {
			emailCheck = false;
		})
		
		$("#sendEmail").on("click", function() {
			if(checkEmail()) {
				$("#emailInfo").css("visibility", "visible");
				$("#emailCheck").css("visibility", "visible");
				$.ajax({
					contentType:"application/json",
					url:encodeURI("sendCert.do"),
					data:JSON.stringify({mail:$("#email").val()}),
					dataType:"json",
					method:"POST",
					success:function(res) {
						certString = res.cert;
						alert($("#email").val() + "으로 인증번호를 보냈습니다.");
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
			} else {
				alert("인증번호가 다릅니다. 다시 한 번 확인해주세요.")
			}
		});
		
		$("#register").on("click", function() {
			console.log(checkId);
		});

		function checkIdOverlap() {
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
		}
		
		function checkPassword() {
			var pw1 = $("#pw1");
			var pw2 = $("#pw2");
			var info = $("#pwIncorrect");

			if(pw1.val() !== "") {
				if(pw1.val().length < 8) {
					info.html("비밀번호는 8자리 이상으로 입력해주세요.");
					pwCheck = false;
				} else if(pw1.val() === pw2.val()) {
					pwCheck = true;
				} else {
					pwCheck = false;
					info.html("비밀번호가 일치하지 않습니다.");
				}
			}
			
			if(pwCheck) {
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
	});
	
	