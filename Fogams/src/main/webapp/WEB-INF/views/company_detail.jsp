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

        <div class="company_right">
            <div id="company__right_map">

            </div>
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
                <button class="tab_btn" data-filter="chat">1:1 채팅</button>
            </div>

              <div class="content-dis" data-type="com_info">
                ${dto.company_content }
				<table>
					<tr>
						<td align="right">
							<input type="button" value="수정" onclick="location.href='company_updateform.do?company_no=${dto.company_no}'">
							<input type="button" value="삭제" onclick="location.href='company_delete.do?company_no=${dto.company_no}'">
						</td>
					</tr>
				</table>
              </div>
              
              
              <div class="content-dis" data-type="price_info">
                <c:choose>
                	<c:when test="${empty list }"> 등록된 메뉴가 없습니다. </c:when>
                
                <c:otherwise>
                	<c:forEach items="${list }" var="dto">
                		<b>${dto.company_product } : ${dto.company_money } 원<br/></b> 
                	</c:forEach>
                </c:otherwise>
                </c:choose>
              </div>
    
              
              <div class="content-dis" data-type="review">
                <!-- 댓글 -->
               	<c:choose>
               		<c:when test="${empty replyList }">
               			<span>등록된 댓글이 없습니다.</span>
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
    (function() { // DON'T EDIT BELOW THIS LINE
    var d = document, s = d.createElement('script');
 	   s.src = 'https://fogams.disqus.com/embed.js';
   		 s.setAttribute('data-timestamp', +new Date());
   		 (d.head || d.body).appendChild(s);
  	  })();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
               	
                
                
              </div>
              <div class="content-dis" data-type="chat">
                Textile의 body안 내용을 넣으세요.
              </div>
        </div>
    </section>
<%@ include file="footer.jsp" %>



<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=3a1eab4890ae0b2c4a4c97691189904b&libraries=services"></script>
<script>
//맵
var mapContainer = document.getElementById('company__right_map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
var name = document.getElementById('com_name').textContent;
var addr = document.getElementById('addr').innerText;
console.log(`name: ${name}, addr: ${addr}`);

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
function addrFind(name,addr){
   geocoder.addressSearch(addr, function(result, status) {

       // 정상적으로 검색이 완료됐으면 
        if (status === kakao.maps.services.Status.OK) {

           var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

           // 결과값으로 받은 위치를 마커로 표시합니다
           var marker = new kakao.maps.Marker({
               map: map,
               position: coords
           });

           // 인포윈도우로 장소에 대한 설명을 표시합니다
           var infowindow = new kakao.maps.InfoWindow({
               content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
           });
           infowindow.open(map, marker);

           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
           map.panTo(coords);
       } 
   });   
}


</script>

</body>
</html>