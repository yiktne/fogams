$(function() {
	$('#submit_menu').click(function() {
		var company_array = [];
		$('input[name=company_no]').each(function(index, item) {
			var company_no = $(this).val();
			var company_product = $('input[name=company_product]').eq(index).val();
			var company_money = $('input[name=company_money]').eq(index).val();
			
			var obj = {};
			obj['company_no'] = company_no;
			obj['company_product'] = company_product;
			obj['company_money'] = company_money;
			
			company_array.push(obj);
			});	

		$.ajax({
			type: "post",
			url: "addCompany_menu.do",
			data: JSON.stringify(company_array),
			contentType: "application/json",
			dataType: "json",
			success: function(data) {

				if (data == 0) {
					alert("업체정보 등록 성공");
					location.href='index.jsp';
				}else{
					alert("실패");
				}
			},
			error: function() {
				alert("통신실패");
			}
		});

	});
});

