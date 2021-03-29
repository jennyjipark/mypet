package com.test.mypet.shelter;

import lombok.Data;

/***
 * 보호소 DTO입니다.
 * @author 윤지현
 *
 */
@Data
public class ShelterDTO {
	
	private String seqShelter;
	private String image;
	private String name;
	private String address;
	private String tel;
	private String account;
	private String time;
	private String content;
	
	private String startDate;
	private String endDate;
	
	


}
