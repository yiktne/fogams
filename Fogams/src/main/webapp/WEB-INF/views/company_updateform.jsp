<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 상세</title>
 <%--    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" 
rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/resources/css/company_detail.css'/>"/>
    <link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/upload.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script> --%>
<link rel="stylesheet" href="resources/css/company_detail.css?ver=10" />
<script type="text/javascript" src="resources/js/company_detail.js?" defer></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="http://localhost:5000/socket.io/socket.io.js"></script>
<!-- 카카오맵 -->
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=3a1eab4890ae0b2c4a4c97691189904b&libraries=services"></script>


</head>
<body>
	<%@ include file="header.jsp" %>
	
  <%--  <form action="company_updateres.do" method="post">
	<input type="hidden" name="company_no" value="${dto.company_no }">
	<input type="hidden" name="member_no" value="${dto.member_no }">
    <!-- 숙소 이미지, 맵, 등 첫번째 섹션 -->
    <section id="company">
        <div class="company__left">
            <div class="company__left_imgBox">
                <img src="${pageContext.request.contextPath}/img.do?img=${dto.company_img}" alt="${dto.company_img }" class="company__left_img">
            </div>
            <div class="company__left_description">
                <h2><input type="text" name="company_name" value="${dto.company_name }"></h2>
                <p><input type="text" name="company_addr" value="${dto.company_addr }"></p>
                <p>${dto.company_sort }</p>
                <p><input type="text" name="company_tel" value="${dto.company_tel }"></p>
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
                <textarea rows="10" cols="60" name="company_content">${dto.company_content }</textarea>
				<table>
					<tr>
						<td align="right">
							<input type="submit" value="수정"/>
							<input type="button" value="취소" onclick="">
						</td>
					</tr>
				</table>
              </div>
              
              <div class="content-dis">
                Textile의 body안 내용을 넣으세요.
              </div>
            </div>
        </div>
    </section>
    </form> --%>
    
    <!-- 다시 -->
     <form action="company_updateres.do" method="post">
	<input type="hidden" name="company_no" value="${dto.company_no }">
	<input type="hidden" name="member_no" value="${dto.member_no }">
     <section id="company">
        <div class="company__left">
            <div class="company__left_imgBox">
                <img src="${pageContext.request.contextPath}/img.do?img=${dto.company_img}" alt="${dto.company_img }" class="company__left_img">
            </div>
            <div class="company__left_description">
                <h2><input type="text" name="company_name" value="${dto.company_name }"></h2>
                <p><input type="text" name="company_addr" value="${dto.company_addr }"></p>
                <p>${dto.company_sort }</p>
                <p><input type="text" name="company_tel" value="${dto.company_tel }"></p>
            </div>
            
        </div>

		<!-- 맵 -->
        <div class="company_right">
			<div id="map" style="width:100%;height:100%;"></div>
        </div>
    </section>

    <!-- 숙소설명, 리뷰, 1:1챗 -->
    <section id="tabsection">
        <div class="tabsection__main">
            
            <!-- 버튼영역 -->
            <div class="function_filter">
                <button class="tab_btn selected" data-filter="com_info">업체정보</button>
                <button class="tab_btn" data-filter="price_info">가격정보</button>
                <button class="tab_btn" data-filter="review">리뷰</button>
                <button class="tab_btn" data-filter="chat" onclick="openPop();">채팅</button>
            </div>

              <div class="content-dis">
                <textarea rows="10" cols="60" name="company_content">${dto.company_content }</textarea>
				<table>
					<tr>
						<td align="right">
							<input type="submit" value="수정"/>
							<input type="button" value="취소" onclick="">
						</td>
					</tr>
				</table>
              </div>
              
              
              <div class="content-dis invisible" data-type="price_info">
                <c:choose>
                	<c:when test="${empty list }"> 등록된 메뉴가 없습니다. </c:when>
                
                <c:otherwise>
                	<c:forEach items="${list }" var="dto">
                		<b>${dto.company_product } : ${dto.company_money } 원<br/></b> 
                	</c:forEach>
                </c:otherwise>
                </c:choose>
              </div>
    
              
              <div class="content-dis invisible" data-type="review">
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
    (function() { 
    var d = document, s = d.createElement('script');
 	   s.src = 'https://fogams.disqus.com/embed.js';
   		 s.setAttribute('data-timestamp', +new Date());
   		 (d.head || d.body).appendChild(s);
  	  })();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
               	
                
                
              </div>
              <div class="content-dis invisible" data-type="chat">
                              <!-- 채팅 -->
               	<a href="#none" target="_blank" onclick="openPop()">채팅</a>
              </div>
        </div>
    </section>
    </form>
<%@ include file="footer.jsp" %>

</body>
</html>