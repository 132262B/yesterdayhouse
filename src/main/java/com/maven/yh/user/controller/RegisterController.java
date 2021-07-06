package com.maven.yh.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.maven.yh.user.service.RegisterService;
import com.maven.yh.user.vo.RegisterVO;

@Controller
@RequestMapping(value = "/user/*")
public class RegisterController {
	
	@Autowired
	private RegisterService RegisterService;

	// 회원가입 창 매핑
	@RequestMapping(value = "register")
	public String register(HttpServletRequest req) {

		return "user/register";
	}
	
	// 이메일 체크
	@ResponseBody
	@RequestMapping(value = "emailCheck", method= RequestMethod.POST)
	public String emailCheck(HttpServletRequest req) {
		
		String email = req.getParameter("email");
		String result = "false";
		int emailCheck = RegisterService.emailCheck(email);

		if(emailCheck == 0) {
			result = "true"; // 아이디가 없으면 true
		} else if(emailCheck <= 1) {
			result = "false"; // 아이디가 있다면 false
		}

		return result;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "registerCheck", method= RequestMethod.POST)
	public String registerCheck(HttpServletRequest req, RegisterVO rv) {
		String result = "false";
		
		// 이메일 한번 더 체크
		int emailCheck = RegisterService.emailCheck(rv.getEmail());
		
		if(emailCheck == 0) {
			result = "false";
		}
		
		int insertRegister = RegisterService.insertRegister(rv);
				
		if(insertRegister == 0) {
			result = "false";
		} else if (insertRegister == 1) {
			result = "true";
		}

		return result;
	}
	
	
}
