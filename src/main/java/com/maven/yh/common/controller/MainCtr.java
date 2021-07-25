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
import com.maven.yh.store.vo.ProductVO;
import com.maven.yh.store.vo.productParameterVO;


@Controller
public class MainCtr {
	
	@Autowired
	private CommonService CommonService;
	
	@Autowired
	private CartCtr CartCtr;

	@RequestMapping(value = "/home")
	public String home(HttpServletRequest req, ModelMap ModelMap) {
		
		// 상품리스트에 상품 호출
		List<ProductVO> productList = CommonService.getAllProductList();
				
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
