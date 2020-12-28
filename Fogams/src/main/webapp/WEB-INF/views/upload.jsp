<%@page import="com.finals.fogams.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체정보 등록하기</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	
<%MemberDto memberDto = (MemberDto) session.getAttribute("memberDto");%>
	
<%int member_no = memberDto.getMember_no();%>
	window.onload = function() {
<%if (member_no == 0) {%>
	location.href = "loginform.do";
<%}%>
	};
</script>


<!-- 구글폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/upload.css" />
</head>
<body>



	<div class="upload_container">
		<h1 class="upload_page_title">업체 정보 등록</h1>
		<form:form method="post" id="formTag" enctype="multipart/form-data"
			modelAttribute="dto" action="upload.do">
			<input type="hidden" value="${member_no }" name="member_no">

			<div class="inputBox_set">
				<label for="company_name">업체 이름 </label> <input type="text"
					name="company_name" id="company_name" class="upload_input"
					required="required"><br>
			</div>



			<div class="inputBox_set">
				<label for="company_sort">업체 종류 </label> <select name="company_sort"
					id="company_sort" class="upload_input">
					<option value="숙소" selected>숙소</option>
					<option value="명소">명소</option>
					<option value="음식점">음식점</option>
				</select><br />
			</div>




			<div class="inputBox_set">
				<label for="company_city">도시 선택 </label> <select name="company_city"
					id="company_city" class="upload_input">
					<option value="서울" selected>서울</option>
					<option value="경기도">경기도</option>
					<option value="강원도">강원도</option>
					<option value="충청남도">충청남도</option>
					<option value="충청북도">충청북도</option>
					<option value="경상남도">경상남도</option>
					<option value="경상북도">경상북도</option>
					<option value="전라남도">전라남도</option>
					<option value="전라북도">전라북도</option>
					<option value="제주도">제주도</option>
				</select><br />
			</div>


			<div class="inputBox_set">
				<label for="company_tel">전화번호 </label> <input type="text"
					name="company_tel" id="company_tel" class="upload_input"
					required="required"><br>
			</div>



			<div class="inputBox_set">
				<label for="company_number">사업자번호 </label> <input type="text"
					name="company_number" id="company_number" class="upload_input"
					required="required"><br>
			</div>



			<div class="inputBox_set">
				<label for="company_addr">업체 주소 </label> <input type="text"
					name="company_addr" id="company_addr" class="upload_input"
					required="required"><br>
			</div>

			<div class="inputBox_set">
				<label for="uploadfile">대표이미지 </label> <input type="file"
					name="uploadfile" id="uploadfile" class="upload_input"
					required="required"><br>
				<p style="color: red; font-weight: bold;"></p>
				<form:errors path="uploadfile"></form:errors>
			</div>


			<div class="inputBox_set">
				<label for="company_content">업체 상세설명 </label>
				<textarea id="editor" name="company_content" class="upload_input"
				required="required"></textarea>
			</div>
			


			<input type="submit" class="upload_submit" value="등록하기">
			<!-- <button value="등록하기" class="upload_submit">등록하기</button>  -->

			<!-- <input type="submit" value="등록하기" class="upload_submit"> -->
			<script type="text/javascript">
				var submitButton = document.getElementsByClassName('upload_submit')[0];
				console.log(submitButton);
				submitButton.addEventListener('click', function() {
					var content = document.querySelector('#editor').value;
					console.log(content);
					//var content = document.getElementById('cke_ckeditor');
					if (content === null || content == "") {
						alert('업체 소개를 작성해주세요');
						return false;
					}
				});
			</script>
		</form:form>
	</div>
</body>
</html>