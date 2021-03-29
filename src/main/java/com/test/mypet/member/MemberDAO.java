package com.test.mypet.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


/**
 * 멤버 db작업 전담 클래스
 * @author 노푸른
 *
 */
@Repository
public class MemberDAO implements IMemberDAO {

	/**
	 * db연동 객체
	 */
	@Autowired
	private SqlSessionTemplate template;
	
	/**
	 * 멤버 로그인 메소드
	 */
	@Override
	public MemberDTO memberLogin(MemberDTO dto) {

		return template.selectOne("member.login", dto);
	}

	/**
	 * 관리자 로그인 메소드
	 */
	@Override
	public AdminDTO adminLogin(AdminDTO dto_admin) {

		return template.selectOne("member.login_admin", dto_admin);
		
	}
	
	/**
	 * 채팅 리스트 물러오는 메소드
	 */
	@Override
	public List<ChatMessageDTO> list(String user_id) {

		return template.selectList("member.chatlist", user_id);
	}
	
	/**
	 * 채팅 내용 db에 추가하는 메소드
	 */
	@Override
	public int addlist(ChatMessageDTO chatMessageDto) {

		
		return template.insert("member.addlist", chatMessageDto);
	}
	
	/**
	 * 아이디 중복체크하는 메소드
	 */
	@Override
	public int idCheck(String id) {
		
		//int result = template.selectOne("member.idCheck", id);
		id = id.replace("=", "");
		int count = template.selectOne("member.idCheck", id);
		
		//str = str.replaceFirst(".$","");
		System.out.println("dao count : " + count);
		System.out.println("dao id : " + id);
		return count;
	}


	/**
	 * 회원가입하는 메소드
	 */
	@Override
	public void register(MemberDTO ndto) {
		
		template.insert("member.register", ndto);
		
	}
	
}
