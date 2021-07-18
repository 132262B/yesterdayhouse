package com.maven.yh.store.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class ProductBuyInfoVO extends ConnectionInfoVO {

	private String id;     // 제품번호
	private String qty;    // 제품수량
	private String cartID; // 카트 ID 값
	
}
