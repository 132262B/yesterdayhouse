package com.maven.yh.admin.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CustomerListVO {

	private	int id;
	private String email;
	private String userName;
	private String phone;
	private String SMSagree;
	private String address;
	private Date regdate;
	private Date lastdate;
	
}
