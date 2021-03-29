package com.test.mypet.board;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


/**
 * 봉사활동 게시판 DB작업 전담 클래스
 * @author 박지현
 *
 */
@Repository
public class VolunteerDAO implements IVolunteerDAO{

	
	@Autowired
	private SqlSessionTemplate template;
	
	
	//유저번호 얻기
	@Override
	public VolunteerDTO getSeqUser(String id) {
		
		return template.selectOne("volunteer.seqUser", id);
	}
	
	//봉사활동 리스트 얻기
	@Override
	public List<VolunteerDTO> list(HashMap<String, String> map) {

		return template.selectList("volunteer.list", map);
	}
	
	//전체 글 번호 얻기
	@Override
	public int getTotalCount(HashMap<String, String> map) {
		
		return template.selectOne("volunteer.count", map);
	}
	
	//봉사활동 상세보기 얻기
	@Override
	public List<VolunteerDTO> getView(String seqVolunteer) {

		return template.selectList("volunteer.view", seqVolunteer);
	}
	
	//이전글 다음글 얻기
	@Override
	public List<VolunteerDTO> getForNext(String seqVolunteer) {
		
		return template.selectList("volunteer.fornext", seqVolunteer);
	}
	
	//최대, 최소 시퀀스 얻기
	@Override
	public List<VolunteerDTO> getMaxMin() {
		
		return template.selectList("volunteer.maxmin");
	}
	
	//봉사활동 신청 데이터 넣기
	@Override
	public int applyVolunteer(HashMap<String, String> map) {
		
		return template.insert("volunteer.applyVolunteer", map);
	}
	
	
	
}
