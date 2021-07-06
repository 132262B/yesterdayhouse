<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>인테리어 특가 쇼핑 | 어제의 집</title>

<link rel="icon" href="${root}/assets/images/Yesterday_house_icon.png" />
<link rel="stylesheet" href="${root}/assets/css/user/register.css" />

<!-- GoogleFont -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;500;700;900&display=swap" rel="stylesheet">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 스크립트 -->
<script src="${root}/assets/js/user/register.js"></script>

</head>
<body>
	<!-- Modal -->

	<div class="modal" tabindex="-1" id="exampleModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header"></div>
				<div class="modal-body">
					<img src="${root}/assets/images/register/img_welcome_tpa.png">
					<p>회원가입을 축하합니다.</p>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<section class="form-signin">
		<h4>회원가입</h4>
		<hr>
		<!-- 타 서비스 로그인 아이콘 -->
		<div class="platform_login text-center">
			<p class="font-small">SNS를 이용하여 간편 회원가입</p>
			<span> <a href="#"> <svg width="48" height="48" viewBox="0 0 48 48" preserveAspectRatio="xMidYMid meet"> <g fill="none" fill-rule="evenodd"> <path fill="#3B5998"d="M0 24C0 10.745 10.745 0 24 0s24 10.745 24 24-10.745 24-24 24S0 37.255 0 24z"></path><path fill="#FFF"d="M25.77 35V24h3.384v-3.385h-3.385v-2.538c-.012-.756.08-1.285 1.693-1.692h1.692V13h-3.385c-3.25 0-4.52 1.84-4.23 5.077v2.538H19V24h2.538v11h4.231z"></path></g></svg></a></span>
			<span> <a href="#"> <svg width="48" height="48"viewBox="0 0 48 48" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><path fill="#FFEB00"d="M0 24C0 10.745 10.745 0 24 0s24 10.745 24 24-10.745 24-24 24S0 37.255 0 24z"></path><path fill="#3C2929"d="M24 11.277c8.284 0 15 5.306 15 11.85 0 6.545-6.716 11.85-15 11.85-.92 0-1.822-.066-2.697-.191l-6.081 4.105a.43.43 0 0 1-.674-.476l1.414-5.282C11.777 31.031 9 27.335 9 23.127c0-6.544 6.716-11.85 15-11.85zm6.22 8.407c-.416 0-.718.297-.718.707v5.939c0 .41.289.686.718.686.41 0 .718-.295.718-.686v-1.932l.515-.526 1.885 2.57c.277.374.426.54.691.568.037.003.075.005.112.005.154 0 .66-.04.716-.563.038-.293-.137-.52-.348-.796l-2.043-2.675 1.727-1.743.176-.196c.234-.26.353-.39.353-.587.009-.422-.34-.652-.687-.661-.274 0-.457.15-.57.262l-2.528 2.634v-2.3c0-.422-.288-.706-.717-.706zm-9.364 0c-.56 0-.918.432-1.067.837l-2.083 5.517a.84.84 0 0 0-.065.315c0 .372.31.663.706.663.359 0 .578-.162.69-.51l.321-.97h2.999l.313.982c.111.335.34.498.7.498.367 0 .655-.273.655-.62 0-.056-.017-.196-.081-.369l-2.019-5.508c-.187-.53-.577-.835-1.069-.835zm-2.92.064h-4.452c-.417 0-.642.337-.642.654 0 .3.168.652.642.652h1.51v5.21c0 .464.274.752.716.752.443 0 .718-.288.718-.751v-5.21h1.508c.474 0 .643-.352.643-.653 0-.317-.225-.654-.643-.654zm7.554-.064c-.442 0-.717.287-.717.75v5.707c0 .497.28.794.75.794h2.674c.434 0 .677-.321.686-.627a.642.642 0 0 0-.17-.479c-.122-.13-.3-.2-.516-.2h-1.99v-5.195c0-.463-.274-.75-.717-.75zm-4.628 1.306l.008.01 1.083 3.265h-2.192L20.842 21a.015.015 0 0 1 .028 0z"></path></g></svg></a></span>
			<span> <a href="#"> <svg width="48" height="48"viewBox="0 0 48 48" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><path fill="#00C63B"d="M0 24C0 10.745 10.745 0 24 0s24 10.745 24 24-10.745 24-24 24S0 37.255 0 24z"></path><path fill="#FFF"d="M21 25.231V34h-7V15h7l6 8.769V15h7v19h-7l-6-8.769z"></path></g></svg></a></span>
			<hr>
		</div>

			<!-- 이메일처리 -->
			<div class="row input_bottom">
				<label for="emailfirst" class="form-label">이메일</label>
				<div class="col-6">
					<input type="text" class="form-control" id="emailfirst" name="emailfirst">
				</div>
				@
				<div class="col-5">
					<select class="form-select" id="emaillast" name="emaillast" onchange="emaillastc()">
						<!-- <option selected disabled value="null">선택하세요.</option> -->
						<option selected value="naver.com">naver.com</option>
						<option value="google.com">google.com</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
						<option value="hanmail.net">hanmail.net</option>
					</select>
				</div>
				<div id="emailCheck" class="registerCheck"></div>
			</div>
			<!-- 이매일 끝 -->

			<!-- 패스워드 -->
			<div class="col-12 input_bottom">
				<label for="pass" class="form-label">비밀번호</label>
				<p class="font-small">비밀번호는 최소 8자 이상 입력해주세요.</p>
				<input type="password" class="form-control" id="pass" name="pass">
			</div>
			<div class="col-12 input_bottom">
				<label for="passCheck" class="form-label">비밀번호확인</label> 
				<input type="password" class="form-control" id="passCheck"name="passCheck">
				<div id="passwordCheck" class="registerCheck"></div>
			</div>
			<!-- 패스워드 끝 -->

			<!-- 이름 -->
			<div class="col-12 input_bottom">
				<label for="name" class="form-label">이름</label>
				<input type="text" class="form-control" id="name" name="name">
				<div id="nameCheck" class="registerCheck"></div>
			</div>
			<!-- 이름 끝 -->

			<!-- 휴대폰 번호 -->
			<div class="col-12 input_bottom">
				<label for="phone" class="form-label">휴대폰</label> 
				<input type="text" class="form-control" id="phone" name="phone" maxlength="11">
				<div id="phoneCheck" class="registerCheck"></div>
			</div>
			<!-- 휴대폰 번호 끝 -->

			<!-- 약관동의 -->
			<div class="list-group input_bottom">
				<h6>약관 동의</h6>
				<label class="list-group-item"> 
					<input class="form-check-input me-1" type="checkbox" id="checkAgree1"> 만 14세 이상 동의 (필수)
				</label> 
				
				<label class="list-group-item">
					<input class="form-check-input me-1" type="checkbox" id="checkAgree2"> 이용약관 (필수)
				</label> 
				
				<label class="list-group-item">
					<input class="form-check-input me-1" type="checkbox" id="checkAgree3"> 개인정보수집 및 이용동의 (필수)
				</label>
				
				<label class="list-group-item">
					<input class="form-check-input me-2" type="checkbox" name="SMSagree" value="SMS"> 이벤트,프로모션, 알림 메일 및 SMS수신 (선택)
				</label>
			</div>
			<br>
			<button class="w-100 btn-lg C335F0" type="button" onclick="registerSubmit()">회원가입</button>

		<p class="mt-5 mb-2 text-muted Reserved-size text-center">어제의 집,Co., Ltd..All Rights Reserved</p>
	</section>
</body>
</html>