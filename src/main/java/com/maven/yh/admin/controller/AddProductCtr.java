package com.maven.yh.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.maven.yh.admin.service.AddProductService;


@Controller
public class AddProductCtr {

	@Autowired
	private AddProductService AddProductService;

	@RequestMapping(value = "/admin/addProduct")
		public String home(HttpServletRequest req) {
			
			return "admin/addProduct";
		}
	
	
	@RequestMapping("/imageUpload")
	@ResponseBody
	public void imageUpload(HttpServletRequest req, HttpServletResponse resp, @RequestParam MultipartFile upload) throws Exception {
		
		String fileName = upload.getOriginalFilename();
		
		System.out.println(fileName);
		
	}

}
