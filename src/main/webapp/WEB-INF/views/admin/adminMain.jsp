<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1">
<title>인테리어 특가 쇼핑 | 어제의 집</title>

<link rel="icon" href="${root}/assets/images/Yesterday_house_icon.png" />
<link rel="stylesheet" href="${root}/assets/css/admin/main.css" />

<!-- GoogleFont -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;500;700;900&display=swap" rel="stylesheet">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script defer src="${root}/assets/js/admin/main.js"></script>

</head>

<body>
	<input type="checkbox" id="sidebar-toggle">
	<div class="sidebar">
		<div class="sidebar-header">
			<h3 class="brand">
			</h3>
			<!-- 메뉴바 버튼 -->
			<label for="sidebar-toggle"> 
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16"> <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" /></svg>
			</label>
		</div>

		<div class="sidebar-menu">
			<ul class="list-unstyled ps-0">
				<li class="mb-1">
					<p class="align-items-center rounded collapsed" onclick="location.href=('/home')">HOME</p>
				</li>
			
				<li class="mb-1">
					<p class="align-items-center rounded collapsed" id="customerList" data-bs-toggle="collapse" data-bs-target="#client-collapse" aria-expanded="false">고객관리</p>
				</li>

				<li class="mb-1">
					<p class=" align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#product-collapse" aria-expanded="false">상품관리</p>
					<div class="collapse" id="product-collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li id="addProduct" class="rounded menu-style-event">상품등록</li>
							<li class="rounded menu-style-event">상품목록</li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>


	<!-- 메뉴바 -->
	<div class="main-content">
		<header>
			<div class="social-icons">
				<div></div>
			</div>
		</header>

		<main>
			<section class="recent">
				<div class="ajax" id="content"></div>
			</section>
		</main>
	</div>

</body>
</html>