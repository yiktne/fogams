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
<link rel="stylesheet"
	href="<c:url value='/resources/css/city_detail.css'/>" />
<!-- 구글폰트 링크넣기-->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
	rel="stylesheet">
<script src="" defer></script>
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
		<h1 class="contents__title">
			<c:forEach items="${list }" var="dto">
				${dto.company_city }
			</c:forEach>
		</h1>
		<input type="radio" id="tab-1" name="show" checked /> <input
			type="radio" id="tab-2" name="show" /> <input type="radio"
			id="tab-3" name="show" />
		<div class="tab">
			<label for="tab-1" class="tab_btn">숙소</label> <label for="tab-2"
				class="tab_btn">명소</label> <label for="tab-3" class="tab_btn">음식점</label>
		</div>
		<div class="content">
			<div class="content-dis">
				<c:choose>
					<c:when test="${empty list }">
						<span>등록된 정보가 없습니다.</span>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="dto">
							<c:choose>
								<c:when test="${dto.company_sort eq '숙소' }">
									<div class="contents__detail">
										<div class="contents__img">
											<a href="" class="project">
											<img src="/img.do?imgName=${dto.company_img }"
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
			<div class="content-dis">
				<c:choose>
					<c:when test="${empty list }">
						<span>등록된 정보가 없습니다.</span>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="dto">
							<c:choose>
								<c:when test="${dto.company_sort eq '명소' }">
									<div class="contents__detail">
										<div class="contents__img">
											<a href="" class="project"> <img src=""
												alt="city_img" />
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
			<div class="content-dis">
				<c:choose>
					<c:when test="${empty list }">
						<span>등록된 정보가 없습니다.</span>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="dto">
							<c:choose>
								<c:when test="${dto.company_sort eq '음식점' }">
									<div class="contents__detail">
										<div class="contents__img">
											<a href="" class="project"> <img src="${pageContext.request.contextPath}/img.do?img=${dto.company_img}"
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
		</div>
	</section>


	<!-- 페이징버튼 (페이징 기능 만들어야 함 ) -->
	<section id="paging" class="section"></section>

	<%@ include file="footer.jsp"%>
</body>


</html>