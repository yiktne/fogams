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
		No : <input type="number" name="company_no"><br>
		Content : <input type="text" name="company_content"><br>
		Tel : <input type="text" name="company_tel"><br>
		Number : <input type="text" name="company_number"><br>
		addr1 : <input type="text" name="company_addr1"><br>
		addr2 : <input type="text" name="company_addr2"><br>
		file : <input type="file" name="uploadfile"><br>
		<p style="color:red; font-weight: bold;">
		<form:errors path="uploadfile"></form:errors>
		</p><br>
		<input type="submit" value="전송">
	</form:form>

</body>
</html>