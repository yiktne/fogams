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
	    <h1 class="nav_logo"><a href="">Fogams</a></h1>
	
	    <nav class="nav_userinfo">
			<%if(session.getAttribute("dto") == null) { %>
				<input type="button" value="login" onclick="handleLogin()"/>
			<% } else { %>
				<img src="" alt="" />
				사용자님 안녕하세요!
				<input type="button" value="temp" onclick="handleOpenMenu()"/>
			<% } %>
	    </nav>
	    
	    <div class="nav_usermenu">
	    	<ul>
	    		<li><a href="">1</a></li>
	    		<li><a href="">2</a></li>
	    		<li><a href="">3</a></li>
	    		<li><a href="">4</a></li>
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

</script>
</html>