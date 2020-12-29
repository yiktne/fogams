<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script src="http://localhost:5000/socket.io/socket.io.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
		$(document).ready(function(){
			var socket = io("http://localhost:5000")
		});
	</script>
	
	<a href="http://localhost:5000">chat</a>
</body>
</html>