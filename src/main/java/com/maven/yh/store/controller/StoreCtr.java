package com.maven.yh.store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.maven.yh.store.vo.productParameterVO;
import com.maven.yh.store.vo.ProductVO;

import lombok.extern.slf4j.Slf4j;

import com.maven.yh.common.controller.ConnectionManagerCtr;
import com.maven.yh.store.service.StoreService;

@Controller
@RequestMapping(value = "/store/*")
public class StoreCtr {
	
	@Autowired
	private StoreService StoreService;
	
	@Autowired
	private ConnectionManagerCtr CookieManagerCtr;
	
	// 상품 리스트 출력
	@RequestMapping(value = "productList")
	public String addProduct(productParameterVO ppv, ModelMap ModelMap) {
		
		CookieManagerCtr.CheckGuestID(); // 쿠키값 체크
		// 상품리스트에 상품 호출
		List<ProductVO> productList= StoreService.getCategoryPaging(ppv);
		
		// 썸네일 어떻게 자를껀지 지정
		String firstCut = "\\";
		String lastCut = "\" style=";
		// db에 태그를 포함하고 저장된 문자를 잘라주는 역활(List)
		for(ProductVO pv : productList) {
			String str = pv.getThumbnail();
			int resultOne = str.indexOf(firstCut);
			int resultTwo = str.indexOf(lastCut);
			
			// 문제가 없으면 잘라진 이미지를 다시 List에 담는다.
			try {
				String cutStr = str.substring(resultOne,resultTwo);
				pv.setThumbnail(cutStr);
				
			// 문제가 있다면 디폴트 이미지를 List에 담는다.
			} catch (StringIndexOutOfBoundsException d) {
				String defaultImage = "/assets/images/product/defaultProductImage.png";
				pv.setThumbnail(defaultImage);
			}
			
		}
		
		ModelMap.addAttribute("productList", productList);

		return "store/productList";
	}
	
	// 상세페이지
	@RequestMapping(value="product")
	public String detailProduct(productParameterVO ppv, ModelMap ModelMap) {
		
		CookieManagerCtr.CheckGuestID(); // 쿠키값 체크
		
		ProductVO detailProduct = StoreService.getDetailProduct(ppv);
		
		// 어떻게 자를껀지 지정
		String firstCut = "\\";
		String lastCut = "\" style=";
		// db에 태그를 포함하고 저장된 문자를 잘라주는 역활(한번)
		String str = detailProduct.getThumbnail();
		int resultOne = str.indexOf(firstCut);
		int resultTwo = str.indexOf(lastCut);
	
		// 문제가 없으면 잘라진 이미지를 다시 List에 담는다.
		try {
			String cutStr = str.substring(resultOne,resultTwo);
			detailProduct.setThumbnail(cutStr);
		
			// 문제가 있다면 디폴트 이미지를 List에 담는다.
		} catch (StringIndexOutOfBoundsException d) {
			String defaultImage = "/assets/images/product/defaultProductImage.png";
			detailProduct.setThumbnail(defaultImage);
		}
		
		ModelMap.addAttribute("product",detailProduct);
		
		return "store/detailProduct";
	}
	

}
