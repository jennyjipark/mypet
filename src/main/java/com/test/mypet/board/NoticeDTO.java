package com.test.mypet.board;

import lombok.Data;

/**
 * 공지사항 객체
 * @author 노푸른
 *
 */
@Data
public class NoticeDTO {
	
	private String seqNotice;
	private String title;
	private String content;
	private String writeDate;
	private String viewCount;
	private String image;
	private String id;
	private String lseq;
	private String result;

}
