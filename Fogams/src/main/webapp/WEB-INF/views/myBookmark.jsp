<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Bookmark</title>

<link rel="stylesheet"
	href="<c:url value='/resources/css/company_detail.css'/>" />
<!-- CSS 링크 넣기 -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/myBookmark.css'/>" />
<!-- 구글폰트 링크넣기-->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
	rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">


function moveCompany(){
	var company_no = $(".company_no").val();
	console.log(company_no);
	location.href="company_detail.do?company_no="+company_no;
}


$(function(){
    $('.btns__delete').click(function(){
    	var bookmark_no = $(this).val();
    	var data = {"bookmark_no" : bookmark_no};
       $.ajax({
    	   type: "post",
    	   url: "bookmarkDelete.do",
    	   data: JSON.stringify(data),
    	   contentType: "application/json",
    	   dataType: "json",
    	   success: function(data){
    		   
    		   if(data == 0){
    			   alert("북마크 삭제 실패");
    		   }
    		   
    		   if(data == 1){
    			   alert("북마크가 삭제되었습니다.");
    			   location.reload();
    		   }
 
    	   },
    	   error : function(){
    		   alert("통신실패");
    	   }
       });
    	  
    });
});



</script>
</head>
<body>
<body>
<%@ include file="header.jsp"%>
	<section class="Bookmark">
		<h1 class="page_title">즐겨찾기 한 장소</h1>

		<c:choose>
			<c:when test="${empty list }">
				<h2>아직 등록된 북마크가 없습니다.</h2>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
				<input type="hidden" class="company_no" value="${dto.company_no }">
					<div class="Bookmark__box">
						<div class="Bookmark__dis">
							<div class="dis__img_Container">
								<img src="${pageContext.request.contextPath}/img.do?img=${dto.company_img}" style="cursor:pointer;" class="dis__sortImg" onclick="moveCompany();"/>
							</div>
							<div class="dis__text">
								<h2 class="dis__title" style="cursor:pointer;" onclick="moveCompany();">${dto.bookmark_no } ${dto.company_name }</h2>
								<span>${dto.company_sort }</span> <span>${dto.company_tel }</span> <span>${dto.company_addr }</span>
							</div>
						</div>
						<div class="Bookmark__btns">
							<!-- ajax로 컨트롤러요청하기 -->
							<button class="btns__detail btn" onclick="moveCompany();">보기</button>
							<button class="btns__delete btn bookmark_no" value="${dto.bookmark_no }">삭제</button>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</section>
<%@ include file="footer.jsp" %>
</body>


</html>