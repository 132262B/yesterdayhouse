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

<!-- GoogleFont -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;500;700;900&display=swap" rel="stylesheet">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<!-- include summernote css/js -->
<link href="${root}/assets/summernote/summernote-lite.min.css" rel="stylesheet">
<script src="${root}/assets/summernote/summernote-lite.min.js"></script>
<script src="${root}/assets/summernote/lang/summernote-ko-KR.js"></script>

<!-- js -->
<script src="${root}/assets/js/admin/addProduct.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<h1>상품등록</h1>
			<h6>메인 > 상품관리 > 상품등록</h6>
			<div class="col-12">
				<br>
				<form action="${root}/admin/addProduct/add" method="post">
					<table class="table bg-white" >
						<thead>
							<tr>
								<td class="col-1 text-center">상품 카테고리</td>
								<td colspan="3">
									<select name="categoryMain" id="categoryMain" onchange="categoryMainChange()">
										<c:forEach var="list" items="${categoryList}">
											<option value="${list.id}">${list.name}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="4" class="col-1 text-center">대표이미지</td>
								<td class="col-5"rowspan="4">
									<textarea id="summernoteThumbnail" name="thumbnail" rows="30"></textarea>
								</td>
								<td class="col-1 text-center">상품명</td>
								<td class="col-5"><input type="text" class="form-control" id="productName" name="productName" required></td>
							</tr>
							<tr>
								<td class="col-1 text-center">판매가</td>
								<td><input type="number" class="form-control" id="productPrice" placeholder="숫자만 입력하세요" name="productPrice" required></td>
							</tr>
							<tr>
								<td class="col-1 text-center">상품코드</td>
								<td><input type="text" class="form-control" id="productCode" name="productCode" required></td>
							</tr>
							<tr>
								<td class="col-1 text-center">상품설정</td>
								<td>
									<label for="freeDelivery">무료배송 :</label>
									<input type="checkbox" id="freeDelivery" name="freeDelivery" value="Y">
								</td>
							</tr>
							<tr>
								<td class="col-1 text-center">상품 검색어</td>
								<td colspan="3"><input type="text" class="form-control" id="productSearchName" name="productSearchName" placeholder="검색어 뒤에 , 를 붙혀주세요. (ex 책상,데스크)"></td>
							</tr>
							<tr>
								<td class="col-1 text-center">상품 상세설명</td>
								<td colspan="3">
									<textarea id="summernoteContent" name="content" rows="30" required></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<div class="d-grid gap-2 d-md-flex justify-content-md-end">
										<button class="btn btn-primary" type="reset" onclick="location.replace('/admin/main')">등록취소</button>
										<button class="btn btn-primary me-md-2" type="submit">상품등록</button>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>