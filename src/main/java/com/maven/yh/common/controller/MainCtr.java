package com.maven.yh.common.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.maven.yh.common.service.CommonService;
import com.maven.yh.common.vo.CategoryVO;


@Controller
public class MainCtr {
	
	@Autowired
	private CommonService CommonService;

	@RequestMapping(value = "/home")
	public String home(HttpServletRequest req) {
		return "main/home";
	}
	
	
	@RequestMapping(value = "/header")
	public String header(HttpServletRequest req, ModelMap ModelMap) {
		
		// header에 카테고리에 db에서 카테고리 목록을 받아와 출력시킨다.
		List<CategoryVO> categoryMain = CommonService.getCategory();
		ModelMap.addAttribute("categoryList",categoryMain);
		
		return "layout/header";
	}
	
	
	@RequestMapping(value = "/footer")
	public String footer(HttpServletRequest req) {
		
		
		return "layout/footer";
	}
	
}
