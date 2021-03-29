package com.test.mypet.shelter;

import lombok.Data;

/***
 * 보호소 추가검색 DTO입니다.
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
