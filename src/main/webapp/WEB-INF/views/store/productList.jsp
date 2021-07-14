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
<link rel="stylesheet" href="${root}/assets/css/store/productList.css" />

<!-- GoogleFont -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;500;700;900&display=swap" rel="stylesheet">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

</head>
<body class="d-flex flex-column h-100">
	<c:import url="/header"></c:import>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="row">
					<c:choose>
						<c:when test="${productList eq '[]'}">
							<div class="card text-center mb-4 mt-4">
								<div class="card-body">
									<br><br><br><br><br><br><br>
									<h3 class="secondary">등록된 상품이 없습니다!</h3>
									<p>추후 상품을 추가할 예정입니다!</p>
									<br><br><br><br><br><br><br>
								</div>
							</div>
						</c:when>

						<c:when test="${!(productList eq null)}">
							<c:forEach var="list" items="${productList}">
								<div class="col-6 col-lg-4 col-xxl-3 mb-4">
									<div class="card productListInfo">
										<div class=cardImg>
											<img src="${list.thumbnail}" class="card-img-top" alt="${list.name}">
										</div>
										<div class="card-body">
											<p class="card-text mb-1">
												${fn:substring(list.name,0,24)}...</p>
											<p class="card-text mb-1">
												₩
												<fmt:formatNumber value="${list.price}" pattern="#,###" />
											</p>
											<a href="${root}/store/product?pdt=${list.id}" class="stretched-link"></a>
											<c:if test="${list.freeDelivery eq 'Y'}">
												<span class="badge rounded-pill bg-secondary">무료배송</span>
											</c:if>
											<c:if test="${list.freeDelivery eq 'N'}">&nbsp;</c:if>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>

						<c:otherwise>
							<div class="text-center">
								<h3>죄송합니다, 페이지 처리도중 오류가 발생하였습니다.</h3>
								<p>고객센터로 문의하시기 바랍니다.</p>
							</div>
						</c:otherwise>
					</c:choose>					
				</div>
			</div>
		</div>
	</div>
	
	<c:import url="/footer"></c:import>
</body>
</html>