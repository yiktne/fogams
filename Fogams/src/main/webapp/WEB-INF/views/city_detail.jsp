<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도시 상세</title>
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
		<h1 class="contents__title">서울</h1>
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
						<span>작성된 글이없습니다.</span>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="dto">
							<c:when test="${dto.company_sort = '음식점' }">
								<div class="contents__detail">
									<div class="contents__img">
										<a href="" class="project"> <img src="img/seoul.jpeg"
											alt="city_img" />
										</a>
									</div>
									<div class="contents__name">
										<span>${dto.company_name }</span>
									</div>
								</div>
							</c:when>
						</c:forEach>
					</c:otherwise>
				</c:choose>

				<div class="contents__detail">
					<div class="contents__img">
						<a href="" class="project"> <img src="img/seoul.jpeg"
							alt="city_img" />
						</a>
					</div>
					<div class="contents__name">
						<span>경복궁</span>
					</div>
				</div>
				
				<div class="contents__detail">
					<div class="contents__img">
						<a href="" class="project"> <img src="img/seoul.jpeg"
							alt="city_img" />
						</a>
					</div>
					<div class="contents__name">
						<span>경복궁</span>
					</div>
				</div>
			</div>
			<div class="content-dis">Color의 body안 내용을 넣으세요.</div>
			<div class="content-dis">Textile의 body안 내용을 넣으세요.</div>
		</div>
	</section>


	<!-- 페이징버튼 (페이징 기능 만들어야 함 ) -->
	<section id="paging" class="section"></section>

	<%@ include file="footer.jsp"%>
</body>


</html>