package com.maven.yh.admin.service;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;


}