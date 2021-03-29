package com.test.mypet.board;

/**
 * 입양후기 객체입니다.
 * @author 이준오
 *
 */
public class AdoptionReviewDTO {
	private String seqAdoptionReview;
	private String seqUser;
	private String title;
	private String content;
	private String viewCount;
	private String writeDate;
	private String image;
	
	private String lseq;
	private String result;
	
	/**
	 * 입양후기번호의 getter메소드
	 * @return 입양후기번호
	 */
	public String getSeqAdoptionReview() {
		return seqAdoptionReview;
	}
	/**
	 * 입양후기번호의 setter메소드
	 * @param seqAdoptionReview 입양후기번호
	 */
	public void setSeqAdoptionReview(String seqAdoptionReview) {
		this.seqAdoptionReview = seqAdoptionReview;
	}
	
	/**
	 * 회원번호의 getter메소드
	 * @return 회원번호
	 */
	public String getSeqUser() {
		return seqUser;
	}
	/**
	 * 회원번호의 setter메소드
	 * @param seqUser 회원번호
	 */
	public void setSeqUser(String seqUser) {
		this.seqUser = seqUser;
	}
	/**
	 * 제목의 getter메소드
	 * @return 제목
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * 제목의 setter메소드
	 * @param title 제목
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * 내용의 getter메소드
	 * @return 내용본문
	 */
	public String getContent() {
		return content;
	}
	/**
	 * 내용의 setter메소드
	 * @param content 내용본문
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * 이미지경로의 getter메소드
	 * @return 이미지경로
	 */
	public String getImage() {
		return image;
	}
	/**
	 * 이미지경로의 setter메소드
	 * @param image 이미지경로
	 */
	public void setImage(String image) {
		this.image = image;
	}
	/**
	 * 작성일의 getter메소드
	 * @return 작성일
	 */
	public String getWriteDate() {
		return writeDate;
	}
	/**
	 * 작성일의 setter메소드
	 * @param writeDate 작성일
	 */
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	/**
	 * 조회수의 getter메소드
	 * @return 조회수
	 */
	public String getViewCount() {
		return viewCount;
	}
	/**
	 * 조회수의 setter메소드
	 * @param viewCount 조회수
	 */
	public void setViewCount(String viewCount) {
		this.viewCount = viewCount;
	}
	/**
	 * 가장 큰 입양후기번호의 getter메소드
	 * @return 마지막 게시글의 번호
	 */
	public String getLseq() {
		return lseq;
	}
	/**
	 * 가장 큰 입양후기번호의 setter메소드
	 * @param lseq 마지막 게시글의 번호
	 */
	public void setLseq(String lseq) {
		this.lseq = lseq;
	}
	/**
	 * DB작업 결과를 담을 변수의 getter메소드
	 * @return DB작업결과
	 */
	public String getResult() {
		return result;
	}
	/**
	 * DB작업 결과를 담을 변수의 setter메소드
	 * @param result DB작업결과
	 */
	public void setResult(String result) {
		this.result = result;
	}
}
