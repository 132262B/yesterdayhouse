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
<link rel="stylesheet" href="${root}/assets/css/store/cart.css" />

<!-- GoogleFont -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;500;700;900&display=swap" rel="stylesheet">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

</head>
<body class="d-flex flex-column h-100">
	<c:import url="/header"></c:import>
	
	<div class="mt-4 bg-light">

		<div class="container">
			<div class="row">
				<c:if test="${cartList eq '[]'}">
					<div class="gongback"></div>
					<div class="mt-4 mb-4">
						<div class="d-flex justify-content-center">
							<img alt="제품이 없습니다." src="${root}/assets/images/product/nocart.png">
						</div>
						<div class="d-flex justify-content-center mt-4">
							<a href="/home">
								<button type="button" class="btn btn-lg btn-info text-white">제품 담으로 가기</button>
							</a>
						</div>
					</div>
					<div class="gongback"></div>
				</c:if>
				<c:if test="${!(cartList eq '[]')}">
					<div class="col-12 mt-4">
						<div class="row">
							<div class="col-7">
								<div class="card">
									<div class="card-body">
										<h2 class="card-title mb-4">주문/결제</h2>
										<!-- 반복문 시작 -->
										<c:forEach var="cart" items="${cartList}">
											<div class="card mb-2">
												<div class="card-body">
													<div class="d-flex bd-highlight">
														<div class="p-2 bd-highlight">
															<img src="${cart.thumbnail}" class="cartImgReSize" alt="${cart.name}">
														</div>
														<div class="p-2 bd-highlight flex-grow-1">
															<h6>${cart.name}</h6>
															<p class="mb-1 text-black-50">
															<c:if test="${cart.freeDelivery eq 'Y'}">무료배송</c:if>
															<c:if test="${cart.freeDelivery eq 'N'}"><fmt:formatNumber value="${cart.deliveryFare}" pattern="#,###"/></c:if>
															</p>
															<select class="inputReSize">
																<c:forEach begin="1" end="99" var="i">
																	<option value="${i}" <c:if test="${i == cart.qty}">selected</c:if>>${i}</option>
																</c:forEach>
															</select>
														</div>
														<div class="p-2 bd-highlight">x</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
		
							<div class="col-5">
								<div class="card">
									<div class="card-body">
										<h2 class="card-title">결제금액</h2>
										<table class="table">
											<tbody>
												<tr>
													<td><p>총 상품금액</p></td>
													<td><p class="text-end">000원</p></td>
												</tr>
												<tr>
													<td><p>총 배송비</p></td>
													<td><p class="text-end">000원</p></td>
												</tr>
												<tr>
													<td><p>총 할인금액</p></td>
													<td><p class="text-end">000원</p></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
		
	</div>
	
	<c:import url="/footer"></c:import>
</body>
</html>