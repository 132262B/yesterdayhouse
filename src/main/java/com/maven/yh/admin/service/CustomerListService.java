package com.maven.yh.admin.service;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maven.yh.admin.vo.CustomerListVO;
import com.maven.yh.common.vo.CategoryVO;


@Service
public class CustomerListService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<CustomerListVO> selectCustomerList() {
		return sqlSession.selectList("selectCustomerList");
	}

	
	

}
