const company_categories = document.querySelector('.company_categories'); //버튼
const content_dis = document.querySelectorAll('.content-dis'); //각 컨텐츠들



company_categories.addEventListener('click', (e)=>{
    const filter = e.target.dataset.filter;
    //console.log(filter);
    if(filter == null){
        return;
    }

    const active = document.querySelector('.tab_btn.selected');
    active.classList.remove('selected');
    //이미 selected 되어있던 요소에서 selected를 없앰
    const target = e.target;
    console.log(target);
    target.classList.add('selected');
    //클릭된 노드의 클래스이름으로 selected 추가

    content_dis.forEach((con)=>{
        con.classList.add('anim-out');
    })

    setTimeout(()=>{
        content_dis.forEach((con)=>{
            if(filter === con.dataset.type){
                con.classList.remove('invisible');
            }else{
                con.classList.add('invisible');
            }
            con.classList.remove('anim-out');
        });
    },300);
});





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
	        level: 3, // 지도의 확대 레벨
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

	           // 인포윈도우로 장소에 대한 설명을 표시합니다
	           var infowindow = new kakao.maps.InfoWindow({
	        	   content:`<div style="width:150px;text-align:center;padding:6px 0;">
							<a href="company_detail.do?company_no=${com_no}">${name}</a></div>`
					
	           });
	           infowindow.open(map, marker);

	           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	           map.panTo(coords);
	       } 
	   });   
	}
	
	for(var i = 0; i < com_array.length; i++){
		addrFind(com_array[i].name,com_array[i].addr,com_array[i].com_no);
		
	}
