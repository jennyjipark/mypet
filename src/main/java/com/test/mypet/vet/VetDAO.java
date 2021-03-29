package com.test.mypet.vet;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/***
 * 동물병원 DAO입니다.
 * @author 윤지현
 *
 */
@Repository
public class VetDAO implements IVetDAO{
	
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public List<VetDTO> list(HashMap<String, String> map) {
		
		return template.selectList("vet.list", map);
	}

	@Override
	public VetDTO get(String seqVet) {
		
		
		return template.selectOne("vet.get", seqVet);
		
	}

	@Override
	public int edit(VetDTO vdto) {
		
		return template.update("vet.edit",vdto); 
	}

	@Override
	public int getTotalCount(HashMap<String, String> map) {
		
		return template.selectOne("vet.count",map);
	}

	@Override
	public int add(VetDTO vdto) {
		
		return template.insert("vet.add", vdto);
	}

	@Override
	public int delete(String seqVet) {
		
		return template.delete("vet.delete", seqVet);
	}


}
