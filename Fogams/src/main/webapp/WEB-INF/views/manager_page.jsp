<%@page import="com.finals.fogams.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<!-- logo -->
<script src="https://kit.fontawesome.com/ea746dc176.js"
	crossorigin="anonymous"></script>
<!-- CSS 링크 넣기 -->
<link rel="stylesheet" href="resources/css/manager_page.css?var=5" />
<!-- 구글폰트 링크넣기-->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="resources/js/manager_page.js" defer></script>
</head>
<body>
	<!-- Navbar -->
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
					</select> <input name="keyword" id="search_input" type="text"> <label
						for="search_input" style="cursor: pointer;">
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
						안녕하세요!&nbsp;&nbsp;</b></span> <input type="button" value="my menu"
					class="btn" onclick="handleOpenMenu()" />
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


	<section class="manager">
		<h1 class="page_title">회원관리</h1>
		<table class="member_table">
			<tbody>
				<tr>
					<th class="table_data">member No</th>
					<th class="table_id">ID</th>
					<th class="table_data">Email</th>
					<th class="table_data">Name</th>
					<th class="table_data">Grade</th>
					<th class="table_data del">삭제</th>
				</tr>

				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td class="table_data" colspan="6" align="center">----등록된
								회원이 없습니다----</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="dto">
							<tr>
								<td class="table_data">${dto.member_no }</td>
								<td class="table_id">${dto.member_id }</td>
								<td class="table_data">${dto.member_email }</td>
								<td class="table_data">${dto.member_name }</td>
								<td class="table_data">${dto.member_grade }</td>
								<td class="table_data del_btn del">
									<button class="delete_btn" value="${dto.member_no }">회원삭제
									</button>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</section>

	<!-- 페이징버튼 (페이징 기능 만들어야 함 ) -->
	<section id="paging" class="section">
		<div>
			<ul class="paging_ul">
				<c:if test="${pagemaker.prev}">
					<li><a
						href="list.do${pagemaker.makeQuery(pagemaker.startPage - 1)}">이전</a></li>
				</c:if>

				<c:forEach begin="${pagemaker.startPage}" end="${pagemaker.endPage}"
					var="idx">
					<li><a href="list.do${pagemaker.makeQuery(idx)}">${idx}</a></li>
				</c:forEach>

				<c:if test="${pagemaker.next && pagemaker.endPage > 0}">
					<li><a
						href="list.do${pagemaker.makeQuery(pagemaker.endPage + 1)}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</section>

	<%@ include file="footer.jsp"%>
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