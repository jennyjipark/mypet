package com.test.mypet.member;

import lombok.Data;

/**
 * 맴버 객체
 * @author 노푸른
 *
 */
@Data
public class MemberDTO {
	
	private String id;
	private String password;
	private String seqUser;
	private String name;
	private String address;
	private String birthdate;
	private String email;
	private String receiving;
	private String tel;
	private String state;


}
