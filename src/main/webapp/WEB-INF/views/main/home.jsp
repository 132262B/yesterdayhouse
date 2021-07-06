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
<link rel="stylesheet" href="${root}/assets/css/common/home_style.css" />

<!-- GoogleFont -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;500;700;900&display=swap" rel="stylesheet">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

</head>
<body>

	<c:import url="/header"></c:import>
	
	<!-- section -->

	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/store/banners/store_home_banners/162243662554401221.jpg?gif=1&w=2560&q=100" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/store/banners/store_home_banners/162219370940295239.jpg?gif=1&w=2560&q=100" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/store/banners/store_home_banners/161365325570472043.jpg?gif=1&w=2560&q=100" class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-6 col-lg-4 col-xxl-3">
				<div class="card">
					<img src="http://via.placeholder.com/300x250" class="card-img-top"
						alt="...">
					<div class="card-body">
						<p class="card-text">상품명입니다</p>
						<p>가격</p>
						<span class="badge rounded-pill bg-secondary">무료배송</span>
					</div>
				</div>
			</div>

			<div class="col-6 col-lg-4 col-xxl-3">
				<div class="card">
					<img src="http://via.placeholder.com/300x250" class="card-img-top"
						alt="...">
					<div class="card-body">
						<p class="card-text">상품명입니다</p>
						<p>상품명입니다</p>
					</div>
				</div>
			</div>

			<div class="col-6 col-lg-4 col-xxl-3">
				<div class="card">
					<img src="http://via.placeholder.com/300x250" class="card-img-top"
						alt="...">
					<div class="card-body">
						<p class="card-text">상품명입니다</p>
						<p>상품명입니다</p>
					</div>
				</div>
			</div>

			<div class="col-6 col-lg-4 col-xxl-3">
				<div class="card">
					<img src="http://via.placeholder.com/300x250" class="card-img-top"
						alt="...">
					<div class="card-body">
						<p class="card-text">상품명입니다</p>
						<p>상품명입니다</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<br>

	<c:import url="/footer"></c:import>

</body>
</html>