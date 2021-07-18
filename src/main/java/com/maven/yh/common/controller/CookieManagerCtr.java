package com.maven.yh.common.controller;

import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.CookieGenerator;

import com.maven.yh.common.service.CommonService;


@Controller
public class CookieManagerCtr {
	
	@Autowired
	HttpServletResponse resp;
	
	@Autowired
	HttpServletRequest req;
	
	@Autowired
	private CommonService CommonService;

	public void CheckGuestID() {
		
		Cookie[] cookies = req.getCookies();

		if (cookies != null) {
			int result = 0;
			for (Cookie cookie : cookies) {
				// 쿠키 값중 guestID 라는 쿠키가 있으면 result를 1로 변경 후, 반복문 종료.
				if (cookie.getName().equals("guestID")) {
					result = 1;
					break;
				}
			}
			// 쿠키에 guestID 가 없으면, 쿠키 생성.
			if (result == 0) {
				setCookie();
			}

		} else {
			setCookie();
		}
	}

	
	
	public void setCookie() {
		
		// 8자리 랜덤 값 생성
		UUID uuid = UUID.randomUUID();
		String randomStr = uuid.toString().substring(0,8);
		
		// 생성된 랜덤 값을 DB에 던져, 고유번호 생성 및 
		CommonService.insertGuestID(randomStr);
		String guestIdNum = CommonService.selectGuestID(randomStr);
		
		CookieGenerator cg = new CookieGenerator();
		
		cg.setCookieMaxAge(60*60*24*30);       // 쿠키 유지시간 30일 (장바구니 유지시간)
		cg.setCookiePath("/");
		
		cg.setCookieName("guestID");
        cg.addCookie(resp, guestIdNum);
        cg.setCookieName("ranNum");
        cg.addCookie(resp, randomStr);
	}
	
	public String getCookieValue(String cookieName) {
	
		Cookie[] cookies = req.getCookies();
		
		String resultValue = null;
		
		for (Cookie cookie : cookies) {
			
			if(cookie.getName().equals(cookieName)) {
				resultValue = cookie.getValue();
			}
			
		}
		
		return resultValue;
	}
	
}
