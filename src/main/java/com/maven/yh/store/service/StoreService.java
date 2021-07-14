package com.maven.yh.store.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maven.yh.store.vo.productParameterVO;
import com.maven.yh.store.vo.ProductVO;


@Service
public class StoreService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 카테고리 번호에 따른 제품 정보 받아오기
	public List<ProductVO> getCategoryPaging(productParameterVO ppv) {
		return sqlSession.selectList("getProductList",ppv);
		
	}

	// 제품 상세페이지 정보 받아오기
	public ProductVO getDetailProduct(productParameterVO ppv) {
		return sqlSession.selectOne("getDetailProduct",ppv);
	}

}