/**
 * 
 */
 	 // 엔터키가 눌렸을 때 
 	function loginEnterKey() { 
		if (window.event.keyCode == 13) {
			loginCheck();
		} 
	}

	
	// 로그인 이메일,비밀번호에 내용이 있나 없나, 검색
	 function loginCheck(){
		
		
		const email = $("#email").val();
	    const pass = $("#pass").val();

		if(email == "" || email == null) {
			$('#email').addClass('is-invalid');
			$('#email').removeClass('is-valid');
		} else if(pass == "" || pass == null) {
			$('#pass').addClass('is-invalid');
			$('#pass').removeClass('is-valid');
		} else {
			$('#email').removeClass('is-invalid');
			$('#pass').removeClass('is-invalid');
			loginajax();
		}
	}


	// ajax 로 계정 유/무 여부체크
	function loginajax(){
		
		var login_alert =document.getElementById('login_alert');
        var real_login_alert = new bootstrap.Toast(login_alert);
		
	    let email = $("#email").val();
	    let pass = $("#pass").val();
	    let sendData = {"email":email,"password":pass};
	    
		$.ajax({
			type:'post',
			url: '/user/loginCheck',
			data: sendData,
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
				console.log('error');
			}
		})
	}
