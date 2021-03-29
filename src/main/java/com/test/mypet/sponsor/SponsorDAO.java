package com.test.mypet.sponsor;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * 
 * 후원 게시판의 업무처리 클래스
 * @author 이대홍
 *
 */

@Repository
public class SponsorDAO implements ISponsorDAO{

	@Autowired
	private SqlSessionTemplate template;
	
	/**
	 * 보호소 리스트 반환
	 * 
	 */
	
	@Override
	public List<VwSponsorDTO> list(HashMap<String, String> map) {
		System.out.println(  map.get("search") +map.get("begin")+map.get("end") );
		
		if( map.get("search") != null) {
			return template.selectList("spon.list_search", map);
		}
		
		return template.selectList("spon.list",map);

	}

	
	/**
	 * 보호소의 갯수 반환
	 */
	@Override
	public int totalCount(HashMap<String, String> map) {
		
		
		return template.selectOne("spon.list_count");
	}
	
	/**
	 * 1개의 보호소 반환
	 */
	@Override
	public VwSponsorDTO getInfo(String seqShelter) {
		
		System.out.println("seqShelter"+ seqShelter);
		return template.selectOne("spon.getInfo",seqShelter);
	}
	
	/**
	 * 전체 후원금액 반환
	 */
	
	@Override
	public String list_All() {
		
		return template.selectOne("spon.list_All");
	}

	/**
	 * 후원내역 입력
	 */
	@Override
	public int spon(HashMap<String, String> map) {

		return template.insert("spon.spon_insert",map);
	}
	
}
