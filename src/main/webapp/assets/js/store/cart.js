/**
 * 
 */
 
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
	
