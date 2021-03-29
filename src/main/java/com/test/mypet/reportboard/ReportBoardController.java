package com.test.mypet.reportboard;

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

import com.test.mypet.goods.GoodsDTO;

@Controller
public class ReportBoardController {

	@Autowired
	private IReportBoardDAO dao;



	@RequestMapping(value = "/reportBoard/list.action", method = { RequestMethod.GET })
	public String reportList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		HashMap<String, String> map = new HashMap<String, String>();
		//페이징
		int nowPage = 0;      //현재 페이지 번호
		int totalCount = 0;      //총 게시물 수
		int pageSize = 10;      //한페이지당 출력 개수
		int totalPage = 0;      //총 페이지 수
		int begin = 0;         //rnum 시작 번호
		int end = 0;         //rnum 끝 번호
		int n = 0;            //페이지바 관련 변수
		int loop = 0;         //페이지바 관련 변수
		int blockSize = 9;      //페이지바 관련 변수

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

		totalCount = dao.getTotalCount();

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
					+ "            <a href=\"/mypet/reportBoard/list.action?page=%d\" aria-label=\"Previous\">"
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

			pagebar += String.format("<a href=\"/mypet/reportBoard/list.action?page=%d\">%d</a></li>", n, n);

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
					+ "            <a href=\"/mypet/reportBoard/list.action?page=%d\" aria-label=\"Next\">"
					+ "                <span aria-hidden=\"true\">&raquo;</span>"
					+ "            </a>"
					+ "        </li>", n);
		}
		
		List<ReportBoardDTO> list = dao.list(map);

		request.setAttribute("list", list);
	    request.setAttribute("pagebar", pagebar);
	    request.setAttribute("nowPage", nowPage);

		return "board.reportList";
	}

	@RequestMapping(value = "/reportBoard/viewOk.action", method = { RequestMethod.POST })
	public void reportViewOk(HttpServletRequest request, HttpServletResponse response, HttpSession session, ReportBoardDTO dto) throws IOException {

		//패스워드, 게시글번호 가져오기
		//System.out.println("password : " + dto.getPassword() + " seqReportBoard : " +dto.getSeqReportBoard());

		//양식 비밀번호,seqReportBoard;
		String line[] = dto.getPassword().split(",");

		ReportBoardDTO rdto = new ReportBoardDTO();

		rdto.setPassword(line[0]);
		rdto.setSeqReportBoard(line[1]);

		//게시글 비밀번호 확인
		int result = dao.checkPassword(rdto);

		if(result == 1) {//게시글 접속 성공
			//System.out.println(rdto.getSeqReportBoard());
			response.sendRedirect("/mypet/reportBoard/view.action?seqReportBoard="+rdto.getSeqReportBoard());		
		} else {//게시글 접속실패
			PrintWriter writer = response.getWriter();

			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('failed');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");

			writer.close();

		}

	}

	@RequestMapping(value = "/reportBoard/view.action", method = { RequestMethod.GET })
	public String reportView(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seqReportBoard) {

		//seqReporBoard 확인
		System.out.println("seqReportBoard" + seqReportBoard);

		//게시글 관련 정보 가져오기
		ReportBoardDTO rdto = dao.getContent(seqReportBoard);

		//게시글 댓글 정보 가져오기
		List<ReportBoardDTO> clist = dao.getComments(seqReportBoard);


		request.setAttribute("rdto", rdto);
		request.setAttribute("clist", clist);

		return "board.reportView";
	}

	@RequestMapping(value = "/reportBoard/commentOk.action", method = { RequestMethod.POST })
	public void reportCommentOk(HttpServletRequest request, HttpServletResponse response, HttpSession session, String comment) throws IOException {


		//comment = 댓글, seqReportBoard
		String line[] = comment.split(",");

		//게시글 관련 정보 가져오기
		ReportBoardDTO rdto = new ReportBoardDTO();

		rdto.setComments(line[0]);
		rdto.setSeqReportBoard(line[1]);
		rdto.setSeqUser("6");	//나중에 세션으로 수정.....

		//게시글 댓글 추가하기
		dao.addComments(rdto);


		response.sendRedirect("/mypet/reportBoard/view.action?seqReportBoard="+rdto.getSeqReportBoard());	
	}

	@RequestMapping(value = "/reportBoard/write.action", method = { RequestMethod.GET })
	public String reportWrite(HttpServletRequest request, HttpServletResponse response, HttpSession session, String comment) {

		return "board.reportWrite";
	}

	@RequestMapping(value = "/reportBoard/writeOk.action", method = { RequestMethod.POST })
	public void reportWriteOk(HttpServletRequest request, HttpServletResponse response, HttpSession session, ReportBoardDTO dto) throws IOException {

		//나중에.. 세션받으면..수정..
		dto.setSeqUser("6");

		//확..인..
		//System.out.println(dto.getTitle() + "내용 : " + dto.getContent() + "비밀 : " + dto.getPassword());


		dao.write(dto);

		response.sendRedirect("/mypet/reportBoard/list.action");	

	}

}
