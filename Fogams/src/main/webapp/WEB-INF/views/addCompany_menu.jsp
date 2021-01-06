<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 메뉴 추가</title>
<script src="https://kit.fontawesome.com/ea746dc176.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" 
    rel="stylesheet">
    <link rel="stylesheet" href="resources/css/addCompany_menu.css?ver=3"/>
    <script type="text/javascript" src="resources/js/addCompany_menu.js?ver=2" defer></script>
</head>
<body>

<div class="comMenu_container">
        <h1 class="company_menu_title">업체 메뉴 등록</h1>
        <div class="submit_container">
            <button type="submit" class="btn" id="submit_menu">메뉴등록</button>
            <!-- + 버튼 -->
            <i class="fas fa-plus-circle btnAdd"></i>
        </div>
        
        <form action="addMenu.do" method="post">
            <div class="addInput">
                <div>
                    <input type='hidden' name="company_no" value="${company_no }"/><br/>
                    상품 이름 <input type='text' class="input_menu" name='company_product' required="required"/><br/>
                    상품 가격  <input type="number" class="input_menu" name="company_money" required="required"/>
                </div>
            </div>

        </form>
    </div>
    <script type="text/javascript">
    $(document).ready(function() {
    	$('.btnAdd').click(function() {
    		$('.addInput').append(
    			`<div>
                        <input type='hidden' name="company_no" value="${company_no }"/><br/>
                        상품 이름 <input type='text' class="input_menu" name='company_product' required="required"/><br/>
                        상품 가격  <input type="number" class="input_menu" name="company_money" required="required"/>
                        </div>
                        <div class="btnRemove"><button class="btn">삭제</button></div>
                        `
    		);
    		$('.btnRemove').on('click', function() {
    			$(this).prev().remove(); //.prev() : 선택한 요소의 바로 이전 위치한 형제요소
    			$(this).next().remove(); //.next() : 선택한 요소의 바로 다음에 위치한 형제요소
    			$(this).remove(); //선택한 요소 지우기
    		});
    	});
    });
    </script>

</body>
</html>