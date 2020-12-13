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
<link rel="stylesheet" href="<c:url value='/resources/css/city_detail.css'/>"/>
<!-- 구글폰트 링크넣기-->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
	rel="stylesheet">
<script src="" defer></script>
<body>

<body>
 <!-- Navbar -->
<%@ include file="header.jsp" %>

	<!-- 맵 -->
    <section id="map" class="section">
        <p>${list}</p>
        <div class="map__container">

        </div>
    </section>

    <!-- 본문 (버튼, 이미지, 제목) -->
    <section id="contents" class="section">
        <h1 class="contents__title">서울</h1>
            <div class="contents__btns">
                <button class="contents__btn">숙소</button>
                <button class="contents__btn">명소</button>
                <button class="contents__btn">음식점</button>
            </div>
        <div class="contents__container">
            <div class="contents__description">
                <div class="contents__detail">
                    <div class="contents__img">
                       <a href="" class="project">
                         <img src="" alt="city_img"/>
                       </a>
                    </div>
                    <div class="contents__name">
                      <span>경복궁</span>
                    </div>
                </div>
            </div>

            <div class="contents__description">
                <div class="contents__detail">
                    <div class="contents__img">
                       <a href="" class="project">
                         <img src="" alt="city_img"/>
                       </a>
                    </div>
                    <div class="contents__name">
                      <span>경복궁</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 페이징버튼 (페이징 기능 만들어야 함 ) -->
    <section id="paging" class="section">

    </section>

<%@ include file="footer.jsp" %>
</body>


</html>