package com.maven.yh.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maven.yh.admin.vo.AddProductVO;

	@Service
	public class AddProductService {
		
		@Autowired
		private SqlSessionTemplate sqlSession;
		
		// 제품 등록
		public int setAddProduct(AddProductVO av) {
			return sqlSession.insert("setAddProduct",av);
		}


	}