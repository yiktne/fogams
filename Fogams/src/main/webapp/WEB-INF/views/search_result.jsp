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
<!-- 제이쿼리 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 카카오맵 -->
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=3a1eab4890ae0b2c4a4c97691189904b&libraries=services"></script>
<body>
<body>
	<!-- Navbar -->
	<%@ include file="header.jsp"%>

	<!-- 맵 -->
	<section  id="map" style="width:100%;height:400px;">
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
					<c:when test="${empty map.list }">
						<span>등록된 정보가 없습니다.</span>
					</c:when>
					<c:otherwise>
						<c:forEach items="${map.list }" var="dto">
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
					<c:when test="${empty map.list }">
						<span>등록된 정보가 없습니다.</span>
					</c:when>
					<c:otherwise>
						<c:forEach items="${map.list }" var="dto">
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
	<script type="text/javascript">
	
	//맵
	//name, addr찾기
var com_array = [];
$('input[class=com_addr]').each(function(index, item){
	
	var com_addr = $(this).val();
	var com_name = $('input[class=com_name]').eq(index).val();
	var com_no = $('input[class=com_no]').eq(index).val();
	var obj = {};
	obj['addr'] = com_addr;
	obj['name'] = com_name;
	obj['com_no'] = com_no;
	com_array.push(obj);
});

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	
	// 주소로 좌표를 검색합니다
	function addrFind(name,addr,com_no){
	   geocoder.addressSearch(addr, function(result, status) {

	       // 정상적으로 검색이 완료됐으면 
	        if (status === kakao.maps.services.Status.OK) {

	           var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	           
	           
	           // 마커 이미지의 이미지 크기 입니다
	           var imageSize = new kakao.maps.Size(24, 35); 
	           
	           // 마커 이미지를 생성합니다    
	           var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	           
	           // 마커를 생성합니다
	           var marker = new kakao.maps.Marker({
	               map: map, // 마커를 표시할 지도
	               position: coords, // 마커를 표시할 위치
	               title : name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	               image : markerImage // 마커 이미지 
	           });
	           
	           
/* 
	           // 결과값으로 받은 위치를 마커로 표시합니다
	           var marker = new kakao.maps.Marker({
	               map: map,
	               position: coords
	           }); */

	           // 인포윈도우로 장소에 대한 설명을 표시합니다
	           var infowindow = new kakao.maps.InfoWindow({
	               content: `<div style="width:150px;text-align:center;padding:6px 0;"><a href="company_detail.do?company_no=${com_no}">${name}</a></div>`
	           });
	           infowindow.open(map, marker);

	           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	           map.panTo(coords);
	       } 
	   });   
	}
	

	for(var i = 0; i < com_array.length; i++){
		addrFind(com_array[i].name,com_array[i].addr,com_array[i].com_no);
	
	
	</script>

</html>