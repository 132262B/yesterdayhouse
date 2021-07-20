package com.maven.yh.store.controller;

import java.util.List;

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
import com.maven.yh.store.vo.CartListVO;
import com.maven.yh.store.vo.ProductBuyInfoVO;
import com.maven.yh.store.vo.ProductVO;

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
	public String cart(ProductBuyInfoVO pbv, ModelMap ModelMap,HttpServletResponse resp, HttpSession session) {
		String sessionInfo = (String)session.getAttribute("sUserID");
		CookieManagerCtr.CheckGuestID(); // 쿠키값 체크
		
		if(sessionInfo == null) {
			pbv.setType("cookie");
			pbv.setNum(CookieManagerCtr.getCookieValue("guestID"));
		} else if(sessionInfo != null) {
			pbv.setType("session");
			pbv.setNum((String)session.getAttribute("sUserID"));
		}
		
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
		
		pbv.setCartID(CartService.myCartProductCheck(pbv));
		
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
	
	// 상단 메뉴바 장바구니 수량 카운트
	public int cartCount(ProductBuyInfoVO pbv, HttpSession session) {

		String sessionInfo = (String)session.getAttribute("sUserID");
		
		int result = 0;
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
