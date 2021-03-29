package com.test.mypet.board;

import lombok.Data;

/***
 * FAQ 게시판 DTO입니다.
 * @author 윤지현
 *
 */
@Data
public class FaqDTO {
	
	private String seqFaq;
	private String seqCategory;
	private String category;
	private String title;
	private String content;
//	private String files;
//	private String writeDate;
	

}
