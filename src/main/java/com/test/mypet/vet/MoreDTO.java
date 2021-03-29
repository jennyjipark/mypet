package com.test.mypet.vet;

import lombok.Data;

/***
 * 동물병원 추가 검색 DTO 입니다.
 * @author 윤지현
 *
 */
@Data
public class MoreDTO {
	
	private String category;
	private String title;
	private String link;
	private String description;
	private String telephone;
	private String address;
	private String roadAddress;

}
