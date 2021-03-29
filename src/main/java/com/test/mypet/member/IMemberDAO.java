package com.test.mypet.member;

import java.util.List;

import org.springframework.stereotype.Repository;

/**
 * 멤버 db작업 전담 인터페이스
 * @author 노푸른
 *
 */
@Repository
public interface IMemberDAO {
	
	// 로그인(유저)
	/**
	 * 유저 로그인 메소드
	 * @param dto 유저 객체
	 * @return 유저 정보
	 */
	public MemberDTO memberLogin(MemberDTO dto);
	
	// 로그인(관리자)
	/**
	 * 관리자 로그인 메소드
	 * @param dto_admin 관리자 객체
	 * @return 관리자 정보
	 */
	public AdminDTO adminLogin(AdminDTO dto_admin);

	/**
	 * 채팅 리스트 출력 메소드
	 * @param user_id 유저 아이디
	 * @return 채팅 리스트
	 */
	public List<ChatMessageDTO> list(String user_id);

	/**
	 * 채팅 내용 db저장 메소드
	 * @param dto 채팅 객체
	 * @return 채팅 내용
	 */
	public int addlist(ChatMessageDTO dto);

	/**
	 * 회원가입 진행 메소드
	 * @param ndto 멤버 객체
	 */
	public void register(MemberDTO ndto);

	/**
	 * 유저 아이디 중복체크 메소드
	 * @param id 유저 아이디
	 * @return 중복체크 결과
	 */
	public int idCheck(String id);

	
}
