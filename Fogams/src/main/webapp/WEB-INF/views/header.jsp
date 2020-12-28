<%@page import="com.finals.fogams.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/ea746dc176.js" crossorigin="anonymous"></script>
<style type="text/css">

.nav_usermenu {
	position: absolute;
	top: 50px;
	right: 10px;
	background-color: #00000066;
	width: 300px;
	padding: 8px;
}
</style>

<link rel="stylesheet" href="resources/css/header.css" />
<script type="text/javascript" src="resources/js/header.js" defer></script>

</head>
<body>
	<%
		MemberDto memberDto = (MemberDto) session.getAttribute("memberDto");
	%>
	<header>

		<div class="header_body">
			<div class="LogoAndTitle">
				<h1 class="nav_logo">
					<i class="fas fa-mountain"></i> <a href="index.jsp">Fogams</a>
				</h1>
			</div>

			<nav class="nav_userinfo">
				<%
					if (memberDto == null) {
				%>
				<input type="button" class="btn" value="Login" onclick="handleLogin()" />
				<%
					} else {
				%>
				<img src="" alt="" />
				<span class="welcome"><b><%=memberDto.getMember_name()%>님 안녕하세요!&nbsp;&nbsp;</b></span>
				<input type="button"
					value="temp" class="btn" onclick="handleOpenMenu()" />
				<%
					}
				%>
			</nav>
		</div>

		<div class="nav_usermenu">
			<ul>
				<li><a>1</a></li>
				<li><a onclick="handleCom_info()">업체정보 등록하기</a></li>
				<li><a href="bookmarklist.do">나의 북마크 보기</a></li>
				<li><a onclick="handleLogout()">로그아웃</a></li>
			</ul>
		</div>
	</header>

</body>
<script type="text/javascript">
	

	function handleCom_info() {
<%if (memberDto == null) {%>
	location.href = "loginform.do";
<%} else {%>
	location.href = "form.do?member_no=" +
<%=memberDto.getMember_no()%>
	;
<%}%>
	}
</script>
</html>