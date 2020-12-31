<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Result</title>
</head>

<!-- CSS 링크 넣기 -->
<!-- <link rel="stylesheet"
	href="<c:url value='/resources/css/city_detail.css'/>" />  -->
<link rel="stylesheet" href="resources/css/city.css"/>

<!-- 구글폰트 링크넣기-->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
	rel="stylesheet">
<style type="text/css">
	li {list-style: none; float: left; padding: 6px;}
</style>
<script type="text/javascript" src="resources/js/city_detail.js" defer></script>

<body>
<body>
	<!-- Navbar -->
	<%@ include file="header.jsp"%>

	<!-- 맵 -->
	<section id="map" class="section">
		<div class="map__container">map</div>
	</section>

	<!-- 본문 (버튼, 이미지, 제목) -->
	<section class="contents">
		<h1 class="contents__title">&#39;${map.keyword }&#39;에 대한 검색결과</h1>
		<p class="contents__title">총 ${map.count } 개의 결과</p>
		
		<!--버튼 영역-->
        <div class="company_categories">
            <button class="tab_btn selected" data-filter="room">숙소</button>
            <button class="tab_btn" data-filter="destination">명소</button>
            <button class="tab_btn" data-filter="restaurant">음식점</button>
        </div>

	
			<div class="content-dis" data-type="room">
				<c:choose>
					<c:when test="${empty map.list }">
						<span>등록된 정보가 없습니다.</span>
					</c:when>
					<c:otherwise>
						<c:forEach items="${map.list }" var="dto">
							<c:choose>
								<c:when test="${dto.company_sort eq '숙소' }">
									<div class="contents__detail">
										<div class="contents__img">
											<!-- 업체 상세정보 보기 컨트롤러 요청 -->
											<a href="company_detail.do?company_no=${dto.company_no }" class="project"> 
											<!-- 이미지뿌리기 컨트롤러 요청 -->
											<img src="${pageContext.request.contextPath}/img.do?img=${dto.company_img}" />
											</a>
										</div>
										<div class="contents__name">
											<span>${dto.company_name }</span>
										</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			
			
			<div class="content-dis" data-type="destination">
				<c:choose>
					<c:when test="${empty map.list }">
						<span>등록된 정보가 없습니다.</span>
					</c:when>
					<c:otherwise>
						<c:forEach items="${map.list }" var="dto">
							<c:choose>
								<c:when test="${dto.company_sort eq '명소' }">
									<div class="contents__detail">
										<div class="contents__img">
											<a href="company_detail.do?company_no=${dto.company_no }" class="project"> 
											<img src="${pageContext.request.contextPath}/img.do?img=${dto.company_img}" />
											</a>
										</div>
										<div class="contents__name">
											<span>${dto.company_name }</span>
										</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="content-dis" data-type="restaurant">
				<c:choose>
					<c:when test="${empty map.list }">
						<span>등록된 정보가 없습니다.</span>
					</c:when>
					<c:otherwise>
						<c:forEach items="${map.list }" var="dto">
							<c:choose>
								<c:when test="${dto.company_sort eq '음식점' }">
									<div class="contents__detail">
										<div class="contents__img">
											<a href="company_detail.do?company_no=${dto.company_no }" class="project">  <img src="${pageContext.request.contextPath}/img.do?img=${dto.company_img}"
												alt="${dto.company_img }" />
											</a>
										</div>
										<div class="contents__name">
											<span>${dto.company_name }</span>
										</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>

	</section>

</html>