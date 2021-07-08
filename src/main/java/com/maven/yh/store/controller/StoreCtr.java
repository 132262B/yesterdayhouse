package com.maven.yh.store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.maven.yh.store.vo.CategoryPagingVO;
import com.maven.yh.store.vo.ProductListVO;

import lombok.extern.slf4j.Slf4j;

import com.maven.yh.store.service.StoreService;

@Slf4j
@Controller
@RequestMapping(value = "/store/*")
public class StoreCtr {
	
	@Autowired
	private StoreService StoreService;

	@RequestMapping(value = "productList")
	public String addProduct(CategoryPagingVO cplv, ModelMap ModelMap) {
		
		// 페이지 내용 호출
		List<ProductListVO> productList= StoreService.getCategoryPaging(cplv);
		
		String firstCut = "\\";
		String lastCut = "\" style=";

		// db에 태그를 포함하고 저장된 문자를 잘라주는 역활
		for(ProductListVO pv : productList) {
			String str = pv.getThumbnail();
			int resultOne = str.indexOf(firstCut);
			int resultTwo = str.indexOf(lastCut);
			String cutStr = str.substring(resultOne,resultTwo);
			pv.setThumbnail(cutStr);
		}
		
		ModelMap.addAttribute("productList", productList);

		return "store/productList";
	}
	

}
