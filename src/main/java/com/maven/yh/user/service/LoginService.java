package com.maven.yh.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maven.yh.user.vo.AddSessionVO;
import com.maven.yh.user.vo.LoginVO;

@Service
public class LoginService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectLoginCheck(LoginVO lv) {
		return sqlSession.selectOne("selectLoginCheck",lv);
	}

	
	public AddSessionVO selectLoginInfo(String email) {
		return sqlSession.selectOne("selectLoginInfo",email);
	}
	
}
