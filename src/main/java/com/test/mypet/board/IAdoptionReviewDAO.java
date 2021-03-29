package com.test.mypet.board;

import java.util.List;

/**
 * 입양후기 게시판 DB작업 전담 인터페이스입니다.
 * @author 이준오
 *
 */
public interface IAdoptionReviewDAO {
	
	/**
	 * 전체 입양후기 목록 요청 메소드
	 * @return 입양후기 전체 목록을 반환합니다.
	 */
	List<AdoptionReviewDTO> getList();

	/**
	 * 입양 후기 정보 요청 메소드
	 * @param seqAdoptionReview 입양후기번호 입니다.
	 * @return 입양후기객체를 반환합니다.
	 */
	AdoptionReviewDTO getInfo(String seqAdoptionReview);

	/**
	 * 입양 후기 수정 요청 메소드
	 * @param dto 입양후기 객체입니다.
	 * @return 입양후기 수정 DB작업 결과를 반환합니다.
	 */
	int updateReview(AdoptionReviewDTO dto);

	/**
	 * 조회수 증가 요청 메소드
	 * @param dto 입양후기 객체입니다.
	 */
	void updateViewCount(AdoptionReviewDTO dto);

	/**
	 * 회원번호 요청 메소드
	 * @param id
	 * @return
	 */
	String getSeqUser(String id);

	/**
	 * 입양 후기 등록 요청 메소드
	 * @param dto 입양후기 객체입니다.
	 * @return 입양후기 추가 DB작업 결과를 반환합니다.
	 */
	int insertReview(AdoptionReviewDTO dto);

	/**
	 * 마지막 입양후기번호 요청 메소드
	 * @return 입양후기의 마지막번호를 반환합니다.
	 */
	String selectSeq();

	/**
	 * 이미지 등록 메소드(이미지 없을 때)
	 * @param dto 입양후기 객체입니다.
	 * @return 이미지 추가 DB작업 결과를 반환합니다.
	 */
	int insertImageReview(AdoptionReviewDTO dto);

	/**
	 * 이미지 등록 메소드(이미지 있을 때)
	 * @param dto 입양후기 객체입니다.
	 * @return 이미지 추가 DB작업 결과를 반환합니다.
	 */
	int insertImageReviewY(AdoptionReviewDTO dto);

	/**
	 * 입양후기 삭제 요청 메소드
	 * @param dto 입양후기 객체입니다.
	 * @return 입양후기 삭제 DB작업 결과를 반환합니다.
	 */
	int deleteReview(AdoptionReviewDTO dto);

}
