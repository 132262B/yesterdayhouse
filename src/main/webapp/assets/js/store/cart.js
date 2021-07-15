/**
 * 
 */
 
 function addCart(){
		
	    let id = $("#productID").val();
	    let qty = $("#qty").val();
	    let data = {"id":id,"qty":qty};
	    
		$.ajax({
			type:'post',
			async:false, //false가 기본값임 - 비동기
			url: '/cart/addcart',
			data: data,
			success: function(data) {
				if(data == 'false') {
					real_login_alert.show(); // 비밀번호 틀리다는 알림창 생성
					setTimeout(function() { // 딜레이 1.3초 이후에 없어짐
						real_login_alert.hide();
					}, 1300);
				} else if(data === 'true') {
					location.href='/home'
				}
			},
			error:function (data) {
				alert('문제가 발생하였습니다, 관리자에게 문의하시기 바랍니다.');
			}
		})
	}
