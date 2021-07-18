package com.maven.yh.store.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.maven.yh.common.controller.CookieManagerCtr;
import com.maven.yh.store.service.CartService;
import com.maven.yh.store.vo.ProductBuyInfoVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartCtr {
	
	@Autowired
	private CartService CartService;
	
	@Autowired
	private CookieManagerCtr CookieManagerCtr;
	
	// 장바구니 매핑
	@RequestMapping(value = "cart")
	public String cart(ModelMap ModelMap,HttpServletResponse resp, HttpSession session) {
		
		CookieManagerCtr.CheckGuestID();
		
		return "store/cart";
	}
	
	// 장바구니 추가
	@ResponseBody
	@RequestMapping(value = "cart/addcart", method= RequestMethod.POST)
	public String addCart(ProductBuyInfoVO pbv, HttpSession session) {
		
		String sessionInfo = (String)session.getAttribute("sUserID");
		String addCartresult = null;
		CookieManagerCtr.CheckGuestID(); // 쿠키값 체크
		
		// 세션이 없을때
		if(sessionInfo == null) {
			pbv.setType("cookie");
			pbv.setNum(CookieManagerCtr.getCookieValue("guestID"));
			
		// 세션이 있을떄,
		} else if(sessionInfo != null) {
			pbv.setType("session");
			pbv.setNum((String)session.getAttribute("sUserID"));
		}
		
		log.info(pbv.getNum());
		log.info(pbv.getType());
		pbv.setCartID(CartService.myCartProductCheck(pbv));
		
		
		System.err.println(pbv.getCartID());
		
		if(pbv.getCartID() != null) {
			int updateResult = CartService.upadateQty(pbv);
			
			if(updateResult == 1) {
				addCartresult = "true";
			// 상품이 insert 되지 않으면 false를 return
			} else {
				addCartresult = "false";
			}
			
		} else {
			int insertResult = CartService.setCartList(pbv);
			// 상품이 insert 되면 true를 return
			if(insertResult == 1) {
				addCartresult = "true";
			// 상품이 insert 되지 않으면 false를 return
			} else {
				addCartresult = "false";
			}
		}
		
		return addCartresult;
	}
	
	
	public int cartCount(ProductBuyInfoVO pbv, HttpSession session) {
		String sessionInfo = (String)session.getAttribute("sUserID");
		
		int result = 0;
		String cartCountID = null;
		// 세션없을때
		if(sessionInfo == null) {
			pbv.setType("cookie");
			pbv.setNum(CookieManagerCtr.getCookieValue("guestID"));
		// 세션이 있을때
		} else {
			pbv.setType("session");
			pbv.setNum((String)session.getAttribute("sUserID"));
		}
		
		result = CartService.getCartCount(pbv);
		return result;
	}
}
