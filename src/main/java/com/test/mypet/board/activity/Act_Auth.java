package com.test.mypet.board.activity;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 활동게시판의 사용자 인증 체크 클래스 입니다.
 * @author 이대홍
 *
 */

@Aspect
@Component
public class Act_Auth {

	@Autowired
	private IActivityDAO dao;

	
	/**
	 * 주 업무 메소드 받아오기
	 */
	// 번호 없으면 내쫒기
	@Pointcut("execution(public * com.test.mypet.board.activity.ActivityController.act_write(..))")
	public void pc1() {

	}

	/**
	 * 주업무 메소드의 실행 전 사용자가 인증되어있는지를 체크하는 메소드 입니다. 
	 * @param joinPoint
	 */
	@Before("pc1()")
	public void admin(JoinPoint joinPoint) {

		HttpServletRequest request = (HttpServletRequest) joinPoint.getArgs()[0];
		HttpServletResponse response = (HttpServletResponse) joinPoint.getArgs()[1];
		String seqAdmin = (String) joinPoint.getArgs()[3];

		if (seqAdmin == null) {
			System.out.println("잘못된 접속입니다.");
			/*알고만 있기 !!
			try {

				PrintWriter writer = response.getWriter();
				writer.print("<html><body>");
				writer.print("<script>");
				writer.print("alert('alert_admin_check'); history.back();");
				writer.print("</script>");
				writer.print("</body></html>");
				writer.close();

			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("pointcut" + e);
			}
			*/
		}

	}

}
