 
 /*디테일에서 제품 추가*/
 function addCart(){
		
		let cartAlert = new bootstrap.Modal(document.getElementById('modalCartAlert'))
		let qtyError = new bootstrap.Modal(document.getElementById('modalQtyError'))
	    let id = $("#productID").val();
	    let qty = $("#qty").val();
	    let appdata = {"id":id,"qty":qty};
	    
		$.ajax({
			type:'POST',
			url: '/cart/addcart',
			datatype: 'text',
			data: appdata,
			success: function(data) {
				if(data == 'true') {
					cartAlert.show();
				} else if(data == 'qtyError') {
					qtyError.show();
				} else {
					alert('장바구니에 물건을 담던 도중 문제가 발생하였습니다, 관리자에게 문의하시기 바랍니다.');
				}
			},
			error:function (data) {
				alert('문제가 발생하였습니다, 관리자에게 문의하시기 바랍니다.');
			}
		})
	}

	function moveCartPage() {
		location.replace('/cart') 
	}
	
	/*카트에서 제품 삭제*/
	function deleteCart(num) {
		
		let appdata = {"cartID":num};
		$.ajax({
			type:'post',
			url: '/cart/deleteCart',
			datatype: 'text',
			data: appdata,
			success: function(data) {
				if(data == 'true') {
					location.reload();
				} else if(data == 'false') {
					alert("장바구니에서 물건을 제거하던 도중 에러가 발생하였습니다!")
				}
			},
			error:function (data) {
				alert('문제가 발생하였습니다, 관리자에게 문의하시기 바랍니다.');
			}
		})
		
	}
	
	