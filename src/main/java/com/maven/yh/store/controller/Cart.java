package com.maven.yh.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.maven.yh.store.vo.productParameterVO;

import com.maven.yh.store.service.StoreService;

@Controller
public class Cart {
	
	@Autowired
	private StoreService StoreService;
	
	// 상품 리스트 출력
	@RequestMapping(value = "cart")
	public String addProduct(ModelMap ModelMap) {
		
		return "store/cart";
	}
	

}
