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
<link rel="stylesheet" href="resources/css/company_detail.css" />
<script type="text/javascript" src="resources/js/company_detail.js" defer></script>
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
                <h2>${dto.company_name }</h2>
                <p>${dto.company_addr }</p>
                <p>${dto.company_sort }</p>
                <p>${dto.company_tel }</p>
                <input type="hidden" class="company_no" value="${dto.company_no }"/>
            </div>
        </div>

        <div class="company_right">
            <div class="company__right_map">
                <div class="company__right_mapBox">
                    맵이 들어갈자리
                </div>
            </div>
            <div class="company__right_wish">
                <button class="company__right_wish_btn">
                    즐겨찾기
                </button>
            </div>
        </div>
    </section>

    <!-- 숙소설명, 리뷰, 1:1챗 -->
    <section id="tabsection">
        <div class="tabsection__main">
            <input type="radio" id="tab-1" name="show" checked/>
            <input type="radio" id="tab-2" name="show" />
            <input type="radio" id="tab-3" name="show" />
            <div class="tab">
              <label for="tab-1">숙소 정보</label>
              <label for="tab-2">리뷰</label>
              <label for="tab-3">1:1 채팅</label>
            </div>
            <div class="content">
              <div class="content-dis">
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
              <div class="content-dis">
                Color의 body안 내용을 넣으세요.
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
              <div class="content-dis">
                Textile의 body안 내용을 넣으세요.
              </div>
            </div>
        </div>
    </section>
<%@ include file="footer.jsp" %>

</body>
</html>