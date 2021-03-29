package com.test.mypet.adoption;

import java.util.List;

/**
 * 입양예약 DB작업 전담 인터페이스입니다.
 * @author 이준오
 *
 */
public interface IReservationDAO {
	
	/**
	 * 회원정보를 받아오는 메소드입니다.
	 * @param 회원의 id
	 * @return 입양예약신청 객체를 반환합니다.
	 */
	VwReservationDTO getUserInfo(Object id);

	/**
	 * 동물병원 목록을 받아오는 메소드입니다.
	 * @param address 주소
	 * @return 동물병원 목록을 반환합니다.
	 */
	List<VetDTO> getVetList(String address);

	/**
	 * 입양예약신청서 등록 DB작업을 요청하는 메소드입니다.
	 * @param dto 입양예약신청서 객체
	 * @return DB작업 결과를 반환합니다.
	 */
	int insertReservation(VwReservationDTO dto);

	/**
	 * 회원의 입양예약신청내역을 받아오는메소드(동물병원관리, 응답있음)입니다.
	 * @param seqUser 회원번호
	 * @return
	 */
	List<VwReservationDTO> getMyReservationList(String seqUser);

	/**
	 * 입양예약신청서 내 정보를 받아오는 메소드입니다.
	 * @param seqReservation 예약번호
	 * @return 입양예약신청 객체를 반환합니다.
	 */
	VwReservationDTO getReservationView(String seqReservation);

	/**
	 * 회원의 입양예약신청내역을 받아오는메소드(동물병원관리, 응답없음)입니다.
	 * @param seqUser 회원번호
	 * @return 입양예약신청 목록을 반환합니다.
	 */
	List<VwReservationDTO> getMyReservationListWithNoResponse(String seqUser);

	/**
	 * 회원의 입양예약신청내역을 받아오는 메소드(보호소관리, 응답있음)입니다.
	 * @param seqUser 회원번호
	 * @return 입양예약신청 목록을 반환합니다.
	 */
	List<VwReservationDTO> getMyReservationListShelter(String seqUser);

	/**
	 * 회원의 입양예약신청내역을 받아오는 메소드(보호소관리, 응답없음)입니다.
	 * @param seqUser 회원번호
	 * @return 입양예약신청 목록을 반환합니다.
	 */
	List<VwReservationDTO> getMyReservationListShelterWithNoResponse(String seqUser);


}
