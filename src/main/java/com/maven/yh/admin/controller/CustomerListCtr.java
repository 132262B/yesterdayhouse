package com.maven.yh.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.maven.yh.admin.service.CustomerListService;
import com.maven.yh.admin.vo.CustomerListVO;

@Controller
@RequestMapping(value = "/admin/*")
public class CustomerListCtr {

	@Autowired
	private CustomerListService CustomerListService;

	@RequestMapping(value = "customerList")
	public String customerList(HttpServletRequest req, ModelMap ModelMap) {

		List<CustomerListVO> cvo = CustomerListService.selectCustomerList();

		ModelMap.addAttribute("clist", cvo);

		return "admin/customerList";
	}

}
