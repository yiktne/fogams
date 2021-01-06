$(function() {
	$('.company__right_wish_btn').click(function() {
		var company_no = $(".company_no").val();
		var data = { "company_no": company_no };
		var company_name = $(".company__left_description > h2").text().trim();
		console.log(company_name);
		$.ajax({
			type: "post",
			url: "bookmark.do",
			data: JSON.stringify(data),
			contentType: "application/json",
			dataType: "json",
			success: function(data) {

				if (data == 0) {
					alert("''" + company_name + "''" + " 가 내 북마크에 추가되었습니다.");
				}

				if (data == 1) {
					alert("이미 북마크에 추가되었습니다.");
				}

				if (data == 2) {
					alert("로그인이 필요합니다.");
				}
			},
			error: function() {
				alert("통신실패");
			}
		});

	});
});



const function_filter = document.querySelector('.function_filter'); //버튼
const content_dis = document.querySelectorAll('.content-dis'); //각 컨텐츠들



function_filter.addEventListener('click', (e) => {
	const filter = e.target.dataset.filter;
	//console.log(filter);
	if (filter == null) {
		return;
	}

	const active = document.querySelector('.tab_btn.selected');
	active.classList.remove('selected');
	//이미 selected 되어있던 요소에서 selected를 없앰
	const target = e.target;
	console.log(target);
	target.classList.add('selected');
	//클릭된 노드의 클래스이름으로 selected 추가

	//content.classList.add('anim-out');
	content_dis.forEach((con) => {
		con.classList.add('anim-out');
	})

	setTimeout(() => {
		content_dis.forEach((con) => {
			if (filter === con.dataset.type) {
				con.classList.remove('invisible');
			} else {
				con.classList.add('invisible');
			}
			con.classList.remove('anim-out');
		});
		//content.classList.remove('anim-out');
	}, 300);
});



//맵
//name, addr찾기

var name = document.getElementById('com_name').innerText;
var addr = document.getElementById('addr').innerText;
console.log(addr);

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

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

addrFind(name,addr);


