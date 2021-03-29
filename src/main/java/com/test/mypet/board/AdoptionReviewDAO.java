package com.test.mypet.board;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * 입양후기 게시판 DB작업 전담 클래스입니다.
 * @author 이준오
 *
 */
@Repository
public class AdoptionReviewDAO implements IAdoptionReviewDAO{
	
	@Autowired
	SqlSessionTemplate template;
	
	
	//전체 입양후기 게시글 얻기
	@Override
	public List<AdoptionReviewDTO> getList() {

		return template.selectList("adoption_review.list");
	}
	
	//입양 후기 view내 정보 얻기
	@Override
	public AdoptionReviewDTO getInfo(String seqAdoptionReview) {
		
		return template.selectOne("adoption_review.getInfo", seqAdoptionReview);
	}

	//후기 수정
	@Override
	public int updateReview(AdoptionReviewDTO dto) {

		return template.update("adoption_review.updateReview", dto);
	}

	//조회수 증가시키기
	@Override
	public void updateViewCount(AdoptionReviewDTO dto) {
		template.update("adoption_review.updateViewCount", dto);
		
	}

	//회원 아이디를 통한 seqUser받기
	@Override
	public String getSeqUser(String id) {
		
		return template.selectOne("adoption_review.getSeqUser", id);
	}
	
	//입양후기 올리기
	@Override
	public int insertReview(AdoptionReviewDTO dto) {
		
		return template.insert("adoption_review.insertReview", dto);
	}

	//마지막 입양후기번호 가져오기
	@Override
	public String selectSeq() {

		return template.selectOne("adoption_review.selectSeq");
	}

	//이미지 추가하기.(no image)
	public int insertImageReview(AdoptionReviewDTO dto) {

		return template.insert("adoption_review.insertImageReview", dto);
	}

	//이미지 추가하기.(이미지 있을때)
	@Override
	public int insertImageReviewY(AdoptionReviewDTO dto) {
		return template.insert("adoption_review.insertImageReviewY", dto);
	}

	//입양후기 삭제하기
	@Override
	public int deleteReview(AdoptionReviewDTO dto) {

		return template.delete("adoption_review.deleteReview", dto);
	}

	



}
