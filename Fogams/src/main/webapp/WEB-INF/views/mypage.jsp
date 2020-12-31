<%@page import="com.finals.fogams.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/mypage.css'/>" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
	    $( "#tabs" ).tabs();
	    
	  });
  function openPop(){
		var popup = window.open("http://localhost:5000", "채팅팝업", "width=500px,height=600px,scrollbars=yes");
	}
  
  </script>
</head>
<body>
	<%
		MemberDto memberDto = (MemberDto) session.getAttribute("memberDto");
	%>


	
	<div class="top">
		<div class="thumb-wrapper">
			<img class="img" src="https://placeimg.com/200/200/any"/>
			<h4><%=memberDto.getMember_name() %></h4>
		</div>
	</div>
	
	
	
		<div id="tabs">
		<div class="subtabs">
			<ul class="tabs_ul">
				<li><a href="#tabs-1" class="submenu">여행계획</a></li>
				<li><a href="#tabs-2" class="submenu">리뷰</a></li>
				<li><a href="#tabs-3" class="submenu">업체정보</a></li>
				<li><a href="#tabs-4" class="submenu">즐겨찾기</a></li>
			</ul>
		</div>
		<div class="content">
		
				<!-- 여행계획 -->
			 <div id="tabs-1">
                <p>Proin elit arcu, rutrum commodo, vehicula tempus, commodo a, risus. Curabitur nec arcu. Donec sollicitudin mi sit amet mauris. Nam elementum quam ullamcorper ante. Etiam aliquet massa et lorem. Mauris dapibus lacus auctor risus. Aenean tempor ullamcorper leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel pede varius sollicitudin. Sed ut dolor nec orci tincidunt interdum. Phasellus ipsum. Nunc tristique tempus lectus.</p>
              </div>
              
              <!-- 리뷰 -->
              <div id="tabs-2">
                <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
              </div>
              
              <!-- 업체정보 -->
              <div id="tabs-3">
				<table border="1" class="table" style="text-align: center;">
					<tr class="thead-dark">
						<th scope="col">CompanyName</th>
						<th scope="col">Addr</th>
						<th scope="col">채팅</th>
					</tr>
					
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td>정보가없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list }" var="dto">
								<tr>
									<td>${dto.company_name }</td>
									<td>${dto.company_addr }</td>
									<td><button onclick="openPop()" style="text-align: center;">채팅</button></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>

        			        
              </div>
              
              
              <!-- 즐겨찾기 -->
              <div id="tabs-4">
              	<p>1234</p>
              </div>
		</div>
			
		</div>
</body>
</html>