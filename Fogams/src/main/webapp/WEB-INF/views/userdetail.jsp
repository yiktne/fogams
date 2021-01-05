<%@page import="com.finals.fogams.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="<c:url value='/resources/css/userdetail.css'/>" />

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	$(function() {
		$("#tabs").tabs();

	});

	function updatePassword() {
		if ($("#pw1").val().length >= 8) {
			if ($("#pw1").val() === $("#pw2").val()) {
				$.ajax({
					contentType : "application/json",
					url : encodeURI("updatePassword.do"),
					data : JSON.stringify({
						id : '${dto.member_id}',
						password : $("#pw1").val()
					}),
					dataType : "json",
					method : "POST",
					success : function(res) {
						if (res.result) {
							alert("비밀번호를 변경하였습니다.")
							location.href = "loginform.do";
						} else {
							alert("비밀번호 변경에 실패했습니다. 다시 시도해주세요.")
						}
					},
					error : function(res, status, err) {
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

	<%
		MemberDto memberDto = (MemberDto) session.getAttribute("memberDto");
	%>







	<div id="tabs">
		<div class="subtabs">
			<ul class="nav nav-pills">
				<li role="presentation"><a href="#tabs-1" class="submenu">계정정보</a></li>
				<li role="presentation"><a href="#tabs-2" class="submenu">비밀번호변경</a></li>
			</ul>
		</div>
		<div class="content">

			<!-- 계정정보 -->
			<div id="tabs-1">
				<form class="form-horizontal">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-1 control-label">ID</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="inputEmail3"
								placeholder="Id" value="${dto.member_id }">
						</div>
					</div>



					<div class="form-group">
						<label for="inputEmail3" class="col-sm-1 control-label">Name</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="inputEmail3"
								placeholder="Name" value="${dto.member_name }">
						</div>
					</div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-1 control-label">Email</label>
						<div class="col-sm-5">
							<input type="email" class="form-control" id="inputEmail3"
								placeholder="Email" value="${dto.member_email }">
						</div>
					</div>


				</form>
			</div>


			<!-- 비밀번호 변경 -->
			<div id="tabs-2">

				 <%-- <table>
					<tr>
						<td colspan="2">${dto.member_name } 의비밀번호를 다시 설정합니다.</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" id="pw1" /></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" id="pw2" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" value="변경하기" id="change"
							onclick="updatePassword()" /></td>
					</tr>
				</table>  --%>
				
				
				
				<form class="form-horizontal">
					<div class="form-group mx-auto">
						<label for="inputEmail3" class="col-sm-1 control-label">비밀번호</label>
						<div class="col-sm-5">
							<input type="password" class="form-control" id="pw1">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-1 control-label">비밀번호
							확인</label>
						<div class="col-sm-5">
							<input type="password" class="form-control" id="pw2">
						</div>
					</div>
					<button type="button" class="btn btn-info pull-right" id="change" onclick="updatePassword()">변경</button>
					
				</form>

			</div>


		</div>

	</div>


</body>
</html>