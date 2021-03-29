package com.test.mypet.member;

import org.springframework.beans.factory.annotation.Autowired;

/**
 * 맴버 서비스 객체
 * @author 노푸른
 *
 */
public class MemberService {
	
	/**
	 * 멤버 db작업 전담 인터페시으
	 */
	@Autowired
	IMemberDAO imemberDAO;

	// 로그인(유저)
	/**
	 * 멤버 로그인 메소드
	 * @param memberDTO 맴버 객체
	 * @return 로그인 완료 페이지
	 * @throws Exception 예외처리
	 */
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception {
		return imemberDAO.memberLogin(memberDTO);
	}
	
	// 로그인(관리자)
	/**
	 * 관리자 로그인 메소드
	 * @param adminDTO 관리자 객체
	 * @return 로그인 완료 페이지
	 * @throws Exception 예외처리
	 */
	public AdminDTO adminLogin(AdminDTO adminDTO) throws Exception {
		return imemberDAO.adminLogin(adminDTO);
	}
	
}
