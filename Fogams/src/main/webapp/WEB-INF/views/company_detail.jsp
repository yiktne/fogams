<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 상세</title>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" 
rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/resources/css/company_detail.css'/>"/>
</head>
<body>

    <!-- 숙소 이미지, 맵, 등 첫번째 섹션 -->
    <section id="company">
        <div class="company__left">
            <div class="company__left_imgBox">
                <img src="img/seoul.jpeg" alt="업체이미지" class="company__left_img">
            </div>
            <div class="company__left_description">
                <h2>숙소이름</h2>
                <p>1박 50,000원</p>
                <p>이곳은 정말 좋은곳이다.</p>
            </div>
        </div>

        <div class="company_right">
            <div class="company__right_map">
                <div class="company__right_mapBox">
                    맵이 들어갈자리
                </div>
            </div>
            <div class="company__right_wish">
                <button class="company__right_wish_btn">
                    즐겨찾기
                </button>
            </div>
        </div>
    </section>

    <!-- 숙소설명, 리뷰, 1:1챗 -->
    <section id="tabsection">
        <div class="tabsection__main">
            <input type="radio" id="tab-1" name="show" checked/>
            <input type="radio" id="tab-2" name="show" />
            <input type="radio" id="tab-3" name="show" />
            <div class="tab">
              <label for="tab-1">숙소 정보</label>
              <label for="tab-2">리뷰</label>
              <label for="tab-3">1:1 채팅</label>
            </div>
            <div class="content">
              <div class="content-dis">
                Concept의 body안 내용을 넣으세요.
              </div>
              <div class="content-dis">
                Color의 body안 내용을 넣으세요.
              </div>
              <div class="content-dis">
                Textile의 body안 내용을 넣으세요.
              </div>
            </div>
        </div>
    </section>

</body>
</html>