package com.maven.yh.store.vo;

import lombok.Data;

@Data
public class ConnectionInfoVO {

	private String num;        // 세션값 or 게스트 쿠키 값
	private String ranNum;     // 게스트 쿠키 고유번호
	private String type;       // 쿠키인지, 세션인지 체크하는 Type
}
