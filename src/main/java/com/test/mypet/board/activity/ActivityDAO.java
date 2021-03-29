package com.test.mypet.board.activity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * 활동게시판의 DAO 클래스입니다.
 * 
 * @author 이대홍
 *
 */

@Repository
public class ActivityDAO implements IActivityDAO{

	@Autowired
	private SqlSessionTemplate template;

	
	/**
	 * 활동의 전체 게시글 반환 메소드입니다.
	 */
	
	@Override
	public List<ActivityDTO> list(HashMap<String, String> map) {

//		String where = 
//				String.format(" where rownum between %s and %s ",map.get("begin"),map.get("end"));
//		
//		System.out.println("where : "+ where);
//		System.out.println("DAO.list");
		
		System.out.println(  map.get("search") +map.get("begin")+map.get("end") );
		
		if( map.get("search") != null) {
			System.out.println("검색어 있음");
			return template.selectList("activity.act_list_search", map);
		}
		
		return template.selectList("activity.act_list", map);
	}
	
	
	/**
	 * 활동 게시글 1개를 반환하는 메소드입니다.
	 */
	@Override
	public ActivityDTO view(String seqActivity) {
		// TODO Auto-generated method stub		
		return template.selectOne("activity.act_view",seqActivity);
	}


	/**
	 * 활동 게시글의 전체 갯수를 반환하는 메소드 입니다.
	 */

	@Override
	public int totalCount(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		
		return template.selectOne("activity.act_count");
	}
	
	/**
	 * 활동 게시글 작성 메소드입니다.
	 */
	
	@Override
	public int writer(ActivityDTO dto) {

		System.out.println(" writer  이건.. 흠 그냥 입력하지 마세요 에러 납니다. insert 문을 마음대로 입력했습니다." );
		
		return template.insert("activity.act_write",dto);
	}
	/**
	 * 금월 달력용 리스트 출력
	 */
	
	@Override
	public List<ActivityDTO> list_info() {
		
		return template.selectList("activity.act_list_info");	
	}
	
}

