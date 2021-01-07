<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>city detail</title>
</head>

<!-- CSS 링크 넣기 -->
<!-- <link rel="stylesheet"
	href="<c:url value='/resources/css/city_detail.css'/>" />  -->
<link rel="stylesheet" href="resources/css/city.css?ver=2"/>

<!-- 구글폰트 링크넣기-->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
	rel="stylesheet">
<style type="text/css">
	li {list-style: none; float: left; padding: 6px;}
</style>
<!-- 제이쿼리 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript" src="resources/js/city_detail.js?ver=2" defer></script>
<!-- 카카오맵 -->
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=3a1eab4890ae0b2c4a4c97691189904b&libraries=services"></script>

<body>
	<!-- Navbar -->
	<%@ include file="header.jsp"%>

	<!-- 맵 -->
	<section  id="map" style="width:100%;height:400px;">
	<!--<div id="map" style="width:100%;height:100%;"></div>  -->
	</section>

	<!-- 본문 (버튼, 이미지, 제목) -->
	<section class="contents">
		<h1 class="contents__title">
			<c:forEach items="${list }" var="dto" begin="1" end="1">
					${dto.company_city }
			</c:forEach>
		</h1>
		
		<!--버튼 영역-->
        <div class="company_categories">
            <button class="tab_btn selected" data-filter="room">숙소</button>
            <button class="tab_btn" data-filter="destination">명소</button>
            <button class="tab_btn" data-filter="restaurant">음식점</button>
        </div>

	
			<div class="content-dis" data-type="room">
				<c:choose>
					<c:when test="${empty list }">
						<span>등록된 정보가 없습니다.</span>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="dto">
							<c:choose>
								<c:when test="${dto.company_sort eq '숙소' }">
									<div class="contents__detail">
										<!-- 주소 -->
										<input type="hidden" class="com_addr" value="${dto.company_addr }"/>
										<!-- 회사번호 -->
										<input type="hidden" class="com_no" value="${dto.company_no }"/>
										<div class="contents__img">
											<!-- 업체 상세정보 보기 컨트롤러 요청 -->
											<a href="company_detail.do?company_no=${dto.company_no }" class="project"> 
											<!-- 이미지뿌리기 컨트롤러 요청 -->
											<img src="${pageContext.request.contextPath}/img.do?img=${dto.company_img}" />
											</a>
										</div>
										<div class="contents__name">
											<span><input type="hidden" class="com_name" value="${dto.company_name }">${dto.company_name }</span>
										</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			
			
			<div class="content-dis invisible" data-type="destination">
				<c:choose>
					<c:when test="${empty list }">
						<span>등록된 정보가 없습니다.</span>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="dto">
							<c:choose>
								<c:when test="${dto.company_sort eq '명소' }">
									<div class="contents__detail">
										<!-- 주소 -->
										<input type="hidden" class="com_addr" value="${dto.company_addr }"/>
										<!-- 회사번호 -->
										<input type="hidden" class="com_no" value="${dto.company_no }"/>
										<div class="contents__img">
											<a href="company_detail.do?company_no=${dto.company_no }" class="project"> 
											<img src="${pageContext.request.contextPath}/img.do?img=${dto.company_img}" />
											</a>
										</div>
										<div class="contents__name">
											<span><input type="hidden" class="com_name" value="${dto.company_name }">${dto.company_name }</span>
										</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="content-dis invisible" data-type="restaurant">
				<c:choose>
					<c:when test="${empty list }">
						<span>등록된 정보가 없습니다.</span>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="dto">
							<c:choose>
								<c:when test="${dto.company_sort eq '음식점' }">
									<div class="contents__detail">
										<!-- 주소 -->
										<input type="hidden" class="com_addr" value="${dto.company_addr }"/>
										<!-- 회사번호 -->
										<input type="hidden" class="com_no" value="${dto.company_no }"/>
										<div class="contents__img">
											<a href="company_detail.do?company_no=${dto.company_no }" class="project">  <img src="${pageContext.request.contextPath}/img.do?img=${dto.company_img}"
												alt="${dto.company_img }" />
											</a>
										</div>
										<div class="contents__name">
											<span><input type="hidden" class="com_name" value="${dto.company_name }">${dto.company_name }</span>
										</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
	</section>
<%@ include file="footer.jsp" %>	

</body>
</html>