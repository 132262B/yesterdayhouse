package com.maven.yh.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.maven.yh.admin.service.AdminService;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminCtr {

	@Autowired
	private AdminService AdminService;

	@RequestMapping(value = "main")
	public String home(HttpServletRequest req) {

		return "admin/adminMain";
	}
	
}
