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
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

function updatePassword() {
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
}

</script>
</head>
<body>

	<h1>Fogams</h1>

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
	</table>
	
</body>
</html>