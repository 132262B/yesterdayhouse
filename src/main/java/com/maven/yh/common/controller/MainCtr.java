package com.maven.yh.common.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.maven.yh.common.service.CommonService;
import com.maven.yh.common.vo.CategoryVO;
import com.maven.yh.store.controller.CartCtr;
import com.maven.yh.store.vo.ProductBuyInfoVO;


@Controller
public class MainCtr {
	
	@Autowired
	private CommonService CommonService;
	
	@Autowired
	private CartCtr CartCtr;
	
	@Autowired
	private CookieManagerCtr CookieManagerCtr;

	@RequestMapping(value = "/home")
	public String home(HttpServletRequest req) {
		return "main/home";
	}
	
	
	@RequestMapping(value = "/header")
	public String header(HttpServletRequest req, ModelMap ModelMap, ProductBuyInfoVO pbv, HttpSession session) {
		// 헤더에 카테고리 호출부분
		List<CategoryVO> categoryMain = CommonService.getCategory();
		
		// 헤더에 장바구니에 담긴 수량 카운트
		int cartCount = CartCtr.cartCount(pbv,session);
		
		ModelMap.addAttribute("cartCount", cartCount);
		ModelMap.addAttribute("categoryList", categoryMain);
		
		return "layout/header";
	}
	
	@RequestMapping(value = "/footer")
	public String footer(HttpServletRequest req) {
		
		
		return "layout/footer";
	}
	
}
