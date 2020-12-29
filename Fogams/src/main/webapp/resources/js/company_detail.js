$(function(){
	    $('.company__right_wish_btn').click(function(){
	       var company_no = $(".company_no").val();
	       var data = {"company_no" : company_no};	 
	       var company_name = $(".company__left_description > h2").text().trim();
	       console.log(company_name);
	       $.ajax({
	    	   type: "post",
	    	   url: "bookmark.do",
	    	   data: JSON.stringify(data),
	    	   contentType: "application/json",
	    	   dataType: "json",
	    	   success: function(data){
	    		   
	    		   if(data == 0){
	    			   alert("''" + company_name + "''" + " 가 내 북마크에 추가되었습니다.");
	    		   }
	    		   
	    		   if(data == 1){
	    			   alert("이미 북마크에 추가되었습니다.");
	    		   }
	    		   
	    		   if(data == 2){
	    			   alert("로그인이 필요합니다.");
	    		   }
	    	   },
	    	   error : function(){
	    		   alert("통신실패");
	    	   }
	       });
	    	  
	    });
	});
