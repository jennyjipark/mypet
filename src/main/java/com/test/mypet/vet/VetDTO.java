package com.test.mypet.vet;

import lombok.Data;

/***
 * 동물병원 DTO입니다.
 * @author 윤지현
 *
 */
@Data
public class VetDTO {
	
	private String seqVet;
	private String image;
	private String name;
	private String address;
	private String tel;
	private String treatment;
	private String time;
	private String content;

}
