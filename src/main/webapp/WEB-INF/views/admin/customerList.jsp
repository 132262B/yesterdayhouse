<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1">
<title>인테리어 특가 쇼핑 | 어제의 집</title>

<link rel="icon" href="${root}/assets/images/Yesterday_house_icon.png" />
<link rel="stylesheet" href="${root}/assets/css/admin/customerList.css" />

<!-- GoogleFont -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;500;700;900&display=swap" rel="stylesheet">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<!-- Jquery -->
<script defer src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<%-- <script defer src="${root}/assets/js/admin/main.js"></script> --%>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>Email</th>
							<th>Name</th>
							<th>Phone</th>
							<th>SMS</th>
							<th>주소</th>
							<th>가입</th>
							<th>마지막 방문</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="clist" items="${clist}">
							<tr>
								<td>${clist.id}</td>
								<td>${clist.email}</td>
								<td>${clist.userName}</td>
								<td>
								<c:set var="phone1" value="${fn:substring(clist.phone, 0, 3)}" />
								<c:set var="phone2" value="${fn:substring(clist.phone, 3, 7)}" />
								<c:set var="phone3" value="${fn:substring(clist.phone, 7, 11)}" />
								${phone1}-${phone2}-${phone3}
								</td>
								<td>${clist.SMSagree}</td>
								<td>${clist.address}</td>
								<td><fmt:formatDate value="${clist.regdate}" pattern="yyyy-MM-dd"/></td>
								<td><fmt:formatDate value="${clist.lastdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>