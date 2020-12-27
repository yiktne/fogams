<%@page import="com.finals.fogams.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


	header {
		background-color: var(--color-dark-grey);
		vertical-align: middle;
	}
	
	.nav_logo {
		display: inline-block;
	}

	.nav_userinfo {
		float:right;
	}

	.nav_usermenu {
		position: absolute;
		top:50px;
		right:10px;
		background-color: #00000066;
		width: 300px;
		padding: 8px;
	}

</style>

</head>
<body>

	<header>
	    <h1 class="nav_logo"><a href="index.jsp">Fogams</a></h1>
	
		<% MemberDto memberDto = (MemberDto)session.getAttribute("memberDto"); %>
	    <nav class="nav_userinfo">
			<%if(memberDto == null) { %>
				<input type="button" value="login" onclick="handleLogin()"/>
			<% } else { %>
				<img src="" alt="" />
				<%=memberDto.getMember_name() %>님 안녕하세요!
				<input type="button" value="temp" onclick="handleOpenMenu()"/>
			<% } %>
	    </nav>   
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

handleOpenMenu();

function handleOpenMenu() {
	var menu = document.getElementsByClassName("nav_usermenu")[0];
	
	if(menu.style.visibility === "hidden") {
		menu.style.visibility = "visible";
	} else {
		menu.style.visibility = "hidden";
	}
}

function handleLogin() {
	location.href = "loginform.do";
}

function handleLogout() {
	if(confirm("정말로 로그아웃 하시겠습니까?")) {
		var req = new XMLHttpRequest();

		req.addEventListener("load", function() {
		    if(JSON.parse(this.responseText)["result"]) {
				location.href = "./";
		    } else {
		    	alert("로그아웃에 실패하였습니다.")
		    }
		});
		
		req.open("POST", "logout.do");
		req.send();
	}
}

function handleCom_info(){
		<%if(memberDto == null) { %>
		location.href="loginform.do";
		<%}else{%>
		location.href="form.do?member_no="+<%=memberDto.getMember_no()%>;
	<%}%>
}

</script>
</html>