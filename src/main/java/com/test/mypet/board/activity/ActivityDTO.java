package com.test.mypet.board.activity;

import lombok.Data;

/**
 * 활동 게시글 작성 DTO 입니다.
 * @author 이대홍
 *
 */

@Data
public class ActivityDTO {

	private String seqActivity;
	private String seqLocation;
	private String seqAdmin;
	private String title;
	private String content;
	private String actDate;
	private String viewCount;
	private String period;
	
	public String getSeqActivity() {
		return seqActivity;
	}
	public void setSeqActivity(String seqActivity) {
		this.seqActivity = seqActivity;
	}
	public String getSeqLocation() {
		return seqLocation;
	}
	public void setSeqLocation(String seqLocation) {
		this.seqLocation = seqLocation;
	}
	public String getSeqAdmin() {
		return seqAdmin;
	}
	public void setSeqAdmin(String seqAdmin) {
		this.seqAdmin = seqAdmin;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getActDate() {
		return actDate;
	}
	public void setActDate(String actDate) {
		this.actDate = actDate;
	}
	public String getViewCount() {
		return viewCount;
	}
	public void setViewCount(String viewCount) {
		this.viewCount = viewCount;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
}
