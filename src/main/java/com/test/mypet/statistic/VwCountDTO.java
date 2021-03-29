package com.test.mypet.statistic;

import lombok.Data;

/**
 * MYPET 데이터의 ViewDTO 입니다.
 * @author 이대홍
 *
 */

@Data
public class VwCountDTO {

	private int pet;
	private int ablePet;
	private int comPet;
	private int dog;
	private int cat;
	private int allType;
	private int shelter;
	private int vet;
	private int allUser;
	public int getPet() {
		return pet;
	}
	public void setPet(int pet) {
		this.pet = pet;
	}
	public int getAblePet() {
		return ablePet;
	}
	public void setAblePet(int ablePet) {
		this.ablePet = ablePet;
	}
	public int getComPet() {
		return comPet;
	}
	public void setComPet(int comPet) {
		this.comPet = comPet;
	}
	public int getDog() {
		return dog;
	}
	public void setDog(int dog) {
		this.dog = dog;
	}
	public int getCat() {
		return cat;
	}
	public void setCat(int cat) {
		this.cat = cat;
	}
	public int getAllType() {
		return allType;
	}
	public void setAllType(int allType) {
		this.allType = allType;
	}
	public int getShelter() {
		return shelter;
	}
	public void setShelter(int shelter) {
		this.shelter = shelter;
	}
	public int getVet() {
		return vet;
	}
	public void setVet(int vet) {
		this.vet = vet;
	}
	public int getAllUser() {
		return allUser;
	}
	public void setAllUser(int allUser) {
		this.allUser = allUser;
	}

}
	
