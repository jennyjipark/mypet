package com.test.mypet.adoption;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.mypet.board.VolunteerDTO;
import com.test.mypet.goods.GoodsDTO;
import com.test.mypet.goods.IGoodsDAO;
import com.test.mypet.member.MemberDTO;

/**
 * 입양하기 관련 컨트롤러 클래스입니다.
 * @author 이준오, 박지현
 *
 */
@Controller
public class AdoptionController {
	
	@Autowired
	private IReservationDAO dao;
	
	@Autowired
	private IGoodsDAO gdao;

	@Autowired
	private IAdoptionDAO adao;


	/**
	 * 
	 * @param request
	 * @param response
	 * @param session 
	 * @param species 동물종류
	 * @param seqAdoption 동물번호
	 * @return 입양글 리스트 페이지 출력
	 */
	//http://localhost:8090/mypet/adoption/list.action
	@RequestMapping(value = "/adoption/list.action", method = { RequestMethod.GET })
	public String adoptionList(HttpServletRequest request, HttpServletResponse response, HttpSession session, String species, String seqAdoption) {
		
		
		AdoptionDTO dto = new AdoptionDTO();
		
		String seqUser = "";
				
		//세션에서 유저 아이디 받아오기
		String id = (String)session.getAttribute("id");
		
		if(id == null) {
			dto.setSeqUser(null);			
		} else {
			dto = adao.getSeqUser(id);			
		}
		
		seqUser = dto.getSeqUser();
					
		//회원번호
		session.setAttribute("seqUser", seqUser);
		
		
		//찜하기 중복검사
		/* List<AdoptionDTO> uList = adao.getLikesUser(seqUser); */
		
		//검색
		String search = request.getParameter("search");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("species", species);
		map.put("seqUser", seqUser);
		map.put("seqAdoption", seqAdoption);
		
		System.out.println("검색어: " + map);
		
		//페이징
		int nowPage = 0;		//현재 페이지 번호
		int totalCount = 0;		//총 게시물 수
		int pageSize = 9;		//한페이지당 출력 개수
		int totalPage = 0;		//총 페이지 수
		int begin = 0;			//rnum 시작 번호
		int end = 0;			//rnum 끝 번호
		int n = 0;				//페이지바 관련 변수
		int loop = 0;			//페이지바 관련 변수
		int blockSize = 9;		//페이지바 관련 변수
								
								
		String page = request.getParameter("page");
								
		if (page == null || page == "") {
			//기본 -> page = 1
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
								
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize -1;
								
		//우리가만든 해쉬맵은 스트링이기 때문에 begin과 end도 문자열로 만들어서 넘기기.
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		
		List<AdoptionDTO> list = adao.getList(map);
		List<AdoptionDTO> AllList = adao.getAllList(map);
		List<AdoptionDTO> userList = adao.getUserList(map);
		
		//이미지는 하나만 넣을 것
		for (int i=0; i<list.size(); i++) {
		
			if(list.get(i).getImg() == null) {
				
				//더미데이터 이미지
				/*
				 * String pic = Integer.toString((int)(Math.random() * 10) + 1);
				 * list.get(i).setImg(pic +".jpg");
				 */
				
				list.get(i).setImg("nopic.png");
				
			} else {
				
				String[] img = list.get(i).getImg().split(",");
				
				list.get(i).setImg(img[0]);
			}
			
		}
		
		
		//이미지는 하나만 넣을 것
		for (int i=0; i<userList.size(); i++) {
				
			if(userList.get(i).getImg() == null) {
						
				userList.get(i).setImg("nopic.png");
						
			} else {
						
				String[] img = userList.get(i).getImg().split(",");
						
				userList.get(i).setImg(img[0]);
			}
					
		}
		
		
		totalCount = adao.getTotalCount(map);
		
		System.out.println("카운트!!!!!!!!!!" + totalCount);
		
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
						
		String pagebar = "";
						
		loop = 1;
		n = ((nowPage -1) / blockSize) * blockSize +1;
						
						
		if ( n == 1 ) {
			pagebar += String.format("<li class='disabled'>"
									+ "            <a href=\"#!\" aria-label=\"Previous\">"
									+ "                <span aria-hidden=\"true\">&laquo;</span>"
									+ "            </a>"
									+ "        </li>");			
		} else {
			
			if(species != null ) {
				pagebar += String.format("<li>"
						+ "            <a href=\"/mypet/adoption/list.action?species=%s&page=%d\" aria-label=\"Previous\">"
						+ "                <span aria-hidden=\"true\">&laquo;</span>"
						+ "            </a>"
						+ "        </li>", species, n - 1);
				
			} else if (search != null) {
				pagebar += String.format("<li>"
						+ "            <a href=\"/mypet/adoption/list.action?search=%s&page=%d\" aria-label=\"Previous\">"
						+ "                <span aria-hidden=\"true\">&laquo;</span>"
						+ "            </a>"
						+ "        </li>", search, n - 1);
			} else {
				pagebar += String.format("<li>"
						+ "            <a href=\"/mypet/adoption/list.action?page=%d\" aria-label=\"Previous\">"
						+ "                <span aria-hidden=\"true\">&laquo;</span>"
						+ "            </a>"
						+ "        </li>", n - 1);
				
			}
			
			
							
		}
		
						
		while (!(loop > blockSize || n > totalPage)) {
							
			if (nowPage == n) {
				pagebar += "<li class='active'>";				
			} else {
				pagebar += "<li>";								
			}
							
				pagebar += String.format("<a href=\"/mypet/adoption/list.action?&page=%d\">%d</a></li>", n, n);
						
					loop++;
					n++;
		}

						
			//다음 페이지로 이동
			if (n > totalPage) { 
					//링크에 샵만 있으면 맨위로 올라가므로 #뒤에 ! 붙여주기.
				pagebar += String.format("<li class='disabled'>"
									+ "            <a href=\"#!\" aria-label=\"Next\">"
									+ "                <span aria-hidden=\"true\">&raquo;</span>"
									+ "            </a>"
									+ "        </li>");
							
			} else { //여전히 다음페이지가 존재하는 경우엔 링크 있는 애로 생성.			
				
				if(species != null) {
					
				
					pagebar += String.format("<li>"
									+ "            <a href=\"/mypet/adoption/list.action?species=%s&page=%d\" aria-label=\"Next\">"
									+ "                <span aria-hidden=\"true\">&raquo;</span>"
									+ "            </a>"
									+ "        </li>", species, n);
			
				} else if(search != null){
					pagebar += String.format("<li>"
							+ "            <a href=\"/mypet/adoption/list.action?search=%s&page=%d\" aria-label=\"Next\">"
							+ "                <span aria-hidden=\"true\">&raquo;</span>"
							+ "            </a>"
							+ "        </li>", search, n);
					
				} else {
					pagebar += String.format("<li>"
							+ "            <a href=\"/mypet/adoption/list.action?page=%d\" aria-label=\"Next\">"
							+ "                <span aria-hidden=\"true\">&raquo;</span>"
							+ "            </a>"
							+ "        </li>", n);
				}
			}
						
						
		//2.
		request.setAttribute("search", search);
		request.setAttribute("pagebar", pagebar);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("list", list);
		request.setAttribute("userList", userList);
		
		//찜하기
		/* request.setAttribute("uList", uList); */
		request.setAttribute("AllList", AllList);
		request.setAttribute("species", species);
		request.setAttribute("seqUser", seqUser);
		
		return "adoption/list";

	}
	

	/**
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param seqAdoption 입양글 번호
	 * @param seqUser 유저 번호
	 * 
	 * 회원번호와 입양글 번호를 가져온 후 찜하기 테이블에 넣는 메서드
	 */
	//http://localhost:8090/mypet/adoption/likesOk.action
	@RequestMapping(value = "/adoption/likesOk.action", method = { RequestMethod.GET })
	public void likes(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seqAdoption, String seqUser) {
		
		
		System.out.println("글번호: " + seqAdoption);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("seqAdoption", seqAdoption);
		map.put("seqUser", seqUser);
		
		//찜하기 수 올리기
		int result = adao.getLikes(seqAdoption);
		
		//찜하기 테이블에 넣기
		int insert = adao.insertLikes(map);
		
		System.out.println("결과 : " + result);
		System.out.println("결과 : " + insert);
		
		
		try {
			if (result == 1) {
				response.setContentType("text/html; charset=UTF-8");

				PrintWriter writer = response.getWriter();
				writer.print("<html><body>");
				writer.print("<script>");	
				writer.print("alert('찜목록에 추가되었습니다.');");
				writer.print("history.back();");
				writer.print("</script>");
				writer.print("</body></html>");
				
				writer.close();
			} else {
				PrintWriter writer = response.getWriter();
				writer.print("<html><body>");
				writer.print("<script>");
				writer.print("alert('이미 찜목록에 있습니다.');");
				writer.print("history.back();");
				writer.print("</script>");
				writer.print("</body></html>");
				
				writer.close();
			}
		} catch(Exception e) {
			System.out.println(e);
		}
								
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param seqAdoption 입양글 번호
	 * @return 입양글 상세보기 페이지 출력
	 */
	@RequestMapping(value = "/adoption/view.action", method = { RequestMethod.GET })
	public String adoptionView(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seqAdoption) {
		
		AdoptionDTO dto = new AdoptionDTO();
		
		String seqUser = "";
				
		//세션에서 유저 아이디 받아오기
		String id = (String)session.getAttribute("id");
		
		if(id == null) {
			dto.setSeqUser(null);			
		} else {
			dto = adao.getSeqUser(id);			
		}
		
		seqUser = dto.getSeqUser();
					
		//회원번호
		session.setAttribute("seqUser", seqUser);
				
		
		//이전글 & 다음글
		List<AdoptionDTO> fdto = adao.getForNext(seqAdoption);
		
		//상세보기
		dto = adao.getView(seqAdoption);
		
		request.setAttribute("dto", dto);
		request.setAttribute("fdto", fdto);
		request.setAttribute("seqUser", seqUser);
		request.setAttribute("seqAdoption", seqAdoption);
		
		return "adoption/view";

	}
	
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	//http://localhost:8090/mypet/adoption/write.action
	@RequestMapping(value="/adoption/write.action")
	public String adoptionwrite(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
							
		return "adoption/write";		
	}
	
	
	//http://localhost:8090/mypet/adoption/edit.action
	@RequestMapping(value="/adoption/edit.action")
	public String edit(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seqAdoption) {
		return "adoption.edit";		
	}
	
	
	//http://localhost:8090/mypet/adoption/del.action
	@RequestMapping(value="/adoption/del.action")
	public String del(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seqAdoption) {
		return "adoption.del";		
	}

	
	/**
	 * 입양하기 > 체크리스트 페이지 출력 메소드입니다.
	 * @param request 자원을 전달할 변수입니다.
     * @param response 자원을 받아올 변수입니다.
     * @param session 세션 객체입니다.
	 * @return 체크리스트 페이지 출력.
	 */
	//http://localhost:8090/mypet/adoption/checklist.action
	@RequestMapping(value="/adoption/checklist.action", method={RequestMethod.GET})
	public String checklist(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		System.out.println(session.getAttribute("seqUser"));
		System.out.println(session.getAttribute("id"));
		return "adoption/checklist";		
	}
	
	/**
	 * 체크리스트 > 입양예약신청서 작성 페이지 출력 메소드입니다.
	 * @param request 자원을 전달할 변수입니다.
     * @param response 자원을 받아올 변수입니다.
     * @param session 세션 객체입니다.
	 * @return 입양예약신청서 작성 페이지 출력.
	 */
	//http://localhost:8090/mypet/adoption/writereservation.action
	@RequestMapping(value="/adoption/writereservation.action", method={RequestMethod.GET})
	public String writeReservation(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		//임시 session값 부여
//		session.setAttribute("seqUser", "6");
//		session.setAttribute("id", "red1234");
//		System.out.println(session.getAttribute("seqUser"));
//		System.out.println(session.getAttribute("id"));

		VwReservationDTO dto = dao.getUserInfo(session.getAttribute("id"));
		
		String address = dto.getAddress();
		String temp[] = address.split(" ");
		address = temp[1];
		System.out.println(address);
		
		List<VetDTO> list = dao.getVetList(address);
		
		//회원정보
		request.setAttribute("dto", dto);
		//동물병원
		request.setAttribute("list", list);
		
		return "adoption/write_reservation";		
	}
	
	/**
	 * 작성한 입양예약신청서 내용확인 페이지 출력 메소드입니다.
	 * @param request 자원을 전달할 변수입니다.
     * @param response 자원을 받아올 변수입니다.
     * @param session 세션 객체입니다.
	 * @param dto 입양예약신청 객체입니다.
	 * @return 입양예약신청서 내용확인 페이지 출력.
	 */
	//http://localhost:8090/mypet/adoption/viewreservation.action
	@RequestMapping(value="/adoption/viewreservation.action", method={RequestMethod.POST})
	public String viewReservation(HttpServletRequest request, HttpServletResponse response, HttpSession session	
			,VwReservationDTO dto) {	//1.
		
		//1. 데이터 가져오기
		//2. 데이터 통해 페이지에 출력
		
				
		request.setAttribute("dto", dto);
		
		return "adoption/view_reservation";		
	}
	/**
	 * 입양예약신청서 추가 DB작업 요청 및 추가 완료 후 안내 페이지 출력 메소드입니다.
	 * @param request 자원을 전달할 변수입니다.
     * @param response 자원을 받아올 변수입니다.
     * @param session 세션 객체입니다.
	 * @param dto 입양예약신청 객체입니다.
	 * @return 예약완료 후 안내 페이지 출력.
	 */
	//http://localhost:8090/mypet/adoption/sendreservation.action
	@RequestMapping(value="/adoption/sendreservation.action", method={RequestMethod.POST})
	public String sendReservation(HttpServletRequest request, HttpServletResponse response, HttpSession session
			,VwReservationDTO dto) {
		
		dao.insertReservation(dto);
		HashMap<String, String> map = new HashMap<String, String>();
		
		int c = gdao.getTotalCount(map);
		String count = c + "";
		
		map.put("begin", "1");
		map.put("end", count);
		
		List<GoodsDTO> glist = gdao.list(map);
		
		
		request.setAttribute("glist", glist);
		
		return "adoption/send_reservation";		
	}

	
}
