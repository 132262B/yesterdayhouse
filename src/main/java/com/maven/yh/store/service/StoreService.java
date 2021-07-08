package com.maven.yh.store.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maven.yh.store.vo.CategoryPagingVO;
import com.maven.yh.store.vo.ProductListVO;


@Service
public class StoreService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 카테고리 번호에 따른 제품 정보 받아오기
	public List<ProductListVO> getCategoryPaging(CategoryPagingVO cpv) {
		return sqlSession.selectList("getProductList",cpv);
		
	}

}