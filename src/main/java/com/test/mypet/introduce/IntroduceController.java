package com.test.mypet.introduce;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 마이펫 소개 페이지 출력 메소드 관리 클래스
 * @author Blue
 *
 */
@Controller
public class IntroduceController {

	/**
	 * 마이펫 소개페이지 출력을 위한 메소드
	 * @param request 자원을 전달할 변수
	 * @param response 자원을 받아올 변수
	 * @param session 세션 객체
	 * @return 마이펫 소개페이지
	 */
	@RequestMapping(value = "/mypetintroduce/introduce.action", method = { RequestMethod.GET })
	public String introduce(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		return "mypetintroduce/introduce";

	}
	
}
