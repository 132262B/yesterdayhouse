/**
 * 
 */
	
	let emailcc = false;
	let password = false;
	let userName = false;
	let phoneNum = false;
	
	// 이메일 입력부분이 변경됬을떄
	$(function(){
		$("#emailfirst").on('blur',emailcheck);
	})
	
	// 도메인 부분이 변경됬을때
	function emaillastc() {
		emailcheck();
	}
	
	// ajax 로 이메일 체크
	function emailcheck(){
	    let emailfirst = $("#emailfirst").val();
	    let emaillast = $("#emaillast").val();
	    
	    let email = emailfirst+'@'+emaillast
	    const sendData = {"email":email};
	    
	    if(emailfirst == "" || emailfirst == null) {
			$('#emailCheck').text('아이디를 입력해주세요.')
			$('#emailfirst').addClass('is-invalid');
			$('#emaillast').addClass('is-invalid');
			email = false;
			return;
		} else if(emailfirst.length < 6 || emailfirst.length > 30) {
			$('#emailCheck').text('아이디가 너무 짧습니다.')
			$('#emailfirst').addClass('is-invalid');
			$('#emaillast').addClass('is-invalid');
			email = false;
			return;
		} else {
			
			$.ajax({
				type: 'post',
				async: false, //false가 기본값임 - 비동기
				url: '/user/emailCheck',
				data: sendData,
				success: function(data) {
					if (data === 'true') {
						$('#emailCheck').text('사용가능한 아이디입니다.');
						$('#emailfirst').addClass('is-valid');
						$('#emailfirst').removeClass('is-invalid');
						$('#emaillast').addClass('is-valid');
						$('#emaillast').removeClass('is-invalid');
						emailcc = true;
					} else if (data === 'false') {
						$('#emailCheck').text('이미 존재하는 아이디입니다.');
						$('#emailfirst').addClass('is-invalid');
						$('#emaillast').addClass('is-invalid');
					}
				},
				error: function(data) {
					console.log('error');
				}
			})
		return;
	}
}

	/*----패스워드----*/
	$(function(){
		$("#passCheck").on('blur',passwordCheck);
	})
	
	$(function(){
		$("#pass").on('blur',passwordCheck);
	})
	
	function passwordCheck(){
		
	    const pass = $("#pass").val();
	    const passCheck = $("#passCheck").val();

		let num = pass.search(/[0-9]/g);
		let eng = pass.search(/[a-z]/ig);
		let spe = pass.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			    
		if(pass == "" || pass == null  || passCheck == "" || passCheck == null) {
			$('#passwordCheck').text('비밀번호를 입력해주세요.')
			$('#pass').addClass('is-invalid');
			$('#passCheck').addClass('is-invalid');
			$('#pass').removeClass('is-valid');
			$('#passCheck').removeClass('is-valid');
		} else if(pass.length < 8 || pass.length > 30) {
			$('#passwordCheck').text('비밀번호는 8자이상 30자 이하로 입력해주세요.')
			$('#pass').addClass('is-invalid');
			$('#passCheck').addClass('is-invalid');
			$('#pass').removeClass('is-valid');
			$('#passCheck').removeClass('is-valid');
		} else if(num < 0 || eng < 0 || spe < 0 ){
 			$('#passwordCheck').text('영문,숫자,특수문자를 혼합하여 입력하세요.')
			$('#pass').addClass('is-invalid');
			$('#passCheck').addClass('is-invalid');
			$('#pass').removeClass('is-valid');
			$('#passCheck').removeClass('is-valid');
		} else if(pass == passCheck) {
			$('#passwordCheck').text('')		
			$('#pass').addClass('is-valid');
			$('#pass').removeClass('is-invalid');
			$('#passCheck').addClass('is-valid');
			$('#passCheck').removeClass('is-invalid');
			password = true;
		} else {
			$('#passwordCheck').text('비밀번호가 일치하지 않습니다.')
			$('#pass').addClass('is-invalid');
			$('#passCheck').addClass('is-invalid');
			$('#pass').removeClass('is-valid');
			$('#passCheck').removeClass('is-valid');
			}
		}
	
		// 이름 체크
		$(function(){
		$("#name").on('blur',nameCheck);
		})
		
		function nameCheck(){
			const name = $("#name").val();
			
			if(name != "" && name != null) {
				
				if(name.length != 1) {
					$('#nameCheck').text('')		
					$('#name').addClass('is-valid');
					$('#name').removeClass('is-invalid');
					userName = true;
				} else {
					$('#nameCheck').text('이름이 너무 짧습니다.')
					$('#name').addClass('is-invalid');
				}
				
			} else{
				$('#nameCheck').text('이름을 입력해주세요.')
				$('#name').addClass('is-invalid');
			}
		}
		
		
		// 후대폰 번호 체크
		$(function(){
		$("#phone").on('blur',phoneCheck);
		})
		
		function phoneCheck(){
			const phone = $("#phone").val();
			
			if(phone != "" && phone != null) {
				if(phone.length == 11) {
					if(!isNaN(phone)) {
						$('#phoneCheck').text('')		
						$('#phone').addClass('is-valid');
						$('#phone').removeClass('is-invalid');
						phoneNum = true;
					} else {
						$('#phoneCheck').text('숫자로만 적어주세요.')
						$('#phone').addClass('is-invalid');
					}
					
				} else {
					$('#phoneCheck').text('휴대폰 번호가 너무 길거나, 짧습니다.')
					$('#phone').addClass('is-invalid');
				}
				
			} else{
				$('#phoneCheck').text('번호를 입력해주세요.')
				$('#phone').addClass('is-invalid');
			}
		}
		
		
		
		// 서브밋 버튼 눌렀을떄 전부 체크해서 전송
		function registerSubmit() {
			
			let c1 = false;
			let c2 = false;
			let c3 = false;
			let d1 = false;
			let d2 = false;
			let d3 = false;
			let d4 = false;
			
			let myModal = new bootstrap.Modal(document.getElementById('exampleModal'))
			
			if(phoneNum == false) {
				$("#phone").focus();
			} else {
				d4 = true;
			}
			
			if(userName == false) {
				$("#name").focus();
			} else {
				d3 = true;
			}
			
			if(password == false) {
				$("#pass").focus();
			} else {
				d2 = true;
			}
			
			if(emailcc == false) {
				$("#emailfirst").focus();
			} else {
				d1 = true;
			}
			
			if($('#checkAgree1').is(":checked") == true){
			    $('#checkAgree1').addClass('is-valid');
				$('#checkAgree1').removeClass('is-invalid');
				c1 = true;
			}
			
			if($('#checkAgree1').is(":checked") == false) {
				$('#checkAgree1').addClass('is-invalid');
			}
			
			if($('#checkAgree2').is(":checked") == true){
			    $('#checkAgree2').addClass('is-valid');
				$('#checkAgree2').removeClass('is-invalid');
				c2 = true;
			}
			
			if($('#checkAgree2').is(":checked") == false) {
				$('#checkAgree2').addClass('is-invalid');
			}
			
			if($('#checkAgree3').is(":checked") == true){
			    $('#checkAgree3').addClass('is-valid');
				$('#checkAgree3').removeClass('is-invalid');
				c3 = true;
			} 
			
			if($('#checkAgree3').is(":checked") == false) {
				$('#checkAgree3').addClass('is-invalid');
			}

			if(c1 && c2 && c3 && d1 && d2 && d3 && d4) {
				
				let emailfirst = $("#emailfirst").val();
			    let emaillast = $("#emaillast").val();
			    let email = emailfirst+'@'+emaillast;
			    let password = $("#pass").val();
			    let userName = $("#name").val();
			    let phone = $("#phone").val();
			    let SMSagree = $("#SMSagree").val();
			    
			    const sendData = {"email":email,"password":password,"userName":userName,"phone":phone,"SMSagree":SMSagree};
					
				$.ajax({
					type: 'post',
					async: false,
					url: '/user/registerCheck',
					data: sendData,
					success: function(data) {
						if (data === 'true') {
							myModal.show();
							setTimeout(function() {
								location.href='/home'
							}, 1500);
						} else if (data === 'false') {
							
						}
					},
					error: function(data) {
						console.log('error');
					}
				})


			}
			
		}
