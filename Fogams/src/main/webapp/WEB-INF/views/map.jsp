<%@page import="org.springframework.ui.Model"%>
<%@page import="com.finals.fogams.model.dto.CompanyDto"%>
<%@page import="java.util.List"%>
<%@page import="com.finals.fogams.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a1eab4890ae0b2c4a4c97691189904b&libraries=services"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="resources/js/map.js" defer></script>
<!-- CSS 링크 넣기 -->
<link rel="stylesheet" href="resources/css/map.css" />
<!-- 구글폰트 링크넣기-->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
	rel="stylesheet">
</head>
<body>
	 <%@ include file="header.jsp"%> 
	 <% List<CompanyDto> companyList=(List<CompanyDto>)request.getAttribute("all_list"); %>
	<section class="wholeSection">
		<div id="tabs">
			<div id="functionFilter">
				<button class="tabs selected" data-filter="room">숙소</button>
				<button class="tabs" data-filter="famous">관광지</button>
				<button class="tabs" data-filter="food">음식</button>
				<button class="tabs" data-filter="bookmark">찜</button>
			</div>
			<div id="tabs-1" class="company_list" data-type="room">
				<div class="list_table" style="width: 200px; height: 600px; overflow-y: scroll;">
						<c:choose>
							<c:when test="${empty rooms_list }">
								숙소가 존재하지 않습니다
							</c:when>
							<c:otherwise>
								<c:forEach items="${rooms_list }" var="dto">
								<a style="font: bold;">${dto.company_name }</a>
									<img
											src="${pageContext.request.contextPath}/img.do?img=${dto.company_img}"
											alt="${dto.company_img }" class="company__left_img"
											style="width: 150px; height: 150px;"><br/>
									<a onclick="roomsSelect(${dto.company_no },'${dto.company_product }','${dto.company_money }')">${dto.company_product }</a>
									가격 : ${dto.company_money }
								</c:forEach>
							</c:otherwise>
						</c:choose>
				</div>
			</div>
			<div id="tabs-2" class="company_list invisible" data-type="famous">
				<div class="list_table" style="width: 200px; height: 600px; overflow-y: scroll;">
						<c:choose>
							<c:when test="${empty tour_list }">
								관광지가 존재하지 않습니다
							</c:when>
							<c:otherwise>
								<c:forEach items="${tour_list }" var="dto" begin="0" end="10">
									<a style="font: bold;">${dto.company_name }</a>
									<img
											src="${pageContext.request.contextPath}/img.do?img=${dto.company_img}"
											alt="${dto.company_img }" class="company__left_img" style="width: 150px; height: 150px;"><br/>
										<a
											onclick="roomsSelect(${dto.company_no },'${dto.company_product }','${dto.company_money }')">${dto.company_product }</a>
									
										가격 : ${dto.company_money }
								</c:forEach>
							</c:otherwise>
						</c:choose>
				</div>
			</div>
			<div id="tabs-3" class="company_list invisible" data-type="food">
				<div class="list_table" style="width: 200px; height: 600px; overflow-y: scroll;">
						<c:choose>
							<c:when test="${empty food_list }">
								음식점이 존재하지 않습니다
							</c:when>


							<c:otherwise>
								<c:forEach items="${food_list }" var="dto" begin="0" end="10">
									<a style="font: bold;">${dto.company_name }</a>
									<img
											src="${pageContext.request.contextPath}/img.do?img=${dto.company_img}"
											alt="${dto.company_img }" class="company__left_img" style="width: 150px; height: 150px;"><br/>
									<a
											onclick="roomsSelect(${dto.company_no },'${dto.company_product }','${dto.company_money }')">${dto.company_product }<br/>가격 : ${dto.company_money }</a>
									
								</c:forEach>
							</c:otherwise>
						</c:choose>
				</div>
			</div>
			<div id="tabs-4" class="company_list invisible" data-type="bookmark">
				<div class="list_table" style="width: 200px; height: 600px; overflow-y: scroll;">
						<c:choose>
							<c:when test="${empty mark_list }">
								찜목록이 존재하지 않습니다
							</c:when>
							<c:otherwise>
								<c:forEach items="${list }" var="dto">
									<a style="font: bold;">${dto.company_name }</a>
									<img
											src="${pageContext.request.contextPath}/img.do?img=${dto.company_img}"
											alt="${dto.company_img }" class="company__left_img" style="width: 150px; height: 150px;"><br/>
											<a
											onclick="roomsSelect(${dto.company_no },'${dto.company_product }','${dto.company_money }')">${dto.company_product }</a><br/>
											<a>가격 : ${dto.company_money }</a><br/>
								</c:forEach>
							</c:otherwise>
						</c:choose>
				</div>
			</div>
		</div>
		<div class="map_plan">
			<div id="map" style="width: 500px; height: 400px;"></div>
			<form id="plan" action="#">
				<div class="dates">
					<label>시작날짜</label> <input type="date" id="startdate" />
				</div>
				<div class="dates">
					<label>마지막날짜</label> <input type="date" id="lastdate" />
				</div>
				<div class="dates"><input type="button" value="여행 계획 시작" onclick="planstart()" />
				<div id="planlist"></div></div>




			<div id="planfooter" class="dates">
				<p>
					<input type="button" value="계획 저장" onclick="sandplan()">
					총<label><b id="totalmoney">0</b>원</label>
				</p>
				
			</div>
		</form>
		<div id="plantime" style="display: none">
			<form>
				<table>
					<caption>계획 예정 시간</caption>
					<tr>
						<td>몇 일차에 가시겠습니까</td>
						<td><input type="text" name="plandate" /></td>
					</tr>
					<tr>
						<td>시간을 입력해 주세요</td>
						<td><input type="time" name="plantime" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="button"
							value="저장" onclick="addPlan()" /><input type="button" value="취소"
							onclick="closePlanTime()" /></td>
					</tr>
				</table>
			</form>
		</div>
		</div>

		
	</section>
	<script>
	
	//시작 날짜와 마지막 날짜 값. 0이면 다른 기능을 사용전 우선 날짜를 선택 하라고 알림이 뜬다.
	var sdate=0;
	var ldate=0;
	var count=0;
	var money=0;
	var companyNo;
	var companyProduct;
	var companyMoney;
	//숙소 이미지 클릭시 계획에 추가할 수 있도록 한다.
	function roomsSelect(no,product,money){
		if(confirm('계획에 추가 하시겠습니까?')){
			if(sdate==0||ldate==0){
				alert('오른쪽에서 날짜를 먼저 선택해 주세요.');
			}else{
				companyNo=no;
				companyProduct=product;
				companyMoney=money;
				document.getElementById("plantime").style.display = "block";
				document.body.style.background = "gray";
			}
		}
	}
	
	//계획 추가
	function addPlan(){
		
		var plandate=document.getElementsByName('plandate')[0].value-1;
		var plantime=document.getElementsByName('plantime')[0].value;
		
		//숙소 번호
		var addNo=document.createElement("p");
		addNo.innerHTML='<input type="hidden" value="'+companyNo+'" name="company_No"/>';

		//계획 날짜
		var addPlanDate=document.createElement("p");
		addPlanDate.innerHTML='<input type="hidden" value="'+plandate+'" name="plan_Date"/>';

		
		//숙소 이름
		var addProduct=document.createElement("p");
		addProduct.innerHTML='<input type="text" value="'+companyProduct+'" readonly="readonly" name="company_Product"/>';
		
		//숙소 가격
		var addMoney=document.createElement("p");
		addMoney.innerHTML='<input type="text" value="'+companyMoney+'원" name="company_Money"/>';
		
		//숙소 예정 시간
		var addPlanTime=document.createElement("p");
		addPlanTime.innerHTML='<input type="text" value="'+plantime+'" readonly="readonly" name="plan_Time"/>';
		
		document.getElementsByClassName('plandaylist')[plandate].appendChild(addNo);
		document.getElementsByClassName('plandaylist')[plandate].appendChild(addProduct);
		document.getElementsByClassName('plandaylist')[plandate].appendChild(addMoney);
		document.getElementsByClassName('plandaylist')[plandate].appendChild(addPlanTime);
		document.getElementsByClassName('plandaylist')[plandate].appendChild(addPlanDate);
		count++;
		money=money+companyMoney;
		
		closePlanTime();
	}
	
	//시간 입력 창 닫기
	function closePlanTime() {
		document.getElementById("plantime").style.display = "none";
		document.body.style.background = "white";

		var btns = document.getElementsByName("btn");
		for ( var i in btns) {
			btns[i].disabled = "";
		}
	}

	//Kakao Application Key 입력 
	//지도
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: new kakao.maps.LatLng(37.5642135, 127.0016985), // 지도의 중심좌표
	    level: 7	 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	<%for(int i=0;i<companyList.size();i++){
	%>
	geocoder.addressSearch('<%=companyList.get(i).getCompany_addr()%>', function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	     }
	});
	<%
		}
	
    %>

    
   
    //계획
    
    function planstart(){
	<%
	if(memberDto==null){
		%>
		alert("로그인을 확인해 주세요")
	<%
	
	}else{
	%>		
	
	if(sdate!=0){
		alert("이미 날짜를 지정 하셨습니다.");
		return false;
	}
	var startdate=document.getElementById("startdate").value;
	var lastdate=document.getElementById("lastdate").value;
	
	sdate=new Date(startdate);
	ldate=new Date(lastdate)
	
	var day=(ldate.getTime()-sdate.getTime())/(1000*60*60*24);
	
	if(day<0){
		alert('마지막 날짜는 시작 날짜 이후로 선택해 주세요.');
	}else{
		var plantitle=prompt("제목을 입력해 주세요");
		var p=document.createElement("p");
		var ptxt=document.createTextNode(plantitle);
		p.setAttribute("id", "plantitle");
		p.appendChild(ptxt);
		document.getElementById('planlist').appendChild(p);
		for(i=1;i<day+2;i++){
			var div=document.createElement("div");
			var txt=document.createTextNode(i+"일차");
			div.setAttribute("class", "plandaylist");
			div.appendChild(txt);
			document.getElementById('planlist').appendChild(div);	
		}
	}
	<%		
	}
	%>
}	
	
	
	//계획 전송
	function sandplan(){
		var arr = new Array();
		var planlist = new Object();
		for(var i = 0; i<count; i++){
			planlist.plan_title=document.getElementById('plantitle').innerText;
			planlist.company_no=document.getElementsByName('company_No')[i].value;
			planlist.plan_price=document.getElementsByName('company_Money')[i].value;
			planlist.plan_time=(document.getElementsByName('plan_Date')[i].value)+"_"+(document.getElementsByName('plan_Time')[i].value);
			
			arr.push(planlist);
		}
		
		$.ajax({
		    url: 'map_addplan.do'
		    , type: 'post'
		    , dataType: 'json'   // 데이터 타입을 Json으로 변경
		    , contentType: 'application/json'   // Content-Type을 Json으로 변경
		    , data: JSON.stringify(arr)   // JSON String으로 전환하여 보낸다.
		    , success: function(response) {
		    	alert('저장 성공');
		    },
		    error:function(request){
		    	alert('저장 실패')
		    }
		});
	}
	
    
    
</script>
	<%@ include file="footer.jsp"%>
</body>
</html>