package com.maven.yh.store.vo;

import lombok.Data;

@Data
public class CartListVO {
	private int id;        		// 카트 고유번호
	private int productID; 		// 제품 고유번호
	private int qty;        	// 카트에 담겨있는 수량
	private String thumbnail;	// 제품 고유번호에 해당하는 대표이미지
	private String name;        // 제품 이름
	private int price;       // 제품 고유번호에 해당하는 1개의 가격
	private String freeDelivery;// 제품 무료배달 유/무
	private int deliveryFare;// 제품 배달 가격
}
