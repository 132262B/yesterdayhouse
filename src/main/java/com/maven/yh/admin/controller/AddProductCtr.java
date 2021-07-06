package com.maven.yh.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.maven.yh.admin.service.AddProductService;
import com.maven.yh.admin.vo.AddProductVO;
import com.maven.yh.common.service.CommonService;
import com.maven.yh.common.vo.CategoryVO;


@Controller
@RequestMapping(value = "/admin/*")
public class AddProductCtr {

	@Autowired
	private AddProductService AddProductService;
	
	@Autowired
	private CommonService CommonService; // 카테고리를 호출하기 위해 공용

	@RequestMapping(value = "addProduct")
	public String addProduct(HttpServletRequest req, ModelMap ModelMap) {

		// 카테고리 출력
		List<CategoryVO> categoryList = CommonService.getCategory();
		
		ModelMap.addAttribute("categoryList",categoryList);

		return "admin/addProduct";
	}
	
	@RequestMapping(value = "addProduct/add")
	public String addProductAdd(AddProductVO av, ModelMap ModelMap) {
		
		int result = AddProductService.setAddProduct(av);

		return "redirect:/admin/main";
	}

}
