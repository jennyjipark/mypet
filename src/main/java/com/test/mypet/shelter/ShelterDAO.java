package com.test.mypet.shelter;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/***
 * 보호소 DAO입니다.
 * @author 윤지현
 *
 */
@Repository
public class ShelterDAO implements IShelterDAO{

	@Autowired
	private SqlSessionTemplate template;

	@Override
	public List<ShelterDTO> list(HashMap<String, String> map) {
		
		return template.selectList("shelter.list", map);
	}

	
	@Override
	public List<ShelterDTO> get(String seqShelter) {
		
		return template.selectList("shelter.get", seqShelter);
	}
	

	
	@Override
	public List<LocationDTO> location() {
		
		return template.selectList("shelter.location");
	}
	
	@Override
	public List<LocationDetailDTO> locationDetail() {
		
		return template.selectList("shelter.locationDetail");
	}


	@Override
	public int edit(ShelterDTO sdto) {
		
		return template.update("shelter.edit",sdto);
	}


	@Override
	public int getTotalCount(HashMap<String, String> map) {
		
		return template.selectOne("shelter.count",map);
	}


	@Override
	public int add(ShelterDTO sdto) {
		
		return template.insert("shelter.add", sdto);
	}


	@Override
	public int delete(String seqShelter) {
		// TODO Auto-generated method stub
		return 0;
	}






	
}
