package com.test.mypet.statistic;

import lombok.Data;


/**
 * 전체 동물데이터 view DTO 입니다.
 * @author 이대홍
 *
 */
@Data
public class VwAnimalDataDTO {

	private String seqanimaldata;
	private String location;
	private String ymdate;
	private String euthanasia;
	private String adoption;
	private String death;
	private String returning;
	private String semifarming;
	private String protection;
	private String donation;
	private String total;
	public String getSeqanimaldata() {
		return seqanimaldata;
	}
	public void setSeqanimaldata(String seqanimaldata) {
		this.seqanimaldata = seqanimaldata;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getYmdate() {
		return ymdate;
	}
	public void setYmdate(String ymdate) {
		this.ymdate = ymdate;
	}
	public String getEuthanasia() {
		return euthanasia;
	}
	public void setEuthanasia(String euthanasia) {
		this.euthanasia = euthanasia;
	}
	public String getAdoption() {
		return adoption;
	}
	public void setAdoption(String adoption) {
		this.adoption = adoption;
	}
	public String getDeath() {
		return death;
	}
	public void setDeath(String death) {
		this.death = death;
	}
	public String getReturning() {
		return returning;
	}
	public void setReturning(String returning) {
		this.returning = returning;
	}
	public String getSemifarming() {
		return semifarming;
	}
	public void setSemifarming(String semifarming) {
		this.semifarming = semifarming;
	}
	public String getProtection() {
		return protection;
	}
	public void setProtection(String protection) {
		this.protection = protection;
	}
	public String getDonation() {
		return donation;
	}
	public void setDonation(String donation) {
		this.donation = donation;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}

}
	
