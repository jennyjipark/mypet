package com.test.mypet.board;

import java.util.HashMap;
import java.util.List;

/***
 * 봉사활동 게시판 DAO 인터페이스
 * @author 박지현
 *
 */
public interface IVolunteerDAO {
	
	/**
	 * @param id 유저 아이디
	 * @return 유저 번호 반환
	 */
	public VolunteerDTO getSeqUser(String id);
	
	/**
	 * @param map 검색어, rownum
	 * @return 봉사활동 리스트 DB 반환
	 */
	public List<VolunteerDTO> list(HashMap<String, String> map);
	
	/**
	 * @param map 검색어
	 * @return 총 게시물 수
	 */
	public int getTotalCount(HashMap<String, String> map);
	
	/**
	 * @param seqVolunteer 봉사활동 글번호
	 * @return 봉사활동 상세 DB 반환
	 */
	public List<VolunteerDTO> getView(String seqVolunteer);
	
	/**
	 * @param seqVolunteer
	 * @return 봉사활동 이전, 다음글 번호 반환
	 */
	public List<VolunteerDTO> getForNext(String seqVolunteer);
	
	/**
	 * 
	 * @return 봉사활동 테이블 최소, 최대 시퀀스 반환
	 */
	public List<VolunteerDTO> getMaxMin();

	/**
	 * 
	 * @param map 유저 번호, 봉사활동 글 번호
	 * @return 결과값
	 */
	public int applyVolunteer(HashMap<String, String> map);
	
}
