package com.test.mypet.adoption;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.mypet.board.VolunteerDTO;
import com.test.mypet.member.MemberDTO;


/**
 * 입양리스트 DB작업 전담 클래스
 * @author 박지현
 */
@Repository
public class AdoptionDAO implements IAdoptionDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	
	//회원번호
	@Override
	public AdoptionDTO getSeqUser(String id) {
		
		return template.selectOne("adoption.seqUser", id);
	}
	
	
	//관리자 페이징 리스트
	@Override
	public List<AdoptionDTO> getList(HashMap<String, String> map) {
		
		return template.selectList("adoption.list", map);
		 
	}
	
	//유저가 보는 입양 리스트
	@Override
	public List<AdoptionDTO> getUserList(HashMap<String, String> map) {
			
		return template.selectList("adoption.userList", map);
	}

	//전체 리스트
	@Override
	public List<AdoptionDTO> getAllList(HashMap<String, String> map) {
		
		return template.selectList("adoption.AllList", map);
	}


	//페이징
	@Override
	public int getTotalCount(HashMap<String, String> map) {
		
		return template.selectOne("adoption.count", map);
	}
	
	
	//상세보기
	@Override
	public AdoptionDTO getView(String seqAdoption) {
			
		return template.selectOne("adoption.view", seqAdoption);
	}


	//찜하기
	@Override
	public int getLikes(String seqAdoption) {
		
		return template.update("adoption.likes", seqAdoption);
	}
	
	//유저의 찜하기
	@Override
	public List<AdoptionDTO> getLikesUser(String seqUser) {
		
		return template.selectList("adoption.likeUser", seqUser);
	}


	
	//찜하기 테이블에 넣기
	@Override
	public int insertLikes(HashMap<String, String> map) {
		
		return template.insert("adoption.insertLikes", map);
	}


	//이전글 & 다음글
	@Override
	public List<AdoptionDTO> getForNext(String seqAdoption) {
		
		return template.selectList("adoption.fornext", seqAdoption);
	}

	
	//동물병원 리스트
	@Override
	public List<AdoptionDTO> getVetList(HashMap<String, String> map) {
		
		return template.selectList("adoption.getVet");
	}

	
	//동물병원 총 개수
	@Override
	public int getVetCount() {
		
		return template.selectOne("adoption.getVetCount");
	}

		
	//보호소 리스트
	@Override
	public List<AdoptionDTO> getShelterList(HashMap<String, String> map) {
		
		return template.selectList("adoption.getShelter");
	}
	
	
	

	
	
	

}
