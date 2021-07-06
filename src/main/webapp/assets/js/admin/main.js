/**
 * 
 */
	// 제품등록
	$("#addProduct").click(function() {
		$.ajax({
			type: "get",
			url: "/admin/addProduct",
			dataType: "html",
			error: function() {
				alert("문제가 발생하였습니다, 관리자에게 문의하세요.");
			},
			success: function(content) {
				$("#content").html(content);
			}
	
		});
	});
	
	// 제품
	$("#customerList").click(function() {
		$.ajax({
			type: "get",
			url: "/admin/customerList",
			dataType: "html",
			error: function() {
				alert("문제가 발생하였습니다, 관리자에게 문의하세요.");
			},
			success: function(content) {
				$("#content").html(content);
			}
	
		});
	});
	
