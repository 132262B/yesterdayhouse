package com.maven.yh.store.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maven.yh.store.vo.ProductBuyInfoVO;

@Service
public class CartService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 카테고리 번호에 따른 제품 정보 받아오기
	public int setCartList(ProductBuyInfoVO pbv) {
		return sqlSession.insert("setCartList",pbv);
	}

	public String myCartProductCheck(ProductBuyInfoVO pbv) {
		return sqlSession.selectOne("myCartProductCheck",pbv);
	}

	public int upadateQty(ProductBuyInfoVO pbv) {
		return sqlSession.update("upadateQty",pbv);
	}
}