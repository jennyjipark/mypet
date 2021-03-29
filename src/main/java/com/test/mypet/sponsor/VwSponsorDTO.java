package com.test.mypet.sponsor;

import lombok.Data;

/**
 * 보호소의 ViewDTO 클래스 
 * @author 이대홍
 *
 */

@Data
public class VwSponsorDTO {

	private String seqShelter;
	private String image;
	private String name;
	private String address;
	private String tel;
	private String account;
	private String time;
	private String content;
	private String sponSum;
	
	
	public String getSeqShelter() {
		return seqShelter;
	}
	public void setSeqShelter(String seqShelter) {
		this.seqShelter = seqShelter;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSponSum() {
		return sponSum;
	}
	public void setSponSum(String sponSum) {
		this.sponSum = sponSum;
	}
	

	
}
