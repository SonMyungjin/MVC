package com.project.domain;

import lombok.Data;

@Data
public class MemberVO {
	 private Long mno;
	 private String id;
	 private String pass;
	 private String name;
	 private int age;
	 private String email;
	 private String postcode;
	 private String address;
	 private String detailAddress;
	 private String extraAddress;
	 private MemberVO login;
}
