<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko" class="h-100">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>인테리어 특가 쇼핑 | 어제의 집</title>

<link rel="icon" href="${root}/assets/images/Yesterday_house_icon.png" />
<link rel="stylesheet" href="${root}/assets/css/store/order.css" />

<!-- GoogleFont -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;500;700;900&display=swap" rel="stylesheet">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

</head>
<body class="d-flex flex-column h-100">
	<c:import url="/header"></c:import>
	
	<div class="mt-4"></div>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-7">
						<div class="card">
							<div class="card-body">
								<h2 class="card-title">주문/결제</h2>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</div>

					<div class="col-5">
						<div class="card">
							<div class="card-body">
								<h2 class="card-title">결제금액</h2>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<c:import url="/footer"></c:import>
</body>
</html>