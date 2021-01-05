<%@page import="com.finals.fogams.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/ea746dc176.js"
	crossorigin="anonymous"></script>
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

<link rel="stylesheet" href="resources/css/header.css?var=7" />
<script type="text/javascript" src="resources/js/header.js?ver=1" defer></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

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

			<!-- 검색창 -->
			<div class="searchBox">
				<form action="searchList.do" method="post">
					<select name="searchOption" id="company_city" class="upload_input">
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
					</select>

					<input name="keyword" id="search_input" type="text"> 
					
					<label for="search_input" style="cursor: pointer;">
						<button type="submit">
							<i class="fas fa-search" id="searchSubmit"></i>
						</button>
					</label>
				</form>
			</div>
			
			
			
			

			<nav class="nav_userinfo">
				<%
					if (memberDto == null) {
				%>
				<input type="button" class="btn" value="Login"
					onclick="handleLogin()" />
				<%
					} else {
				%>
				<img src="" alt="" /> <span class="welcome"><b><%=memberDto.getMember_name()%>님
						안녕하세요!&nbsp;&nbsp;</b></span> <input type="button" value="my menu" class="btn"
					onclick="handleOpenMenu()" />
				<%
					}
				%>
			</nav>
		</div>

		<div class="nav_usermenu">
			<ul>
				<li><a onclick="handlemylist()">마이페이지</a></li>
				<li><a onclick="handleCom_info()">업체정보 등록하기</a></li>
				<li><a href="bookmarklist.do">나의 북마크 보기</a></li>
				<li><a onclick="handleLogout()">로그아웃</a></li>
				<li></li>
				<li class="manager"><a href="managing_member.do">회원관리</a></li>
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
	
	
	(function(){
		var manager = document.querySelector('.manager');
		
		<%if(memberDto == null){%>
			return;
		<%}else{%>
			<%if(memberDto.getMember_grade() == 3){%>
				manager.classList.add('selected');
			<%}else{%>
			manager.classList.remove('selected');
			<%}%>
		<%}%>
	})();
	function handlemylist(){
		<%if(memberDto == null){%>
			location.href = "loginform.do";
		<%} else {%>
			location.href = "mylist.do?member_no=" + 
		<%=memberDto.getMember_no()%>
		;
		<%}%>
		
	}
	
	
	
</script>
</html>