package com.test.mypet.sponsor;

import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 보호소의 후원을 모집하고, 다양한 굿즈 회사의 광고를 소개하는 페이지입니다.
 * 
 * @author 이대홍
 *
 */

@Controller
public class SponsorController {

	@Autowired
	private ISponsorDAO dao;

	
	/**
	 * 
	 * @param request
	 * @param response 
	 * @param page 보소호 출력의 페이징 번호
	 * @return jsp 파일 
	 */
	
	@RequestMapping(value = "sponsor/view.action", method = { RequestMethod.GET })
	public String stat_view(HttpServletRequest request, HttpServletResponse response, String page) {

		HashMap<String, String> map = new HashMap<String, String>();

		String search = request.getParameter("search");

		if (!(search == null || search.trim().equals(""))) {
			map.put("search", search);
		}

		// 페이징
		int nowPage = 0; // 현재 페이지 번호
		int totalCount = 0; // 총 게시물 수
		int pageSize = 10; // 한페이지 당 출력 개수
		int totalPage = 0; // 총 페이지 수
		int begin = 0; // rnum 시작 번호
		int end = 0; // rnum 끝 번호
		int n = 0; // 페이지바 관련 변수
		int loop = 0; // 페이지바 관련 변수
		int blockSize = 10; // 페이지바 관련 변수

		if (page == null || page == "") {
			// 기본 -> page = 1
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}

		System.out.println("nowPage" + nowPage);

		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		map.put("begin", begin + "");
		map.put("end", end + "");

		totalCount = dao.totalCount(map); // 총 게시물 수

		System.out.println("totalcount " + totalCount);

		totalPage = (int) Math.ceil((double) totalCount / pageSize); // 총 페이지 수

		String pagebar = "";

		loop = 1;
		n = ((nowPage - 1) / blockSize) * blockSize + 1;

		// 이전10페이지
		if (n == 1) {
			pagebar += String.format("<li>" + "<a href=\"/mypet/sponsor/view.action\">" + "이전</a></li>");
		} else {
			pagebar += String.format("<li" + "<a href=\"/mypet/sponsor/view.action?page=%d\">" + "이전</a></li>", n - 1);
		}

		
		while (!(loop > blockSize || n > totalPage)) {

			if (nowPage == n) {
				pagebar += "<li>";
			} else {
				pagebar += "<li>";
			}

			pagebar += String.format("<a href=\"/mypet/sponsor/view.action?page=%d\">%d</a></li>", n, n);

			loop++;
			n++;
		}

		if (n > totalPage) {
			pagebar += String.format("<li><a href=\"/mypet/sponsor/view.action\">" + "다음</a></li> ");
		} else {
			pagebar += String.format("<li><a href=\"/mypet/sponsor/view.action?page=%d\">" + "다음</a></li>", n);
		}

		
		List<VwSponsorDTO> list = dao.list(map);
		System.out.println("list.size + "+ list.size());
		
		// 숫자 반환 
		 DecimalFormat df = new DecimalFormat("#,##0");
		 String list_All = dao.list_All();
			
		 for (VwSponsorDTO test : list ) {
				test.setSponSum( df.format( Integer.valueOf( test.getSponSum() ) ) );
		}
	
		request.setAttribute("list", list);
		request.setAttribute("search", search);
		request.setAttribute("pagebar", pagebar);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("sum", df.format(Integer.valueOf(list_All)));
		
		return "sponsor/view";
	}

	
	/**
	 * 보호소 선택시 하나의 보호소 정보를 ajax로 돌려주는 메소드
	 * @param seqShelter 보호소 번호 
	 * @param response 보호소 정보 ajax로 톨려 주는 페이지 
	 */
	
	@RequestMapping(value="/sponsor/viewtest.action", method={RequestMethod.GET})
	public void view_test(HttpServletResponse response,String seqShelter) {
		
		
		VwSponsorDTO dto = dao.getInfo(seqShelter);
		
		StringBuilder sb = new StringBuilder();
		
		sb.append(dto.getName()+"+");
		sb.append(dto.getAddress()+"+");
		sb.append(dto.getTel()+"+");
		sb.append(dto.getContent());

		
		String result =sb.toString();
		
		System.out.println("result"+result);
		response.setCharacterEncoding("UTF-8");
		
		
		try {
			PrintWriter writer = response.getWriter();
			
			writer.print(result);
			
			writer.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
	}
	
	/**
	 * 후원금 결제의 데이터를 받아 입력하는 메소드 입니다. 
	 * @param request
	 * @param response
	 * @param money 후원금
	 * @param content 후원 내용
	 */
	
	@RequestMapping(value="/sponsor/sponok.action", method={RequestMethod.POST})
	public void spon_ok(HttpServletRequest request, HttpServletResponse response, String money, String content) {
		
		System.out.println("money"+money+"content"+content);
		
		HashMap<String,String> map = new HashMap<String, String>();
		
		map.put("money", money);
		map.put("content", content);
		
		int result = dao.spon(map);
		
		if(result ==1) {
			try {
				response.setCharacterEncoding("UTF-8");
				
				PrintWriter writer = response.getWriter();
				writer.print("<html><body>");
				writer.print("<meta charset='UTF-8'>");
				writer.print("<script>");
				writer.print("alert('후원이 완료되었습니다. 감사합니다.'); location.href='/mypet/sponsor/view.action';");
				writer.print("</script>");
				writer.print("</body></html>");
				writer.close();
	
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
		}else {
			try {
				
				response.setCharacterEncoding("UTF-8");
				
				PrintWriter writer = response.getWriter();
				writer.print("<html><body>");
				writer.print("<meta charset='UTF-8'>");
				writer.print("<script>");
				writer.print("alert('E12454, 결제 오류 관리자에 문의하세요'); history.back();");
				writer.print("</script>");
				writer.print("</body></html>");
				writer.close();
	
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
		}
		
	}
	
}
