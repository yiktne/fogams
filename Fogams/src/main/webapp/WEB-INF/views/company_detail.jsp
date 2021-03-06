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

<!-- js, css -->
<link rel="stylesheet" href="resources/css/company_detail.css?ver=10" />
<script type="text/javascript" src="resources/js/company_detail.js?" defer></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="http://localhost:5000/socket.io/socket.io.js"></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 카카오맵 -->
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=3a1eab4890ae0b2c4a4c97691189904b&libraries=services"></script>
<script type="text/javascript">
	function openPop(){
		var popup = window.open("http://localhost:5000", "채팅팝업", "width=500px,height=600px,scrollbars=yes");
	}
	

	
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	
    <!-- 숙소 이미지, 맵, 등 첫번째 섹션 -->
    <section id="company">
        <div class="company__left">
            <div class="company__left_imgBox">
           		 <!-- 이미지뿌리기 컨트롤러 요청 -->
                <img src="${pageContext.request.contextPath}/img.do?img=${dto.company_img}" alt="${dto.company_img }" class="company__left_img">
            </div>
            <div class="company__left_description">
                <h2 id="com_name">${dto.company_name }</h2>
                <p id="addr">${dto.company_addr }</p>
                <p>${dto.company_sort }</p>
                <p>${dto.company_tel }</p>
               <div class="company__right_wish">
                <button class="company__right_wish_btn">
                    즐겨찾기
                </button>
            </div>
                <input type="hidden" class="company_no" value="${dto.company_no }"/>
            </div>
        </div>

		<!-- 맵 -->
        <div class="company_right">
			<div id="map" style="width:100%;height:100%;"></div>
        </div>
    </section>

    <!-- 숙소설명, 리뷰, 1:1챗 -->
    <section id="tabsection">
        <div class="tabsection__main">
            
            <!-- 버튼영역 -->
            <div class="function_filter">
                <button class="tab_btn selected" data-filter="com_info">업체정보</button>
                <button class="tab_btn" data-filter="price_info">가격정보</button>
                <button class="tab_btn" data-filter="review">리뷰</button>
                <button class="tab_btn" data-filter="chat" onclick="openPop();">채팅</button>
                <button class="tab_btn" data-filter="recommend">추천</button>
            </div>

              <div class="content-dis" data-type="com_info">
                ${dto.company_content }
              </div>
              
              
              <div class="content-dis invisible" data-type="price_info">
                <c:choose>
                	<c:when test="${empty list }"> 등록된 메뉴가 없습니다. </c:when>
                
                <c:otherwise>
                	<c:forEach items="${list }" var="dto">
                		<b>${dto.company_product } : ${dto.company_money } 원
                		<input type="button" onclick="fogamsPay('${dto.company_product}','${dto.company_money }')" value="결제">
                		<br/></b> 
                	</c:forEach>
                </c:otherwise>
                </c:choose>
              </div>
    
              
              <div class="content-dis invisible" data-type="review">
                <!-- 댓글 -->
               	<c:choose>
               		<c:when test="${empty replyList }">
               			<span></span>
               		</c:when>
               		<c:otherwise>
               			<c:forEach items="${replyList }" var="rdto">
               				<div>
               					${rdto.reply_content }
               				</div>
               			</c:forEach>
               		</c:otherwise>
               	
               	</c:choose>
               	<div id="disqus_thread"></div>
<script>
    (function() { 
    var d = document, s = d.createElement('script');
 	   s.src = 'https://fogams.disqus.com/embed.js';
   		 s.setAttribute('data-timestamp', +new Date());
   		 (d.head || d.body).appendChild(s);
  	  })();
    
    //결제
    var IMP = window.IMP; // 생략해도 괜찮습니다.
  	IMP.init("imp74200275"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
  	function fogamspay(companyName,companyAddr){
  		 // IMP.request_pay(param, callback) 호출
  	  IMP.request_pay({ // param
  	    pg: "kakaopay",
  	    pay_method: "card",
  	    merchant_uid: "ORD20180131-0000011",
  	    name: companyName,
  	    amount: companyAddr,
  	    buyer_email: "gildong@gmail.com",
  	    buyer_name: "홍길동",
  	    buyer_tel: "010-4242-4242",
  	    buyer_addr: "서울특별시 강남구 신사동",
  	    buyer_postcode: "01181"
  	  }, function (rsp) { // callback
  	    if (rsp.success) {
  	        alert("결제 성공");
  	    } else {
  	        alert("결제 실패");
  	    }
  	  });
  	}
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
               	
                
                
              </div>
              <div class="content-dis invisible" data-type="chat">
                              <!-- 채팅 -->
               	<a href="#none" class="chat_btn" target="_blank" onclick="openPop()">이 업체와 채팅 시작하기</a>
              </div>
              <div>
              <div class="content-dis" data-type="recommend">
              
				<div>
					이 업체와 비슷한 곳
				</div>
              
				<c:choose>
					<c:when test="${empty recommend }">
						<span>등록된 정보가 없습니다.</span>
					</c:when>
					<c:otherwise>
						<c:forEach items="${recommend }" var="dto">
							<div class="recommend__detail">
								<div class="recommend__img">
									<!-- 업체 상세정보 보기 컨트롤러 요청 -->
									<a href="company_detail.do?company_no=${dto.company_no }" class="project"> 
									<!-- 이미지뿌리기 컨트롤러 요청 -->
									<img src="${pageContext.request.contextPath}/img.do?img=${dto.company_img}" />
									</a>
								</div>
								<div class="recommend__name">
									<span>${dto.company_name }</span>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
              </div>
              </div>
        </div>
    </section>
<%@ include file="footer.jsp" %>

</body>
</html>