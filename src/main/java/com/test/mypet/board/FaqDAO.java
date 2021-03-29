package com.test.mypet.board;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
/***
 * FAQ 게시판의 DAO입니다.
 * @author 윤지현
 *
 */
@Repository
public class FaqDAO implements IFaqDAO{

	@Autowired
	private SqlSessionTemplate template;
	
	//FAQ 글 목록 반환 메소드
	@Override
	public List<FaqDTO> list() {
		
		return template.selectList("faq.list");
	}

	//FAQ 정보 메소드
	@Override
	public FaqDTO get(String seqFaq) {
		
		return template.selectOne("faq.get", seqFaq);
	}

	//FAQ 등록 메소드
	@Override
	public int add(FaqDTO fdto) {
		
		return template.insert("faq.add", fdto);
	}

	//FAQ 총 게시글 수 메소드
	@Override
	public int getTotalCount(HashMap<String, String> map) {
		
		return template.selectOne("faq.count",map);
	}

	//FAQ 수정 메소드
	@Override
	public int edit(FaqDTO fdto) {
		
		return template.update("faq.edit", fdto);
	}

	//FAQ 삭제 메소드
	@Override
	public int delete(String seqFaq) {
		
		return template.delete("faq.delete", seqFaq);
	}

}
