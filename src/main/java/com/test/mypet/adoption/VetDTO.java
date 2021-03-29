package com.test.mypet.adoption;

/**
 * 동물병원 객체입니다.
 * @author 이준오
 *
 */
public class VetDTO {
	private String seqVet;
	private String image;
	private String name;
	private String address;
	private String tel;
	private String treatment;
	private String time;
	private String content;
	
	/**
	 * 동물병원번호의 getter메소드
	 * @return 동물병원번호
	 */
	public String getSeqVet() {
		return seqVet;
	}
	/**
	 * 동물병원번호의 setter메소드
	 * @param seqVet 동물병원번호
	 */
	public void setSeqVet(String seqVet) {
		this.seqVet = seqVet;
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
	 * 병원명의 getter메소드
	 * @return 병원명
	 */
	public String getName() {
		return name;
	}
	/**
	 * 병원명의 setter메소드
	 * @param name 병원명
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 주소의 getter메소드
	 * @return 주소
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * 주소의 setter메소드
	 * @param address 주소
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * 전화번호의 getter메소드
	 * @return 전화번호
	 */
	public String getTel() {
		return tel;
	}
	/**
	 * 전화번호의 setter메소드
	 * @param tel 전화번호
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}
	/**
	 * 진료과목의 getter메소드
	 * @return 진료과목
	 */
	public String getTreatment() {
		return treatment;
	}
	/**
	 * 진료과목의 setter메소드
	 * @param treatment 진료과목
	 */
	public void setTreatment(String treatment) {
		this.treatment = treatment;
	}
	/**
	 * 영업시간의 getter메소드
	 * @return 영업시간
	 */
	public String getTime() {
		return time;
	}
	/**
	 * 영업시간의 setter메소드
	 * @param time 영업시간
	 */
	public void setTime(String time) {
		this.time = time;
	}
	/**
	 * 설명 등 소개글의 getter메소드
	 * @return 설명 등 소개글
	 */
	public String getContent() {
		return content;
	}
	/**
	 * 설명 등 소개글의 setter메소드
	 * @param content 설명 등 소개글
	 */
	public void setContent(String content) {
		this.content = content;
	}
	
}
