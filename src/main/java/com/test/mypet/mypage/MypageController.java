package com.test.mypet.mypage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.mypet.adoption.IReservationDAO;
import com.test.mypet.adoption.VwReservationDTO;

/**
 * 마이페이지 관련 컨트롤러 클래스입니다.
 * @author 이준오
 *
 */
@Controller
public class MypageController {
	
	@Autowired
	private IReservationDAO dao;
	
	/**
	 * 예약신청서 목록 요청 및 페이지 출력 메소드
	 * @param request 자원을 전달할 변수입니다.
	 * @param response 자원을 받아올 변수입니다.
	 * @param session 세션 객체입니다.
	 * @return 마이페이지 > 입양예약현황 페이지 출력.
	 */
	@RequestMapping(value="/mypage/reservationlist.action")
	public String reservationList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		session.setAttribute("seqUser", "6");
		
		List<VwReservationDTO> list = dao.getMyReservationList((String)session.getAttribute("seqUser"));
		
		List<VwReservationDTO> nlist = dao.getMyReservationListWithNoResponse((String)session.getAttribute("seqUser"));
		
		List<VwReservationDTO> slist = dao.getMyReservationListShelter((String)session.getAttribute("seqUser"));
		
		List<VwReservationDTO> snlist = dao.getMyReservationListShelterWithNoResponse((String)session.getAttribute("seqUser"));
		
		
		request.setAttribute("list", list);
		request.setAttribute("nlist", nlist);
		request.setAttribute("slist", slist);
		request.setAttribute("snlist", snlist);
		
		
		return "mypage/reservation_list";		
	}
	
	/**
	 * 예약신청서 세부정보 요청 및 페이지 출력 메소드
	 * @param request 자원을 전달할 변수입니다.
	 * @param response 자원을 받아올 변수입니다.
	 * @param session 세션 객체입니다.
	 * @param seqReservation 예약신청서 객체입니다.
	 * @return 마이페이지 > 입양예약현황 > 입양예약신청서 세부정보 페이지 출력.
	 */
	@RequestMapping(value="/mypage/reservationview.action")
	public String reservationView(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seqReservation) {
		
		VwReservationDTO dto = dao.getReservationView(seqReservation);
		
		request.setAttribute("dto", dto);
		
		return "mypage/reservation_view";		
	}
	
	

	
}
