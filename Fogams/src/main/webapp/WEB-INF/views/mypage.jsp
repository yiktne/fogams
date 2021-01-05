<%@page import="com.finals.fogams.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/mypage.css'/>" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=3a1eab4890ae0b2c4a4c97691189904b&libraries=services"></script>

<script>
	$(function() {
		$("#tabs").tabs();

	});
	function openPop() {
		var popup = window.open("http://localhost:5000", "채팅팝업",
				"width=500px,height=600px,scrollbars=yes");
	}

	function moveCompany() {
		var company_no = $(".company_no").val();
		console.log(company_no);
		location.href = "company_detail.do?company_no=" + company_no;
	}

	$(function() {
		$('.btns__delete').click(function() {
			var bookmark_no = $(this).val();
			var data = {
				"bookmark_no" : bookmark_no
			};
			$.ajax({
				type : "post",
				url : "bookmarkDelete.do",
				data : JSON.stringify(data),
				contentType : "application/json",
				dataType : "json",
				success : function(data) {

					if (data == 0) {
						alert("북마크 삭제 실패");
					}

					if (data == 1) {
						alert("북마크가 삭제되었습니다.");
						location.reload();
					}

				},
				error : function() {
					alert("통신실패");
				}
			});

		});
	});
	
	//Map
	
	
	
</script>

<script type="text/javascript">

</script>
</head>
<body>
	<%
		MemberDto memberDto = (MemberDto) session.getAttribute("memberDto");
	%>



	<div class="top">
		<div class="thumb-wrapper">
			<img class="img" src="https://placeimg.com/250/250/any" />
			<h4><%=memberDto.getMember_name()%></h4>
		</div>
	</div>



	<div id="tabs">
		<div class="subtabs">
			<ul class="tabs_ul">
				<li><a href="#tabs-1" class="submenu">여행계획</a></li>
				<li><a href="#tabs-2" class="submenu">리뷰</a></li>
				<li><a href="#tabs-3" class="submenu">업체정보</a></li>
				<li><a href="#tabs-4" class="submenu">즐겨찾기</a></li>
			</ul>
		</div>
		<div class="content">

			<!-- 여행계획 -->
			<div id="tabs-1">
				<p>Proin elit arcu, rutrum commodo, vehicula tempus, commodo a,
					risus. Curabitur nec arcu. Donec sollicitudin mi sit amet mauris.
					Nam elementum quam ullamcorper ante. Etiam aliquet massa et lorem.
					Mauris dapibus lacus auctor risus. Aenean tempor ullamcorper leo.
					Vivamus sed magna quis ligula eleifend adipiscing. Duis orci.
					Aliquam sodales tortor vitae ipsum. Aliquam nulla. Duis aliquam
					molestie erat. Ut et mauris vel pede varius sollicitudin. Sed ut
					dolor nec orci tincidunt interdum. Phasellus ipsum. Nunc tristique
					tempus lectus.</p>
			</div>

			<!-- 리뷰 -->
			<div id="tabs-2">
				<p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus
					gravida ante, ut pharetra massa metus id nunc. Duis scelerisque
					molestie turpis. Sed fringilla, massa eget luctus malesuada, metus
					eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet
					fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam.
					Praesent in eros vestibulum mi adipiscing adipiscing. Morbi
					facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut
					posuere viverra nulla. Aliquam erat volutpat. Pellentesque
					convallis. Maecenas feugiat, tellus pellentesque pretium posuere,
					felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris
					consectetur tortor et purus.</p>
			</div>

			<!-- 업체정보 -->
			<div id="tabs-3">
				<table border="1" class="table" style="text-align: center;">
					<tr class="thead-dark">
						<th scope="col">CompanyName</th>
						<th scope="col">Addr</th>
						<th scope="col">채팅</th>
					</tr>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td>정보가없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list }" var="dto">
								<tr>
									<td><a onclick="moveCompany();">${dto.company_name }</a></td>
									<td>${dto.company_addr }</td>
									<td><button onclick="openPop()"
											style="text-align: center;">채팅</button></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>


			</div>


			<!-- 즐겨찾기 -->
			<div id="tabs-4">


				<div class="row">
					<div class="col-4">
						<c:choose>
							<c:when test="${empty booklist }">
								<h2>아직 등록된 북마크가 없습니다.</h2>
							</c:when>
							<c:otherwise>
								<c:forEach items="${booklist }" var="dto">
									<input type="hidden" class="company_no"
										value="${dto.company_no }">
									<div class="Bookmark__box">
										<div class="Bookmark__dis">
											<div class="dis__img_Container">
												<img
													src="${pageContext.request.contextPath}/img.do?img=${dto.company_img}"
													style="cursor: pointer;" class="dis__sortImg"
													onclick="moveCompany();" />
											</div>
											<div class="dis__text">
												<h2 class="dis__title" style="cursor: pointer;"
													onclick="moveCompany();">${dto.company_name }</h2>
												<span>${dto.company_sort }</span> <span>${dto.company_tel }</span>
												<span>${dto.company_addr }</span>
											</div>
										</div>
										<div class="Bookmark__btns">
											<!-- ajax로 컨트롤러요청하기 -->
											<button class="btn btn-info" onclick="moveCompany();">보기</button>
											<button class="btn btn-info" value="${dto.bookmark_no }">즐겨찾기
												삭제</button>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>


					</div>
					<div class="col-6">
					
						Map이 들어갈 자리
					<div id="map" style="width:750px;height:350px;"></div>
					
					</div>
				</div>



			</div>
		</div>

	</div>
	<!-- Map -->
	<script type="text/javascript">
	
	var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
        level : 14 // 지도의 확대 레벨 
    });
    
    // 마커 클러스터러를 생성합니다 
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 10 // 클러스터 할 최소 지도 레벨 
    });
 
    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
    $.get("/download/web/data/chicken.json", function(data) {
        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
        var markers = $(data.positions).map(function(i, position) {
            return new kakao.maps.Marker({
                position : new kakao.maps.LatLng(position.lat, position.lng)
            });
        });

        // 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);
    });
	
	
	</script>
</body>
</html>