package com.test.mypet.adoption;

/**
 * 입양예약신청서 뷰 객체입니다.
 * @author 이준오
 *
 */
public class VwReservationDTO {
	
	private String seqReservation;
	private String seqUser;
	private String name;
	private String birthDate;
	private String tel;
	private String address;
	private String companyName;
	private String species;
	private String breed;
	private String seqPet;
	private String reason;
	private String hospitalName;
	private String seqHouseType;
	private String adoptionExperience;
	private String neutralizationSurgery;
	private String neutralization;
	private String response;
	private String failReason;
	private String seqVet;
	
	private String availableDate;
	
	private String age;
	private String gender;
	private String vaccination;
	private String image;
	
	private String time;
	private String hospitalTel;
	private String treatment;
	private String hospitalAddress;
	
	private String hospitalName2;
	private String time2;
	private String hospitalTel2;
	private String treatment2;
	private String hospitalAddress2;
	
	private String seqShelter;
	private String shelterName2;
	private String shelterTel2;
	private String account;
	private String shelterAddress2;
	
	private String type;
	
	/**
	 * 동물보호중인 병원이름의 getter메소드
	 * @return 동물보호중인 병원이름
	 */
	public String getHospitalName2() {
		return hospitalName2;
	}
	/**
	 * 동물보호중인 병원이름의 setter메소드
	 * @param hospitalName2 동물보호중인 병원이름
	 */
	public void setHospitalName2(String hospitalName2) {
		this.hospitalName2 = hospitalName2;
	}
	/**
	 * 동물보호중인 병원/보호소 운영시간의 getter메소드
	 * @return 동물보호중인 병원/보호소 운영시간
	 */
	public String getTime2() {
		return time2;
	}
	/**
	 * 동물보호중인 병원/보호소 운영시간의 setter메소드
	 * @param time2 동물보호중인 병원/보호소 운영시간
	 */
	public void setTime2(String time2) {
		this.time2 = time2;
	}
	/**
	 * 동물보호중인 병원전화번호의 getter메소드
	 * @return 동물보호중인 병원전화번호
	 */
	public String getHospitalTel2() {
		return hospitalTel2;
	}
	/**
	 * 동물보호중인 병원전화번호의 setter메소드
	 * @param hospitalTel2 동물보호중인 병원전화번호
	 */
	public void setHospitalTel2(String hospitalTel2) {
		this.hospitalTel2 = hospitalTel2;
	}
	/**
	 * 동물보호중인 병원 진료과목의 getter메소드
	 * @return 동물보호중인 병원 진료과목
	 */
	public String getTreatment2() {
		return treatment2;
	}
	/**
	 * 동물보호중인 병원 진료과목의 setter메소드
	 * @param treatment2 동물보호중인 병원 진료과목
	 */
	public void setTreatment2(String treatment2) {
		this.treatment2 = treatment2;
	}
	/**
	 * 동물보호중인 병원주소의 getter메소드
	 * @return 동물보호중인 병원주소
	 */
	public String getHospitalAddress2() {
		return hospitalAddress2;
	}
	/**
	 * 동물보호중인 병원주소의 setter메소드
	 * @param hospitalAddress2 동물보호중인 병원주소
	 */
	public void setHospitalAddress2(String hospitalAddress2) {
		this.hospitalAddress2 = hospitalAddress2;
	}
	/**
	 * 동물보호중인 보호소이름의 getter메소드
	 * @return 동물보호중인 보호소이름
	 */
	public String getShelterName2() {
		return shelterName2;
	}
	/**
	 * 동물보호중인 보호소이름의 setter메소드
	 * @param shelterName2 동물보호중인 보호소이름
	 */
	public void setShelterName2(String shelterName2) {
		this.shelterName2 = shelterName2;
	}
	/**
	 * 동물보호중인 보호소전화번호의 getter메소드
	 * @return 동물보호중인 보호소전화번호
	 */
	public String getShelterTel2() {
		return shelterTel2;
	}
	/**
	 * 동물보호중인 보호소전화번호의 setter메소드
	 * @param shelterTel2 동물보호중인 보호소전화번호
	 */
	public void setShelterTel2(String shelterTel2) {
		this.shelterTel2 = shelterTel2;
	}
	/**
	 * 동물보호중인 보호소 후원 계좌번호의 getter메소드
	 * @return 동물보호중인 보호소 후원 계좌번호
	 */
	public String getAccount() {
		return account;
	}
	/**
	 * 동물보호중인 보호소 후원 계좌번호의 setter메소드
	 * @param account 동물보호중인 보호소 후원 계좌번호
	 */
	public void setAccount(String account) {
		this.account = account;
	}
	/**
	 * 동물보호중인 보호소주소의 getter메소드
	 * @return 동물보호중인 보호소주소
	 */
	public String getShelterAddress2() {
		return shelterAddress2;
	}
	/**
	 * 동물보호중인 보호소주소의 setter메소드
	 * @param shelterAddress2 동물보호중인 보호소주소
	 */
	public void setShelterAddress2(String shelterAddress2) {
		this.shelterAddress2 = shelterAddress2;
	}
	/**
	 * 나이의 getter메소드
	 * @return 나이
	 */
	public String getAge() {
		return age;
	}
	/**
	 * 나이의 setter메소드
	 * @param age 나이
	 */
	public void setAge(String age) {
		this.age = age;
	}
	/**
	 * 성별의 getter메소드
	 * @return 성별
	 */
	public String getGender() {
		return gender;
	}
	/**
	 * 성별의 setter메소드
	 * @param gender 성별
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}
	/**
	 * 접종여부의 getter메소드
	 * @return 접종여부
	 */
	public String getVaccination() {
		return vaccination;
	}
	/**
	 * 접종여부의 setter메소드
	 * @param vaccination 접종여부
	 */
	public void setVaccination(String vaccination) {
		this.vaccination = vaccination;
	}
	/**
	 * 이미지 경로의 getter메소드
	 * @return 이미지 경로
	 */
	public String getImage() {
		return image;
	}
	/**
	 * 이미지 경로의 setter메소드
	 * @param image 이미지 경로
	 */
	public void setImage(String image) {
		this.image = image;
	}
	/**
	 * 자주가는 병원 운영시간의 getter메소드
	 * @return 자주가는 병원 운영시간
	 */
	public String getTime() {
		return time;
	}
	/**
	 * 자주가는 병원 운영시간의 setter메소드
	 * @param time 자주가는 병원 운영시간
	 */
	public void setTime(String time) {
		this.time = time;
	}
	/**
	 * 자주가는 병원 전화번호의 getter메소드
	 * @return 자주가는 병원 전화번호
	 */
	public String getHospitalTel() {
		return hospitalTel;
	}
	/**
	 * 자주가는 병원 전화번호의 setter메소드
	 * @param hospitalTel 자주가는 병원 전화번호
	 */
	public void setHospitalTel(String hospitalTel) {
		this.hospitalTel = hospitalTel;
	}
	/**
	 * 자주가는 병원 진료과목의 getter메소드
	 * @return 자주가는 병원 진료과목
	 */
	public String getTreatment() {
		return treatment;
	}
	/**
	 * 자주가는 병원 진료과목의 setter메소드
	 * @param treatment 자주가는 병원 진료과목
	 */
	public void setTreatment(String treatment) {
		this.treatment = treatment;
	}
	/**
	 * 입양예약신청서 번호의 getter메소드
	 * @return 입양예약신청서 번호
	 */
	public String getSeqReservation() {
		return seqReservation;
	}
	/**
	 * 입양예약신청서 번호의 setter메소드
	 * @param seqReservation 입양예약신청서 번호
	 */
	public void setSeqReservation(String seqReservation) {
		this.seqReservation = seqReservation;
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
	 * 회원이름의 getter메소드
	 * @return 회원이름
	 */
	public String getName() {
		return name;
	}
	/**
	 * 회원이름의 setter메소드
	 * @param name 회원이름
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 생년월일의 getter메소드
	 * @return 생년월일
	 */
	public String getBirthDate() {
		return birthDate;
	}
	/**
	 * 생년월일의 setter메소드
	 * @param birthDate 생년월일
	 */
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	/**
	 * 회원전화번호의 getter메소드
	 * @return 회원전화번호
	 */
	public String getTel() {
		return tel;
	}
	/**
	 * 회원전화번호의 setter메소드
	 * @param tel 회원전화번호
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}
	/**
	 * 회원주소의 getter메소드
	 * @return 회원주소
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * 회원주소의 setter메소드
	 * @param address 회원주소
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * 직장명의 getter메소드
	 * @return 직장명
	 */
	public String getCompanyName() {
		return companyName;
	}
	/**
	 * 직장명의 setter메소드
	 * @param companyName 직장명
	 */
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	/**
	 * 동물종류의 getter메소드
	 * @return 동물종류 
	 */
	public String getSpecies() {
		return species;
	}
	/**
	 * 동물종류의 setter메소드
	 * @param species 동물종류
	 */
	public void setSpecies(String species) {
		this.species = species;
	}
	/**
	 * 동물품종의 getter메소드
	 * @return 동물품종
	 */
	public String getBreed() {
		return breed;
	}
	/**
	 * 동물품종의 setter메소드
	 * @param breed 동물품종
	 */
	public void setBreed(String breed) {
		this.breed = breed;
	}
	/**
	 * 동물번호의 getter메소드
	 * @return 동물번호
	 */
	public String getSeqPet() {
		return seqPet;
	}
	/**
	 * 동물번호의 setter메소드
	 * @param seqPet 동물번호
	 */
	public void setSeqPet(String seqPet) {
		this.seqPet = seqPet;
	}
	/**
	 * 입양하려는 이유의 getter메소드
	 * @return 입양하려는 이유
	 */
	public String getReason() {
		return reason;
	}
	/**
	 * 입양하려는 이유의 setter메소드
	 * @param reason 입양하려는 이유
	 */
	public void setReason(String reason) {
		this.reason = reason;
	}
	/**
	 * 자주가는 병원명의 getter메소드
	 * @return 자주가는 병원명
	 */
	public String getHospitalName() {
		return hospitalName;
	}
	/**
	 * 자주가는 병원명의 setter메소드
	 * @param hospitalName 자주가는 병원명
	 */
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;	
	}
	/**
	 * 입양경험여부의 getter메소드
	 * @return 입양경험여부
	 */
	public String getAdoptionExperience() {
		return adoptionExperience;
	}
	/**
	 * 입양경험여부의 setter메소드
	 * @param adoptionExperience 입양경험여부
	 */
	public void setAdoptionExperience(String adoptionExperience) {
		this.adoptionExperience = adoptionExperience;
	}
	/**
	 * 중성화수술동의여부의 getter메소드
	 * @return 중성화수술동의여부
	 */
	public String getNeutralizationSurgery() {
		return neutralizationSurgery;
	}
	/**
	 * 중성화수술동의여부의 setter메소드
	 * @param neutralizationSurgery 중성화수술동의여부
	 */
	public void setNeutralizationSurgery(String neutralizationSurgery) {
		this.neutralizationSurgery = neutralizationSurgery;
	}
	/**
	 * 중성화여부의 getter메소드
	 * @return 중성화여부
	 */
	public String getNeutralization() {
		return neutralization;
	}
	/**
	 * 중성화여부의 setter메소드
	 * @param neutralization 중성화여부
	 */
	public void setNeutralization(String neutralization) {
		this.neutralization = neutralization;
	}
	/**
	 * 관리자 응답의 getter메소드
	 * @return 관리자 응답 
	 */
	public String getResponse() {
		return response;
	}
	/**
	 * 관리자 응답의 setter메소드
	 * @param response 관리자 응답
	 */
	public void setResponse(String response) {
		this.response = response;
	}
	/**
	 * 응답(승인/거절 사유)의 getter메소드
	 * @return 응답(승인/거절 사유)
	 */
	public String getFailReason() {
		return failReason;
	}
	/**
	 * 응답(승인/거절 사유)의 setter메소드
	 * @param failReason 응답(승인/거절 사유)
	 */
	public void setFailReason(String failReason) {
		this.failReason = failReason;
	}
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
	 * 주거형태번호의 getter메소드
	 * @return 주거형태번호
	 */
	public String getSeqHouseType() {
		return seqHouseType;
	}
	/**
	 * 주거형태번호의 setter메소드
	 * @param seqHouseType 주거형태번호
	 */
	public void setSeqHouseType(String seqHouseType) {
		this.seqHouseType = seqHouseType;
	}
	/**
	 * 신청일의 getter메소드
	 * @return 신청일
	 */
	public String getAvailableDate() {
		return availableDate;
	}
	/**
	 * 신청일의 setter메소드
	 * @param availabledate 신청일
	 */
	public void setAvailableDate(String availabledate) {
		this.availableDate = availabledate;
	}
	/**
	 * 자주가는 병원 주소의 getter메소드
	 * @return 자주가는 병원 주소
	 */
	public String getHospitalAddress() {
		return hospitalAddress;
	}
	/**
	 * 자주가는 병원 주소의 setter메소드
	 * @param hospitalAddress 자주가는 병원 주소
	 */
	public void setHospitalAddress(String hospitalAddress) {
		this.hospitalAddress = hospitalAddress;
	}
	/**
	 * 주거형태의 getter메소드
	 * @return 주거형태
	 */
	public String getType() {
		return type;
	}
	/**
	 * 주거형태의 setter메소드
	 * @param type 주거형태
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * 보호소번호의 getter메소드
	 * @return 보호소번호
	 */
	public String getSeqShelter() {
		return seqShelter;
	}
	/**
	 * 보호소번호의 setter메소드
	 * @param seqShelter 보호소번호
	 */
	public void setSeqShelter(String seqShelter) {
		this.seqShelter = seqShelter;
	}
	
}
