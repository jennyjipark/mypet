package com.test.mypet.statistic;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * 통계자료의 DAO 클래스입니다.
 * @author 이대홍
 *
 */

@Repository
public class StatisticDAOImpl implements IStatisticDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	/**
	 * 통계자료의 전체 정보를 돌려주는 메소드 입니다.
	 */
	
	@Override
	public VwAnimalDataDTO list(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		
		System.out.println("map.get()"+map.get("ymdate")+"map.get()"+map.get("location"));
		
		if(map.get("ymdate").equals("없음")&&map.get("location").equals("없음")) {
			
			return template.selectOne("stat.listAll");
		
		} else if (map.get("ymdate").equals("없음")) {
			
			String location = map.get("location");
			
			return template.selectOne("stat.listLocation",location);		
		
		} else if (map.get("location").equals("없음")) {
		
			String ymdate = map.get("ymdate");
			return template.selectOne("stat.listYmdate", ymdate);	
		}
		
		return template.selectOne("stat.list",map);
	}
	
	/**
	 * 통계자료의 회귀분석을 위한 데이터를 넘겨주는 메소드 입니다.
	 */
	
	@Override
	public List<VwAnimalDataDTO> listReg() {
		
		
		return template.selectList("stat.listReg");
	}
	/**
	 * 통계자료의 지도 표시값을 위한 데이터를 넘겨주는 메소드입니다.
	 */
	
	
	@Override
	public List<VwAnimalDataDTO> listMap() {
		// TODO Auto-generated method stub
		return template.selectList("stat.listMap");
	}
	
	
	/**
	 * 통계자료의 단순 전체 수치값을 넘겨주는 메소드 입니다.
	 */
	
	
	@Override
	public VwCountDTO count() {
		// TODO Auto-generated method stub
		return template.selectOne("stat.count");
	}
	
}











