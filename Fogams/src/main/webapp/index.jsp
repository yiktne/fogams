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
    <link rel="stylesheet" href="<c:url value='/resources/css/indes.css?ver=1'/>"/>
    <!-- 구글폰트 링크넣기-->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" 
rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

    <script src="" defer></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
 <!-- Navbar 따로만들기 -->
<%@ include file="./WEB-INF/views/header.jsp" %>

    <!-- maketrip (내 여행을 만들어보세요) -->
    <section id="maketrip">
        <h1 class="maketrip__title">내 여행을 만들어보세요</h1>
        <p class="maketrip__description">
        포감스가 쉽고 재밌는 여행을 돕기위해 왔습니다.<br/>눈을 반짝반짝 뜨고 새로운 것을 찾을 준비가 되셨나요?<br/>그렇다면 아래의 버튼을 눌러 여행을 만들어보세요.</p>  
        <button class="maketrip__btn" onclick="location.href='map.do'">여행 만들러 가기</button>
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
                	<!--컨트롤러 요청 -->
                    <a href="company_info.do?company_city=경기도" >
                    <img src="resources/img/gyeongydo.jpg" alt="city_image" class="pickcity__img">
                    </a>
                </div>
                <p class="pickcity__city_name">경기도</p>
            </div>
            
            
            <div class="pickcity__city">
                <div class="pickcity__img_container">
                	<!--컨트롤러 요청 -->
                    <a href="company_info.do?company_city=강원도" >
                    <img src="resources/img/gangwondo.jpg" alt="city_image" class="pickcity__img">
                    </a>
                </div>
                <p class="pickcity__city_name">강원도</p>
            </div>
            
            <div class="pickcity__city">
                <div class="pickcity__img_container">
                	<!--컨트롤러 요청 -->
                    <a href="company_info.do?company_city=충청남도" >
                    <img src="resources/img/chungchung-namdo.jpeg" alt="city_image" class="pickcity__img">
                    </a>
                </div>
                <p class="pickcity__city_name">충청남도</p>
            </div>
            
            <div class="pickcity__city">
                <div class="pickcity__img_container">
                	<!--컨트롤러 요청 -->
                    <a href="company_info.do?company_city=충청북도" >
                    <img src="resources/img/chungchung-bookdo.jpg" alt="city_image" class="pickcity__img">
                    </a>
                </div>
                <p class="pickcity__city_name">충청북도</p>
            </div>
            
            <div class="pickcity__city">
                <div class="pickcity__img_container">
                	<!--컨트롤러 요청 -->
                    <a href="company_info.do?company_city=경상남도" >
                    <img src="resources/img/gyeongsang-namdo.jpeg" alt="city_image" class="pickcity__img">
                    </a>
                </div>
                <p class="pickcity__city_name">경상남도</p>
            </div>
            
            <div class="pickcity__city">
                <div class="pickcity__img_container">
                	<!--컨트롤러 요청 -->
                    <a href="company_info.do?company_city=경상북도" >
                    <img src="resources/img/gyeongsang-bookdo.jpeg" alt="city_image" class="pickcity__img">
                    </a>
                </div>
                <p class="pickcity__city_name">경상북도</p>
            </div>
            
            <div class="pickcity__city">
                <div class="pickcity__img_container">
                	<!--컨트롤러 요청 -->
                    <a href="company_info.do?company_city=전라남도" >
                    <img src="resources/img/jeonla-namdo.jpeg" alt="city_image" class="pickcity__img">
                    </a>
                </div>
                <p class="pickcity__city_name">전라남도</p>
            </div>
            
            <div class="pickcity__city">
                <div class="pickcity__img_container">
                	<!--컨트롤러 요청 -->
                    <a href="company_info.do?company_city=전라북도" >
                    <img src="resources/img/jeonla-bookdo.jpeg" alt="city_image" class="pickcity__img">
                    </a>
                </div>
                <p class="pickcity__city_name">전라북도</p>
            </div>
            
            <div class="pickcity__city">
                <div class="pickcity__img_container">
                	<!--컨트롤러 요청 -->
                    <a href="company_info.do?company_city=제주도" >
                    <img src="resources/img/jejudo.jpg" alt="city_image" class="pickcity__img">
                    </a>
                </div>
                <p class="pickcity__city_name">제주도</p>
            </div>
            
        </div>
    </section>


<%@ include file="./WEB-INF/views/footer.jsp" %>
</body>
</html>