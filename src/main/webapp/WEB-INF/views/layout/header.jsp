<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${root}/assets//css/common/header.css" />

<div class="container">
	<!-- header -->
	<header class="blog-header py-3">
		<div
			class="row flex-nowrap justify-content-between align-items-center">
			<div class="col-4 pt-1"></div>
			<div class="col-4 text-center">
				<a href="${root}/home"> <img
					src="${root}/assets/images/Yesterday_house_logo.png"
					alt="Yesterday_house_logo" class="logo-size">
				</a>
			</div>
			<div class="col-4 d-flex justify-content-end align-items-center">
				<ul class="nav">
					<!-- 세션값이 없을때 -->
					<c:if test="${sessionScope.sUserEmail eq null }">
						<li class="nav-item"><a href="${root}/user/login"
							class="nav-link link-dark px-2 header-hover">로그인</a></li>
						<li class="nav-item nav-link link-dark px-2">|</li>
						<li class="nav-item"><a href="${root}/user/register"
							class="nav-link link-dark px-2 header-hover">회원가입</a></li>
					</c:if>
					<!-- 세션값이 있을때 -->
					<c:if test="${!(sessionScope.sUserEmail eq null)}">
						<div class="btn-group">
							<button type="button" class="dropdown_button dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
								<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16"><path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" /><path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" /></svg>
							</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">개인정보수정</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="${root}/user/logout">로그아웃</a></li>
								<c:if test="${sessionScope.sUserRank eq '9'}">
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="${root}/admin/main">관리페이지</a></li>
								</c:if>
								<c:if test="${!(sessionScope.sUserRank eq '9')}">

								</c:if>
							</ul>
						</div>

					</c:if>
				</ul>
			</div>
		</div>
	</header>

	<!-- /header -->
	<!-- nav -->
	<nav>
		<div class="nav-scroller py-1 mb-2">
			<ul class="nav d-flex">
				<li><a href="/home" class="nav-link link-dark px-2 nav_hover">스토어홈</a></li>
				<li><a href="#" class="nav-link link-dark px-2 nav_hover">베스트</a></li>

				<c:forEach var="list" items="${categoryList}">
					<li><a href="/productList?cg=${list.id}"
						class="nav-link link-dark px-2 nav_hover">${list.name}</a></li>
				</c:forEach>
			</ul>
		</div>
	</nav>
</div>