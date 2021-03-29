package com.test.mypet.adoption;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


/**
 * 입양예약 DB작업 전담 클래스
 * @author 이준오
 *
 */
@Repository
public class ReservationDAO implements IReservationDAO {


	@Autowired
	private SqlSessionTemplate template;

	@Override
	//회원정보가져오기.
	public VwReservationDTO getUserInfo(Object object) {
		
		System.out.println("object = "+object);
		String id = (String)object;
		System.out.println("id = " + id);
		return template.selectOne("adoption_reservation.getUserInfo", id);
	}

	//회원 주소에 따른 동물병원 목록 가져오기.
	@Override
	public List<VetDTO> getVetList(String address) {

		return template.selectList("adoption_reservation.getVetList",address);
	}

	//입양예약신청서 등록.
	@Override
	public int insertReservation(VwReservationDTO dto) {

		
		return template.insert("adoption_reservation.insertReservation", dto);
	}

	//내 예약목록 출력.(응답 있음)
	@Override
	public List<VwReservationDTO> getMyReservationList(String seqUser) {

		return template.selectList("adoption_reservation.getMyReservationList", seqUser);
	}
	
	//내 예약목록 출력.(응답 없음)
	@Override
	public List<VwReservationDTO> getMyReservationListWithNoResponse(String seqUser) {
		return template.selectList("adoption_reservation.getMyReservationListWithNoResponse", seqUser);
	}
	
	//내 예약목록 출력(보호소, 응답있음)
	@Override
	public List<VwReservationDTO> getMyReservationListShelter(String seqUser) {
		
		return template.selectList("adoption_reservation.getMyReservationListShelter", seqUser);
	}
	
	//내 예약목록 출력(보호소, 응답없음)
	@Override
	public List<VwReservationDTO> getMyReservationListShelterWithNoResponse(String seqUser) {
		
		return template.selectList("adoption_reservation.getMyReservationListShelterWithNoResponse", seqUser);
	}

	//입양예약서 정보 출력
	@Override
	public VwReservationDTO getReservationView(String seqReservation) {
		
		return template.selectOne("adoption_reservation.getReservationView" ,seqReservation);
	}




	
	
	
	
	
	
}
