package com.test.mypet.board;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.test.mypet.vet.VetDTO;


/**
 * 게시판 관련 컨트롤러 클래스입니다.
 * @author 박지현, 윤지현, 이준오
 *
 */

@Controller
public class BoardController {
	

	@Autowired
	IAdoptionReviewDAO ardao;
	
	//박지현
	@Autowired
	IVolunteerDAO volunteerDAO;
	
	//http://localhost:8090/mypet/board/template_list.action
	@RequestMapping(value = "/board/template_list.action", method = { RequestMethod.GET })
	public String template(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		return "board/template_list";

	}
	
	
	
	//http://localhost:8090/mypet/board/template_view.action
	@RequestMapping(value = "/board/template_view.action", method = { RequestMethod.GET })
	public String view(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		return "board/template_view";

	}
	
	//http://localhost:8090/mypet/board/template_write.action
	@RequestMapping(value = "/board/template_write.action", method = { RequestMethod.GET })
	public String write(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		return "board/template_write";

	}
		
		
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @return 봉사활동 리스트
	 */
	//http://localhost:8090/mypet/board/volunteerList.action
	@RequestMapping(value = "/board/volunteerList.action", method = { RequestMethod.GET })
	public String volunteer_list(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		
		VolunteerDTO dto = new VolunteerDTO();
		String seqUser = "";
				
		//세션에서 유저 아이디 받아오기
		String id = (String)session.getAttribute("id");
		if(id == null) {
			dto.setSeqUser(null);			
		} else {
			dto = volunteerDAO.getSeqUser(id);			
		}
		
		seqUser = dto.getSeqUser();
					
		//회원번호
		session.setAttribute("seqUser", seqUser);
		
		//검색
	    String search = request.getParameter("search");
	            
	    HashMap<String, String> map = new HashMap<String, String>();
	    map.put("search", search);
	            
	      	  
	    System.out.println("검색어: " + map);
	      
	    //페이징
	    int nowPage = 0;      //현재 페이지 번호
	    int totalCount = 0;      //총 게시물 수
	    int pageSize = 10;      //한페이지당 출력 개수
	    int totalPage = 0;      //총 페이지 수
	    int begin = 0;         //rnum 시작 번호
	    int end = 0;         //rnum 끝 번호
	    int n = 0;            //페이지바 관련 변수
	    int loop = 0;         //페이지바 관련 변수
	    int blockSize = 10;      //페이지바 관련 변수
	                        
	                        
	    String page = request.getParameter("page");
	                        
	    if (page == null || page == "") {
	         //기본 -> page = 1
	         nowPage = 1;
	      } else {
	         nowPage = Integer.parseInt(page);
	      }
	                        
	      begin = ((nowPage - 1) * pageSize) + 1;
	      end = begin + pageSize -1;
	                        
	      map.put("begin", begin + "");
	      map.put("end", end + "");
	      
	      
	      
	      totalCount = volunteerDAO.getTotalCount(map);
	      
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
	         
	         pagebar += String.format("<li>"
	                  + "            <a href=\"/mypet/board/volunteerList.action?page=%d\" aria-label=\"Previous\">"
	                  + "                <span aria-hidden=\"true\">&laquo;</span>"
	                  + "            </a>"
	                  + "        </li>", n - 1);
	            
	      }
	         
	         
	                     
	      
	      while (!(loop > blockSize || n > totalPage)) {
	                     
	         if (nowPage == n) {
	            pagebar += "<li class='active'>";            
	         } else {
	            pagebar += "<li>";                        
	         }
	                     
	            pagebar += String.format("<a href=\"/mypet/board/volunteerList.action?&page=%d\">%d</a></li>", n, n);
	                  
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
	            
	            pagebar += String.format("<li>"
	                     + "            <a href=\"/mypet/board/volunteerList.action?page=%d\" aria-label=\"Next\">"
	                     + "                <span aria-hidden=\"true\">&raquo;</span>"
	                     + "            </a>"
	                     + "        </li>", n);
	         }
	         
