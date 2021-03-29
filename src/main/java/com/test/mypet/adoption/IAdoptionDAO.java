package com.test.mypet.adoption;

import java.util.HashMap;
import java.util.List;

import com.test.mypet.member.MemberDTO;


/**
 * 입양글 DB작업 전담 인터페이스
 * @author 박지현
 */
public interface IAdoptionDAO {

	/**
	 * 
	 * @param id
	 * @return 유저번호
	 */
	AdoptionDTO getSeqUser(String id);
	
	/**
	 * 입양 리스트 불러오는 메서드
	 * @param map 검색결과
	 * @return 입양리스트
	 */
	List<AdoptionDTO> getList(HashMap<String, String> map);
	
	
	/**
	 * 전체 입양 리스트 불러오는 메서드
	 * @param map 검색결과
	 * @return 입양리스트
	 */
	List<AdoptionDTO> getAllList(HashMap<String, String> map);
	

	/**
	 * 
	 * @param map 검색결과
	 * @return 총 카운트
	 */
	int getTotalCount(HashMap<String, String> map);

	
	/**
	 * 
	 * @param 게시물 번호
	 * @return 입양글 상세정보
	 */
	AdoptionDTO getView(String seqAdoption);
	
	
	/**
	 * 
	 * @param 게시물 번호
	 * @return 쿼리 결과
	 */
	int getLikes(String seqAdoption);

	
	/**
	 * 
	 * @param 유저 번호
	 * @return 유저의 찜하기 목록
	 */
	List<AdoptionDTO> getLikesUser(String seqUser);
	
	
	/**
	 * 
	 * @param seqUser 유저번호
	 * @param seqAdoption 입양글 번호
	 * @return
	 */
	int insertLikes(HashMap<String, String> map);

	
	/**
	 * 
	 * @param seqAdoption 입양글 번호
	 * @return 이전글 & 다음글
	 */
	List<AdoptionDTO> getForNext(String seqAdoption);

	
	/**
	 * 회원이 보는 입양 리스트 불러오는 메서드
	 * @param map 검색결과
	 * @return 입양리스트
	 */
	List<AdoptionDTO> getUserList(HashMap<String, String> map);
	
	
	/**
	 * 
	 * @return 동물병원 리스트
	 */
	List<AdoptionDTO> getVetList(HashMap<String, String> map);
	
	/***
	 * 
	 * @return 동물병원 총 개수
	 */	
	int getVetCount();
	
	
	/**
	 * 
	 * @return 보호소 리스트
	 */
	List<AdoptionDTO> getShelterList(HashMap<String, String> map);
	
	
	
	
}
