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




