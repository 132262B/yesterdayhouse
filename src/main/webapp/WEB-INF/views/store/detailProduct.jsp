<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>인테리어 특가 쇼핑 | 어제의 집</title>
<link rel="icon" href="${root}/assets/images/Yesterday_house_icon.png" />
<link rel="stylesheet" href="${root}/assets/css/store/detailProduct.css" />
<script src="${root}/assets/js/store/cart.js"></script>

<!-- GoogleFont -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;500;700;900&display=swap" rel="stylesheet">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	<c:import url="/header"></c:import>
	
	<div class="mt-4"></div>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-12 col-lg-1 mb-2"></div>
					<div class="col-12 col-lg-5 mb-2">
						<div class="">
								<img class="productThumbnail" alt="${product.name}" src="${product.thumbnail}">
						</div>
					</div>
					<div class="col-12 col-lg-5 mb-2">
						<table>
							<tbody>
								<tr>
									<td colspan="2">
										<h2 class="productName">
										<c:if test="${product.freeDelivery eq 'Y'}">
											[무료배송]
										</c:if>
										<c:if test="${product.freeDelivery eq 'N'}">	</c:if>
										${product.name}
										</h2>
										<hr>
									</td>
								</tr>
								<tr>
									<td colspan="2">리뷰(제작예정)</td>
								</tr>
								<tr>
									<td colspan="2"><h2 class="productPrice"><fmt:formatNumber value="${product.price}" pattern="#,###" />원</h2></td>
								</tr>
								<tr>
									<td class="tableresize text-secondary"><p>혜택</p></td>
									<td><p>혜택<p></td>
								</tr>
								<tr>
									<td class="tableresize text-secondary"><p>배송</p></td>
									<td>
										<c:if test="${product.freeDelivery eq 'Y'}">
											<p class="text-decoration-underline">무료배송</p>
										</c:if>
										<c:if test="${product.freeDelivery eq 'N'}">
											<p>배송 상품정보 참고</p>
										</c:if>
									</td>
								</tr>
								<tr>
									<td class="tableresize text-secondary">
										<p>수량</p>
									</td>
									<td>
										<input type="hidden" value="${product.id}" id="productID" />
										<select class="form-select form-select-sm" id="qty">
												<option value="1" selected>1</option>
												<c:forEach begin="2" end="9" var="i">
													<option value="${i}">${i}</option>
												</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="row">
											<hr>
											<div class="col-6 d-grid gap-2">
												<button type="button" class="btn btn-outline-secondary btn-lg" onclick='addCart()'>장바구니 담기</button>
											</div>
											<div class="col-6 d-grid gap-2">
												<button type="button" class="btn btn-outline-primary btn-lg"<c:if test="${sessionScope.sUserID eq null}">disabled</c:if>>구매하기</button>	
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-12 col-lg-1 mb-2"></div>
				</div>

				<div class="col-12">
					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<button class="nav-link active tab-re-size" id="tab-content-tab" data-bs-toggle="tab" data-bs-target="#tab-content" type="button" role="tab" aria-controls="tab-content" aria-selected="true">상품정보</button>
						</div>
					</nav>
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="tab-content" role="tabpanel" aria-labelledby="tab-content-tab">
							<div class="position-relative col-12">
								<div class="position-absolute top-0 start-50 translate-middle-x mt-4">
									${product.content}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal" tabindex="-1" id="modalCartAlert">
		<div class="modal-dialog modal-dialog-centered modal-sm">
			<div class="modal-content">
				<div class="modal-body text-center mt-4">
					<p>장바구니에 상품을 담았습니다!</p>
					<div class="mt-4 d-grid gap-2">
						<button type="button" class="btn btn-outline-info" onclick="moveCartPage()">장바구니로 이동</button>
					</div>
					<div class="mt-2 mb-2 d-grid gap-2">
						<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>