package com.maven.yh.store.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.maven.yh.store.vo.ProductBuyInfoVO;

import com.maven.yh.store.service.StoreService;
import com.maven.yh.common.controller.CookieGuestCtr;

@Controller
public class Cart {
	
	@Autowired
	private StoreService StoreService;
	
	@Autowired
	private CookieGuestCtr GuestCheckCtr;
	
	// 장바구니 매핑
	@RequestMapping(value = "cart")
	public String cart(ModelMap ModelMap,HttpServletResponse resp) {
		
		GuestCheckCtr.CheckGuestID();
		
		return "store/cart";
	}
	
	// 장바구니 추가
	@RequestMapping(value = "cart/addcart")
	public String addCart(ProductBuyInfoVO pbivo, HttpServletRequest req, HttpServletResponse resp) {

		
	
		return null;
	}
}
