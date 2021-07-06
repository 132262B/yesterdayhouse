package com.maven.yh.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maven.yh.user.vo.RegisterVO;

@Service
public class RegisterService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 홈페이지 접속 상단 카테고리 출력
	public int emailCheck(String email) {
		return sqlSession.selectOne("emailCheck",email);
	}

	// 회원가입
	public int insertRegister(RegisterVO rv) {
		
		return sqlSession.insert("insertRegister",rv);
	}

}
