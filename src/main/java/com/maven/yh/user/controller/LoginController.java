package com.maven.yh.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.maven.yh.user.vo.AddSessionVO;
import com.maven.yh.user.vo.LoginVO;


import lombok.extern.slf4j.Slf4j;

import com.maven.yh.store.controller.CartCtr;
import com.maven.yh.user.service.LoginService;

@Slf4j
@Controller
@RequestMapping(value = "/user/*")
public class LoginController {

	
	@Autowired
	private LoginService LoginService;
	
	@Autowired
	private CartCtr CartCtr;
	
	// 로그인 창 매핑
	@RequestMapping(value = "login")
	public String login() {

		return "user/login";
	}
	
	// 로그인 체크, 세션값 추가
	@ResponseBody
	@RequestMapping(value = "loginCheck",  method= RequestMethod.POST)
	public String loginCheck(HttpServletRequest req,LoginVO lv) {

		String result = "false";
		
		int loginResult = LoginService.selectLoginCheck(lv);
		
		// 계정이 존재하면
		if(loginResult == 1) {
			
			// 계정이 있다면 계정 정보 세션 추가
			AddSessionVO av = LoginService.selectLoginInfo(lv.getEmail());
			HttpSession session = req.getSession();
			session.setAttribute("sUserID", av.getId());
			session.setAttribute("sUserEmail", av.getEmail());
			session.setAttribute("sUserRank", av.getRank());
			session.setAttribute("sUserName", av.getUserName());
			
			CartCtr.updateCart(req);
			
			result = "true";
			
		// 계정이 존재하지 않으면
		} else {
			result = "false";
		}
		
		return result;
	}
	
	// 로그인 창 매핑
	@RequestMapping(value = "logout")
	public String logout(HttpServletRequest req) {

		HttpSession session = req.getSession();
		
		//모든 세션값 삭제
		session.invalidate();
		
		return "redirect:/home";
	}
	
}
