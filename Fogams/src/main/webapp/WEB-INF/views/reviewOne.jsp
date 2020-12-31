<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value='/resources/css/review.css'/>"/>
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $(document).ready(function() {
	  jQuery( ".tabs" ).tabs();
	  jQuery( ".subtabs" ).tabs();
	  
	  openParentTab();
	});



	function openParentTab() {
		locationHash = location.hash.substring( 1 );
		console.log(locationHash);
		// Check if we have an location Hash
		if (locationHash) {
			// Check if the location hash exsist.
			var hash = jQuery('#'+locationHash);
			if (hash.length) {
				// Check of the location Hash is inside a tab.
				if (hash.closest(".tabContent").length) {
					// Grab the index number of the parent tab so we can activate it
					var tabNumber = hash.closest(".tabContent").index();
					jQuery(".tabs.fix").tabs({ active: tabNumber });
					// Not need but this puts the focus on the selected hash
					hash.get(0).scrollIntoView();
					setTimeout(function() {
						hash.get(0).scrollIntoView();
					}, 1000);
				}
			}
		}
	}
  
  </script>


</head>
<body>
	<%@ include file="header.jsp" %>
	

<div class="tabs fix">
      <ul>
        <li>
          <a href="#tabs-1">Tab 1</a>
        </li>
        <li>
          <a href="#tabs-2">Tab 2</a>
        </li>
        <li>
          <a href="#tabs-3">Tab 3</a>
        </li>
      </ul>
      <div class="tabContainer">
        <div id="tabs-1" class="tabContent">
          <p>Some content 1.</p>
        </div>
        <div id="tabs-2" class="tabContent">
          <div class="subtabs">
            <ul>
              <li><a href="#subtab1">Subtab1</a></li>
              <li><a href="#subtab2">Subtab2</a></li>
            </ul>
            <div id="subtab1" class="subtabContent">
             Some sub content1 
            </div>
            <div id="subtab2" class="subtabContent">
             Some sub content2
            </div>
          </div>
        </div>
        <div id="tabs-3" class="tabContent">
          <p>Some content 3</p>
        </div>
      </div>
    </div>




<form action="image.do" method="post" enctype="multipart/form-data">
	<input type="file" multiple="multiple" name="file">
	<input type="text" name="src">
	<input type="submit" value="전송">
</form>

 
	
</body>
</html>