	         List<VolunteerDTO> volunteerList = volunteerDAO.list(map);            
	      request.setAttribute("search", search);
	      request.setAttribute("pagebar", pagebar);
	      request.setAttribute("nowPage", nowPage);
	      request.setAttribute("list", volunteerList);
	      request.setAttribute("seqUser", seqUser);
	      
	      
	      return "board/volunteer_list";


	}
	
	
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param seqVolunteer
	 * @return 봉사활동 상세정보
	 */
	//http://localhost:8090/mypet/board/volunteerView.action
	@RequestMapping(value = "/board/volunteerView.action", method = { RequestMethod.GET })
	public String volunteer_view(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seqVolunteer) {
		
		//세션에서 유저번호 받아오기
		String seqUser = (String) session.getAttribute("seqUser");
				
		List<VolunteerDTO> list = volunteerDAO.getView(seqVolunteer);
		
		//이전글, 다음글
		List<VolunteerDTO> fornext = volunteerDAO.getForNext(seqVolunteer);
		
		//봉사활동 seq의 max, min 번호
		List<VolunteerDTO> maxmin = volunteerDAO.getMaxMin();
		
		
		request.setAttribute("list", list);
		request.setAttribute("seqUser", seqUser);
		request.setAttribute("fornext", fornext);
		request.setAttribute("maxmin", maxmin);
		request.setAttribute("seqVolunteer", seqVolunteer);
		
		return "board/volunteer_view";

	}
		
		
	//http://localhost:8090/mypet/board/volunteerWrite.action
	@RequestMapping(value = "/board/volunteerWrite.action", method = { RequestMethod.GET })
	public String volunteer_write(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		return "board/volunteer_write";

	}
	
	
	//http://localhost:8090/mypet/board/volunteerEdit.action
	@RequestMapping(value = "/board/volunteerEdit.action", method = { RequestMethod.GET })
	public String volunteer_edit(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seqVolunteer) {

		return "board/volunteer_edit";

	}
	

	@RequestMapping(value = "/board/volunteerOk.action", method = { RequestMethod.GET })
	public String volunteer_ok(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seqVolunteer, String seqUser) {

		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("seqVolunteer", seqVolunteer);
		map.put("seqUser", seqUser);
		
		
		int result = volunteerDAO.applyVolunteer(map);
		
		
		try {			
			
			
			if(result == 1) {
				response.setContentType("text/html; charset=UTF-8");

				PrintWriter writer = response.getWriter();
				writer.print("<html><body>");
				writer.print("<script>");	
				writer.print("alert('봉사활동 신청 완료되었습니다.');");
				writer.print("history.back();");
				writer.print("</script>");
				writer.print("</body></html>");
				
				writer.close();
				
				
			} else {
				
				PrintWriter writer = response.getWriter();
				writer.print("<html><body>");
				writer.print("<script>");
				writer.print("alert('봉사활동 신청에 실패했습니다.');");
				writer.print("history.back();");
				writer.print("</script>");
				writer.print("</body></html>");
				
				writer.close();
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		
		return "board/volunteerOk";

	}
	
	
	@Autowired
	private IFaqDAO dao;
	
	/***
	 * FAQ 전체 목록 요청 및 페이지를 출력하는 메소드입니다.
	 * @param request 
	 * @param response
	 * @param session
	 * @return FAQ 글 목록 및 상세정보
	 */
	@RequestMapping(value = "/board/faqList.action", method = { RequestMethod.GET })
	public String faqList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		String seqUser = (String) session.getAttribute("seqUser");
		session.setAttribute("seqUser", seqUser);
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		String search = request.getParameter("search");
		
		if(!(search == null || search.contentEquals(""))) {
			map.put("search", search);
		}
		
		/* 페이징 */
		int nowPage = 0;		//현재 페이지 번호
		int totalCount = 0;		//총 게시물 수
		int pageSize = 10;		//한페이지 당 출력 개수
		int totalPage = 0;		//총 페이지 수
		int begin = 0;			//rnum 시작 번호
		int end = 0;			//rnum 끝 번호
		int n = 0;				//페이지바 관련 변수
		int loop = 0;			//페이지바 관련 변수
		int blockSize = 10;		//페이지바 관련 변수
		
		String page = request.getParameter("page");
		
		if (page == null || page == "") {
			//기본 -> page = 1
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		
		/* 페이지바 */
		totalCount = dao.getTotalCount(map); //총 게시물 수
		
		totalPage = (int)Math.ceil((double)totalCount / pageSize); //총 페이지 수
		
		
		String pagebar = "";
		
		loop = 1;
		n = ((nowPage - 1) / blockSize) * blockSize + 1;
		
		
		//이전 10페이지
		if (n == 1) {
			pagebar += String.format("<li class='disabled'>"
					+ "<a href=\"#!\" aria-label=\"Previous\">"
					+ "<<"
					+ "</a>"
					+ "</li>");
		} else {				
			pagebar += String.format("<li>"
					+ "<a href=\"/mypet/board/faqList.action?page=%d\" aria-label=\"Previous\">"
					+ "<<"
					+ "</a>"
					+ "</li>", n - 1);
		}
		
		
		
		while (!(loop > blockSize || n > totalPage)) {
			
			if (nowPage == n) {
				pagebar += "<li class='active'>";
			} else {
				pagebar += "<li>";
			}
			
			pagebar += String.format("<a href=\"/mypet/board/faqList.action?page=%d\">%d</a></li>", n, n);
			
			loop++;
			n++;
		}
		
		
		//다음 10페이지로 이동
		if (n > totalPage) {
			pagebar += String.format("<li class='disabled'>"
					+ "<a href=\"#!\" aria-label=\"Next\">"
					+ ">>"
					+ "</a>"
					+ "</li>");
		} else {
			pagebar += String.format("<li>"
					+ "<a href=\"/mypet/board/faqList.action?page=%d\" aria-label=\"Next\">"
					+ ">>"
					+ "</a>"
					+ "</li>", n);
		}
		
		List<FaqDTO> list = dao.list();
		
		request.setAttribute("seqUser", seqUser);
		request.setAttribute("list", list);
		request.setAttribute("search", search);
		request.setAttribute("pagebar", pagebar);
		request.setAttribute("nowPage", nowPage);
		
		return "board/faqList";

	}
	
	/***
	 * FAQ 글 등록페이지를 요청하는 메소드 입니다.
	 * @param request
	 * @param response
	 * @param session
	 * @return FAQ 게시판 글 등록
	 */
	@RequestMapping(value = "/board/faqAdd.action", method = { RequestMethod.GET })
	public String faqAdd(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		return "board/faqAdd";

	}
	
	/***
	 * FAQ 글 등록 DB작업을 요청하는 메소드 입니다.
	 * @param request
	 * @param response
	 * @param session
	 * @param fdto
	 */
	@RequestMapping(value = "/board/faqAddok.action", method = { RequestMethod.POST })
	public void faqAddok(HttpServletRequest request, HttpServletResponse response, HttpSession session, FaqDTO fdto) {
		
		int result = dao.add(fdto);
		
		try {
			
			if(result == 1) {
				response.sendRedirect("/mypet/board/faqList.action");
			}else {
				response.sendRedirect("/mypet/board/faqAdd.action");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/***
	 * FAQ 글 수정페이지를 요청하는 메소드입니다.
	 * @param request
	 * @param response
	 * @param session
	 * @param seq 글 번호
	 * @return FAQ 글 수정
	 */
	@RequestMapping(value = "/board/faqEdit.action", method = { RequestMethod.GET })
	public String faqEdit(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seq) {

		FaqDTO fdto = dao.get(seq);
		
		request.setAttribute("fdto", fdto);
		
		return "board/faqEdit";

	}
	
	/***
	 * FAQ 게시판 글 수정 DB작업을 요청하는 메소드입니다.
	 * @param request
	 * @param response
	 * @param session
	 * @param fdto
	 */
	@RequestMapping(value="/board/faqEditok.action", method = { RequestMethod.POST })
	public void editok(HttpServletRequest request, HttpServletResponse response, HttpSession session, FaqDTO fdto) {
		
		int result = dao.edit(fdto);
		
		try {
			if(result == 1) {
				response.sendRedirect("/mypet/board/faqView.action?seqFaq=" + fdto.getSeqFaq());
			}else {
				response.sendRedirect("/mypet/board/faqEdit.action?seqFaq=" + fdto.getSeqFaq());
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	/***
	 * FAQ 게시판 글 삭제 DB작업을 요청하는 메소드 입니다. 
	 * @param request
	 * @param response
	 * @param session
	 * @param seqFaq
	 */
	@RequestMapping(value = "/board/faqDeleteok.action", method = { RequestMethod.GET })
	public void faqDelete(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seqFaq) {

		int result = dao.delete(seqFaq);
		
		try {
			if (result == 1) {
				response.sendRedirect("/mypet/board/faqList.action");
			} else {
				response.sendRedirect("/mypet/board/faqView.action?seqFaq=" + seqFaq);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

	}
  
   
      
//준오님
   /**
    * 입양후기 전체 목록을 요청 및 페이지를 출력하는 메소드
    * @param request 자원을 전달할 변수입니다.
    * @param response 자원을 받아올 변수입니다.
    * @param session 세션 객체입니다.
    * @return 입양후기 게시판 메인 페이지 출력.
    */
   @RequestMapping(value = "/board/adoptionreviewlist.action", method = { RequestMethod.GET })
   public String adoptionReviewList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
//	   임시세션값
//	   session.setAttribute("id", "red1234");
	   
	   List<AdoptionReviewDTO> rlist = ardao.getList();
	   
	   request.setAttribute("rlist", rlist);
	   
	   return "board/adoptionreviewList";
	   
   }
   
   /**
    * 입양후기 게시글 정보를 요청 및 페이지를 출력하는 메소드
    * @param request 자원을 전달할 변수입니다.
    * @param response 자원을 받아올 변수입니다.
    * @param session 세션 객체입니다.
    * @param seqAdoptionReview 입양후기 번호입니다.
    * @return 입양후기 게시판 > 입양후기 게시글 페이지 출력.
    */
   @RequestMapping(value = "/board/adoptionreviewview.action", method = { RequestMethod.GET })
   public String adoptionReviewView(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seqAdoptionReview) {
	   
	   String id = (String)session.getAttribute("id");
	   String seqUser = ardao.getSeqUser(id);
	   //임시 로그인 하고있는 회원 번호 설정
	   //session.setAttribute("seqUser", seqUser);
	   
	   
	   AdoptionReviewDTO dto = ardao.getInfo(seqAdoptionReview);
	   
	   String lseq = ardao.selectSeq();
	   System.out.println("=================================================="+lseq);
	   dto.setLseq(lseq);
	   
	   int vcount = Integer.parseInt(dto.getViewCount());
	   vcount++;
	   String temp = vcount + "";
	   dto.setViewCount(temp);

	   ardao.updateViewCount(dto);
	   	   
	   request.setAttribute("dto", dto);
	   
	   return "board/adoptionreviewView";
	   
   }
   /**
    * 입양후기 게시글 작성페이지를 요청하는 메소드
    * @param request 자원을 전달할 변수입니다.
    * @param response 자원을 받아올 변수입니다.
    * @param session 세션 객체입니다.
    * @return 입양후기 게시판 > 게시글작성 페이지 출력.
    */
   @RequestMapping(value = "/board/adoptionreviewwrite.action", method = { RequestMethod.GET })
   public String adoptionReviewWrite(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
	   //임시로 부여한 세션(회원 로그인)
	   //session.setAttribute("id", "mola991011");
	   
	   
	   return "board/adoptionreviewWrite";
	   
   }
   
   /**
    * 입양후기 게시글 작성 DB작업을 요청하는 메소드
    * @param request 자원을 전달할 변수입니다.
    * @param response 자원을 받아올 변수입니다.
    * @param session 세션 객체입니다.
    * @param title 게시글 제목입니다.
    * @param content 게시글 내용 본문입니다.
    */
   @RequestMapping(value = "/board/adoptionreviewwriteok.action", method = { RequestMethod.POST })
   public void adoptionReviewWriteOk(HttpServletRequest request, HttpServletResponse response, HttpSession session, String title, String content) {
	   
	   //필요 정보 가져오기.
	   try {
	   String id = (String)session.getAttribute("id");
	   String seqUser = ardao.getSeqUser(id);

	   //DTO로 묶어서 insert문으로 보냄 DB작업
	   AdoptionReviewDTO dto = new AdoptionReviewDTO();
	   dto.setSeqUser(seqUser);
	   dto.setTitle(title);
	   dto.setContent(content);
	   
	   int result = ardao.insertReview(dto);
	   //방금 등록한 번호 가져오기.
	   String seqAdoptionReview = ardao.selectSeq();
	   
	   dto.setSeqAdoptionReview(seqAdoptionReview);
	   
	   //2. 첨부 파일 처리하기
	   MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;
	   
	   //첨부파일 참조 객체
	   // - <input type="file" name="attach">
	   MultipartFile attach = multi.getFile("attach");

		System.out.println(attach.getName());	//attach 
		System.out.println(attach.getOriginalFilename());	//프로젝트 css.txt 파일명
		System.out.println(attach.getSize());	//657 파일크기
		System.out.println(attach.getContentType());	//text/plain 파일 포멧
		
		String filename = "";
		
		//업로드 파일이 어딨는지?? -> 임시 폴더에 저장 -> 우리가 원하는 폴더로 이동
		try {
			
			String path = request.getRealPath("/resources/images/review");//webapp > files
			System.out.println(path);
			
			filename = getFileName(path, attach.getOriginalFilename());
			
			//이동시킬 최종 경로 + 파일명
			
			//경로 : 학원
			String move1 = "E:\\4차 프로젝트(스프링)\\mypet\\MyPet\\src\\main\\webapp\\resources\\images\\review";
			//경로 : 집
			String move2 = "C:\\Users\\User\\Desktop\\mypet\\MyPet\\src\\main\\webapp\\resources\\images\\review";
			File file = new File(move2 + "\\" + filename);
			dto.setImage("/resources/images/review/"+filename);
			//무조건 덮어쓰기 -> 중복 방지 -> 넘버링 직접 구현..
			attach.transferTo(file); //renameTo()와 동일
			
		} catch (Exception e) {
			System.out.println(e);
		}
	   
	   if (filename!=null) {
		   result = ardao.insertImageReviewY(dto);
		   
	   } else {
		   
		   result = ardao.insertImageReview(dto);
	   }
	   

	   if (result!=0) {
		    response.setContentType("text/html; charset=UTF-8");

			PrintWriter writer = response.getWriter();
			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('입양 후기 등록이 성공하였습니다.');");
			writer.print("location.href='/mypet/board/adoptionreviewlist.action';");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
			
		} else {
			PrintWriter writer = response.getWriter();
			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('failed.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
		}
	   } catch (IOException e) {
		   e.printStackTrace();
	   }
	   
   }
   
   /**
    * 같은 이름의 파일이 있는지 검사하는 메소드
    * @param path 파일의 실제 저장된 경로입니다.
    * @param filename 파일명입니다.
    * @return 중복을 제거한 파일명을 반환합니다.
    */
	private String getFileName(String path, String filename) {
		
		
		//return System.currentTimeMillis() + "_" + filename; 
		
		//System.out.println(System.nanoTime());
		
		//return System.nanoTime() + "_" + filename;
		
		//dog.png -> dog_1.png -> dog_2.png
		
		//path = "files"
		//filename = "dog.png"
		
		int n = 1; //인덱스 숫자
		int index = filename.indexOf(".");
		String tempName = filename.substring(0, index); //"dog"
		String tempExt = filename.substring(index); //".png"
		
		while (true) {
			
			File file = new File(path + "\\" + filename); //files\dog.png
			
			if (file.exists()) {
				//있다 -> 중복 -> 파일명 수정
				filename = tempName + "_" + n + tempExt;
				n++;
				
			} else {
				//없다 -> 반환
				return filename;
			}
			
		}
		
	}
   
	/**
	 * 입양후기 게시글 정보를 요청 및 게시글 수정 페이지를 출력하는 메소드
	 * @param request 자원을 전달할 변수입니다.
     * @param response 자원을 받아올 변수입니다.
     * @param session 세션 객체입니다.
	 * @param seqAdoptionReview 입양후기 번호입니다.
	 * @return 입양후기 수정페이지 출력.
	 */
   //입양후기 수정 페이지
   @RequestMapping(value = "/board/adoptionreviewedit.action", method = { RequestMethod.GET })
   public String adoptionReviewEdit(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seqAdoptionReview) {
	   
	   AdoptionReviewDTO dto = ardao.getInfo(seqAdoptionReview);
	   
	   request.setAttribute("dto", dto);
	   
	   return "board/adoptionreviewEdit";
	   
   }
   
   /**
    * 입양후기 게시글 수정 DB작업을 요청하는 메소드
    * @param request 자원을 전달할 변수입니다.
    * @param response 자원을 받아올 변수입니다.
    * @param session 세션 객체입니다.
    * @param seqAdoptionReview 입양후기 번호입니다.
    * @param content 입양후기 본문입니다.
    * @param title 입양후기 제목입니다.
    */
   //입양후기 수정 DB작업
   @RequestMapping(value = "/board/adoptionrevieweditok.action", method = { RequestMethod.POST })
   public void adoptionReviewEditOk(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seqAdoptionReview, String content, String title) {
	   
	   System.out.println(seqAdoptionReview);
	   System.out.println(title);
	   System.out.println(content);

	   AdoptionReviewDTO dto = new AdoptionReviewDTO();
	   dto.setSeqAdoptionReview(seqAdoptionReview);
	   dto.setTitle(title);
	   dto.setContent(content);
	   
	   int result = ardao.updateReview(dto);
	   System.out.println(result);
	   try {
		   
		   if (result!=0) {
			    response.setContentType("text/html; charset=UTF-8");
	
				PrintWriter writer = response.getWriter();
				writer.print("<html><body>");
				writer.print("<script>");
				writer.print("alert('입양 후기 수정이 성공하였습니다.');");
				writer.print("location.href='/mypet/board/adoptionreviewlist.action';");
				writer.print("</script>");
				writer.print("</body></html>");
				
				writer.close();
				
			} else {
				PrintWriter writer = response.getWriter();
				writer.print("<html><body>");
				writer.print("<script>");
				writer.print("alert('failed.');");
				writer.print("history.back();");
				writer.print("</script>");
				writer.print("</body></html>");
				
				writer.close();
			}
	   } catch (IOException e) {
		   e.printStackTrace();
	   }	   
	   
   }
   
   /**
    * 입양후기 게시글 삭제 DB작업을 요청하는 메소드
    * @param request 자원을 전달할 변수입니다.
    * @param response 자원을 받아올 변수입니다.
    * @param session 세션 객체입니다.
    * @param seqAdoptionReview 입양후기 번호입니다.
    */
   //입양후기 삭제 DB작업
   @RequestMapping(value = "/board/adoptionreviewdelete.action", method = { RequestMethod.POST })
   public void adoptionReviewDelete(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seqAdoptionReview) {
	   
	   System.out.println(seqAdoptionReview);
	   
	   AdoptionReviewDTO dto = new AdoptionReviewDTO();
	   dto.setSeqAdoptionReview(seqAdoptionReview);
	   
	   
	   int result = ardao.deleteReview(dto);
	   
	   System.out.println(result);
	   
	   try {
		   
		   if (result!=0) {
			    response.setContentType("text/html; charset=UTF-8");
	
				PrintWriter writer = response.getWriter();
				writer.print("<html><body>");
				writer.print("<script>");
				writer.print("alert('입양 후기 삭제가 성공하였습니다.');");
				writer.print("location.href='/mypet/board/adoptionreviewlist.action';");
				writer.print("</script>");
				writer.print("</body></html>");
				
				writer.close();
				
			} else {
				PrintWriter writer = response.getWriter();
				writer.print("<html><body>");
				writer.print("<script>");
				writer.print("alert('failed.');");
				writer.print("history.back();");
				writer.print("</script>");
				writer.print("</body></html>");
				
				writer.close();
			}
	   } catch (IOException e) {
		   e.printStackTrace();
	   }	   
	      
	   
   }
   

}
   
   


