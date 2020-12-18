<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form:form method="post" enctype="multipart/form-data" modelAttribute="dto" action="upload.do">
		<input type="hidden" value="${member_no.member_no }" name="member_no">
		Company name : <input type="text" name="company_name"><br>
		Company sort : 
		<select name="company_sort">
			<option value="숙소" selected>숙소</option>
			<option value="명소">명소</option>
			<option value="음식점">음식점</option>
		</select><br/>
		Content : <input type="text" name="company_content"><br>
		City :
		<select name="company_city">
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
		</select><br/>

		Tel : <input type="text" name="company_tel"><br>
		Number : <input type="text" name="company_number"><br>
		addr : <input type="text" name="company_addr"><br>
		file : <input type="file" name="uploadfile"><br>
		<p style="color:red; font-weight: bold;">
		<form:errors path="uploadfile"></form:errors>
		</p><br>
		<input type="submit" value="전송">
	</form:form>

</body>
</html>