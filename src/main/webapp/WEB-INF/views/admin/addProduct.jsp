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


<script type="text/javascript">
$(document).ready(function() {

	var toolbar = [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview'/* ,'fullscreen', 'help' */]]
		  ];

	var setting = {
            height : 500,
            minHeight : 300,
            maxHeight : null,
            focus : true,
            lang : 'ko-KR',
            toolbar : toolbar,
            callbacks : { //여기 부분이 이미지를 첨부하는 부분
            onImageUpload : 
            	function(files, editor, welEditable) {
		            for (var i = files.length - 1; i >= 0; i--) {
		            uploadSummernoteImageFile(files[i],
		            this);
		            	}
		            }
		          }
		        };

        $('#summernote').summernote(setting);
        });
        
	function uploadSummernoteImageFile(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/uploadImage",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				$(el).summernote('editor.insertImage', data.url);
			}
		});
}
</script>

</head>
<body>
	<div class="container">
		<div class="row">
			<h1>상품등록</h1>
			<h6>메인 > 상품관리 > 상품등록</h6>
			<div class="col-12">
				<br>
				<form action="/admin/addProduct" method="post">
					<table class="table bg-white" >
						<thead>
							<tr>
								<td class="col-1 text-center">상품 카테고리</td>
								<td colspan="3">
									<select name="categoryMain" id="categoryMain" onchange="categoryMainChange()">
										<option value="null" selected disabled>선택하세요.</option>
										<c:forEach var="list" items="${categoryList}">
											<option value="${list.id}">${list.name}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="3" class="col-1 text-center">대표이미지</td>
								<td class="col-5"rowspan="3"><input type="file"></td>
								<td class="col-1 text-center">상품명</td>
								<td class="col-5"><input type="text" class="form-control" id="productName" name="productName"></td>
							</tr>
							<tr>
								<td class="col-1 text-center">판매가</td>
								<td><input type="text" class="form-control" id="productPrice" name="productPrice"></td>
							</tr>
							<tr>
								<td class="col-1 text-center">상품코드</td>
								<td><input type="text" class="form-control" id="productCode" name="productCode"></td>
							</tr>
							<tr>
								<td class="col-1 text-center">상품 검색어</td>
								<td colspan="3"><input type="text" class="form-control" id="productSearchName" name="productSearchName" placeholder="검색어 뒤에 , 를 붙혀주세요. (ex 책상,데스크)"></td>
							</tr>
							<tr>
								<td class="col-1 text-center">상품 상세설명</td>
								<td colspan="3">
								
									<textarea id="summernote" name="content" rows="30"></textarea>
									
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