package com.maven.yh.common.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maven.yh.common.vo.CategoryVO;


@Service
public class CommonService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 홈페이지 접속 상단 카테고리 출력
	public List<CategoryVO> getCategory() {
		return sqlSession.selectList("selectGetCategory");
	}

}