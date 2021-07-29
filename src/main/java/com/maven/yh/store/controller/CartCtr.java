package com.maven.yh.store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.maven.yh.common.controller.ConnectionManagerCtr;
import com.maven.yh.store.service.CartService;
import com.maven.yh.store.vo.CartListVO;
import com.maven.yh.store.vo.ProductBuyInfoVO;

@Controller
public class CartCtr {
	
	@Autowired
	private CartService CartService;
	
	@Autowired
	private ConnectionManagerCtr ConnectionManagerCtr;
	
	// 장바구니 매핑
	@RequestMapping(value = "cart")
	public String cart(ProductBuyInfoVO pbv, ModelMap ModelMap,HttpServletResponse resp, HttpSession session) {
		String sessionInfo = (String)session.getAttribute("sUserID");
		ConnectionManagerCtr.CheckGuestID(); // 쿠키값 체크
		pbv = ConnectionManagerCtr.Check_cookie_session(sessionInfo, pbv);
		
		// 어떻게 자를껀지 지정
		String firstCut = "\\";
		String lastCut = "\" style=";
		List<CartListVO> cartList = CartService.getCartList(pbv);
		
		for(CartListVO clv : cartList) {
			String str = clv.getThumbnail();
			int resultOne = str.indexOf(firstCut);
			int resultTwo = str.indexOf(lastCut);
			
			// 문제가 없으면 잘라진 이미지를 다시 List에 담는다.
			try {
				String cutStr = str.substring(resultOne,resultTwo);
				clv.setThumbnail(cutStr);
				
			// 문제가 있다면 디폴트 이미지를 List에 담는다.
			} catch (StringIndexOutOfBoundsException d) {
				String defaultImage = "/assets/images/product/defaultProductImage.png";
				clv.setThumbnail(defaultImage);
			}
		}
		
		ModelMap.addAttribute("cartList", cartList);
		
		return "store/cart";
	}
	
	// 장바구니 추가
	@ResponseBody
	@RequestMapping(value = "cart/addcart", method= RequestMethod.POST)
	public String addCart(ProductBuyInfoVO pbv, HttpSession session) {
		
		String sessionInfo = (String)session.getAttribute("sUserID");
		String addCartResult = null;
		ConnectionManagerCtr.CheckGuestID(); // 쿠키값 체크
		pbv = ConnectionManagerCtr.Check_cookie_session(sessionInfo, pbv);
		
		pbv.setCartID(CartService.myCartProductCheck(pbv));
		
			
		if(pbv.getCartID() != null) {
			int myCartProductQty = CartService.myCartProductQty(pbv.getCartID());
			
			if((pbv.getQty() + myCartProductQty) > 99) {
				
				addCartResult = "qtyError";
				
			} else {
				int updateResult = CartService.upadateQty(pbv);
				
				if(updateResult == 1) {
					addCartResult = "true";
				// 상품이 insert 되지 않으면 false를 return
				} else {
					addCartResult = "false";
				}
			}
			
		} else {
			int insertResult = CartService.setCartList(pbv);
			// 상품이 insert 되면 true를 return
			if(insertResult == 1) {
				addCartResult = "true";
			// 상품이 insert 되지 않으면 false를 return
			} else {
				addCartResult = "false";
			}
		}	
			
		
		
		return addCartResult;
	}
	
	// 상단 메뉴바 장바구니 수량 카운트
	public int cartCount(ProductBuyInfoVO pbv, HttpSession session) {

		String sessionInfo = (String)session.getAttribute("sUserID");
		
		int result = 0;
		// 세션없을때
		if(sessionInfo == null) {
			pbv.setType("cookie");
			pbv.setNum(ConnectionManagerCtr.getCookieValue("guestID"));
		// 세션이 있을때
		} else {
			pbv.setType("session");
			pbv.setNum((String)session.getAttribute("sUserID"));
		}
		
		result = CartService.getCartCount(pbv);
		return result;
	}
	
	
	//장바구니 물건 삭제
	@ResponseBody
	@RequestMapping(value = "cart/deleteCart", method= RequestMethod.POST)
	public String cartDelete(ProductBuyInfoVO pbv, HttpSession session) {
		
		String sessionInfo = (String)session.getAttribute("sUserID");
		String deleteCartResult = null;
		pbv = ConnectionManagerCtr.Check_cookie_session(sessionInfo, pbv);
		
		int delectResult = CartService.deleteCartList(pbv);
		
		if(delectResult > 0) {
			deleteCartResult = "true";
		} else {
			deleteCartResult = "false";
		}
		
		return deleteCartResult;
	}
	
	@ResponseBody
	@RequestMapping(value = "cart/updateQtyCart", method= RequestMethod.POST)
	public String updateQtyCart(ProductBuyInfoVO pbv, HttpSession session) {
		
		String sessionInfo = (String)session.getAttribute("sUserID");
		String cartUpdateQtyResult = null;
		pbv = ConnectionManagerCtr.Check_cookie_session(sessionInfo, pbv);
		
		int updateQtyResult = CartService.updateQtyCartList(pbv);
		
		if(updateQtyResult > 0) {
			cartUpdateQtyResult = "true";
		} else {
			cartUpdateQtyResult = "false";
		}
		
		return cartUpdateQtyResult;
	}
	

	//장바구니 업데이트 (쿠키 > 세션)
	public void updateCart(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String sUesrID = (String)session.getAttribute("sUserID");
		String guestID = ConnectionManagerCtr.getCookieValue("guestID");
		
		Map<String, String> cs = new HashMap<String, String>();
		cs.put("sessionID", sUesrID);
		cs.put("guestID", guestID);
		
		CartService.upadateCart(cs);
		
	}
}
