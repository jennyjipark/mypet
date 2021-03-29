package com.test.mypet.reportboard;

import lombok.Data;

@Data
public class ReportBoardDTO {

	//게시글관련
	private String seqReportBoard;
	private String seqUser;
	private String name;		//게시글 + 댓글 작성
	private String title;		//제목
	private String content;		//내용
	private String writedate;	//게시글 + 댓글 작성날짜
	
	private String password;
	
	
	//댓글관련
	private String seqReportBoardComment;
	private String comments; //댓글
	
}
