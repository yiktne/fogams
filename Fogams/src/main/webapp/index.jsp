<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fogams</title>
    <meta name="final project" content="Fogams"/>
    <!-- CSS 링크 넣기 -->
    <link rel="stylesheet" href="<c:url value='/resources/css/front.css'/>"/>
    <!-- 구글폰트 링크넣기-->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" 
rel="stylesheet">

    <script src="" defer></script>
</head>
<body>
 <!-- Navbar 따로만들기 -->
<%@ include file="./WEB-INF/views/header.jsp" %>

    <!-- maketrip (내 여행을 만들어보세요) -->
    <section id="maketrip">
        <h1 class="maketrip__title">내 여행을 만들어보세요</h1>
        <p class="maketrip__description">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti voluptates reprehenderit veritatis distinctio blanditiis tempore officia eos amet! Magni dolorum, incidunt sapiente sit aut unde! Sapiente maiores molestias aut quo.</p>  
        <button class="maketrip__btn">여행 만들러 가기</button>
        <a href="form.do">업로드</a>
    </section>

    <!-- pickcity (이런 여행지 어때요?) -->
    <section id="pickcity" class="section section__container">
        <h2 class="pickcity__title">이런 여행지 어때요?</h2>
        <div class="pickcity__container">
            <div class="pickcity__city">
                <div class="pickcity__img_container">
                	<!--컨트롤러 요청 -->
                    <a href="company_info.do?company_city=서울" >
                    <img src="resources/img/seoul.jpeg" alt="city_image" class="pickcity__img">
                    </a>
                </div>
                <p class="pickcity__city_name">서울</p>
            </div>
            
            <div class="pickcity__city">
                <div class="pickcity__img_container">
                    <a href=""><img src="resources/img/seoul.jpeg" alt="" class="pickcity__img"></a>
                </div>
                <p class="pickcity__city_name">경기도</p>
            </div>
            
            <div class="pickcity__city">
                <div class="pickcity__img_container">
                    <a href=""><img src="" alt="" class="pickcity__img"></a>
                </div>
                <p class="pickcity__city_name">강원도</p>
            </div>
            
             <div class="pickcity__city">
                <div class="pickcity__img_container">
                    <a href=""><img src="" alt="" class="pickcity__img"></a>
                </div>
                <p class="pickcity__city_name">충청남도</p>
            </div>
            
             <div class="pickcity__city">
                <div class="pickcity__img_container">
                    <a href=""><img src="" alt="" class="pickcity__img"></a>
                </div>
                <p class="pickcity__city_name">충청북도</p>
            </div>
            
             <div class="pickcity__city">
                <div class="pickcity__img_container">
                    <a href=""><img src="" alt="" class="pickcity__img"></a>
                </div>
                <p class="pickcity__city_name">경상남도</p>
            </div>
            
           	 <div class="pickcity__city">
                <div class="pickcity__img_container">
                    <a href=""><img src="" alt="" class="pickcity__img"></a>
                </div>
                <p class="pickcity__city_name">경상북도</p>
            </div>
            
             <div class="pickcity__city">
                <div class="pickcity__img_container">
                    <a href=""><img src="" alt="" class="pickcity__img"></a>
                </div>
                <p class="pickcity__city_name">전라남도</p>
            </div>
            
             <div class="pickcity__city">
                <div class="pickcity__img_container">
                    <a href=""><img src="" alt="" class="pickcity__img"></a>
                </div>
                <p class="pickcity__city_name">전라북도</p>
            </div>
            
             <div class="pickcity__city">
                <div class="pickcity__img_container">
                    <a href=""><img src="" alt="" class="pickcity__img"></a>
                </div>
                <p class="pickcity__city_name">제주도</p>
            </div>
            
            
        </div>
    </section>
    
    <!-- reviews (다른 사람 여행 보기) -->
    <section id="reviews" class="section section__container">
        <h2 class="reviews__title">다른 사람 여행 보기</h2>
        <div class="reviews__container">
            <div class="reviews__recommend">
                <div class="reviews__img_container">
                    <a href="#"><img src="" alt="city_image" class="reviews__img"></a>
                </div>
                <p class="reviews__name">서울</p>
            </div>
            <div class="reviews__recommend">
                <div class="reviews__img_container">
                    <a href=""><img src="" alt="" class="reviews__img"></a>
                </div>
                <p class="reviews__name">서울</p>
            </div><div class="reviews__recommend">
                <div class="reviews__img_container">
                    <a href=""><img src="" alt="" class="reviews__img"></a>
                </div>
                <p class="reviews__name">서울</p>
            </div>
        </div>
    </section>


<%@ include file="./WEB-INF/views/footer.jsp" %>
</body>
</html>