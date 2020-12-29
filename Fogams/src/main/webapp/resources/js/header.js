var header_body = document.querySelector('.header_body');
console.log(header_body);
var header_body_height = header_body.getBoundingClientRect().height;
document.addEventListener('scroll', () => {
    if(window.scrollY > header_body_height){
        header_body.classList.add('header_dark');
    }else{
        header_body.classList.remove('header_dark');
    }
});

handleOpenMenu();

	function handleOpenMenu() {
		var menu = document.getElementsByClassName("nav_usermenu")[0];

		if (menu.style.visibility === "hidden") {
			menu.style.visibility = "visible";
		} else {
			menu.style.visibility = "hidden";
		}
	}

	function handleLogin() {
		location.href = "loginform.do";
	}

	function handleLogout() {
		if (confirm("정말로 로그아웃 하시겠습니까?")) {
			var req = new XMLHttpRequest();

			req.addEventListener("load", function() {
				if (JSON.parse(this.responseText)["result"]) {
					location.href = "./";
				} else {
					alert("로그아웃에 실패하였습니다.")
				}
			});

			req.open("POST", "logout.do");
			req.send();
		}
	}
