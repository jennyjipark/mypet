package com.test.mypet.vet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.mypet.shelter.MoreDTO;

/***
 * 동물병원 관련 컨트롤러 클래스입니다.
 * @author 윤지현
 *
 */
@Controller
public class VetController {
	
	@Autowired
	private IVetDAO dao;
	
	/***
	 * 동물병원 전체 목록 요청 및 페이지를 출력하는 메소드입니다.
	 * @param request
	 * @param response
	 * @param session
	 * @return 동물병원 목록
	 */
	@RequestMapping(value="/vet/list.action", method={RequestMethod.GET})
	public String list(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
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
					+ "<a href=\"/mypet/vet/list.action?page=%d\" aria-label=\"Previous\">"
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
			
			pagebar += String.format("<a href=\"/mypet/vet/list.action?page=%d\">%d</a></li>", n, n);
			
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
					+ "<a href=\"/mypet/vet/list.action?page=%d\" aria-label=\"Next\">"
					+ ">>"
					+ "</a>"
					+ "</li>", n);
		}
		
		

		
		List<VetDTO> list = dao.list(map);
		
		request.setAttribute("list", list);
		request.setAttribute("search", search);
		request.setAttribute("pagebar", pagebar);
		request.setAttribute("nowPage", nowPage);
		
		return "vet.list";
	}
	
	/***
	 * 동물병원 상세정보 요청 및 페이지를 출력하는 메소드입니다.
	 * @param request
	 * @param response
	 * @param session
	 * @param seq
	 * @return 동물병원 상세정보
	 */
	@RequestMapping(value="/vet/view.action")
	public String view(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seq) {
		
		VetDTO vdto = dao.get(seq);
		request.setAttribute("vdto", vdto);
		request.setAttribute("seqVet", seq);
		
		return "vet.view";
	}
	
	/***
	 * 동물병원 등록페이지를 요청하는 메소드입니다.
	 * @param request
	 * @param response
	 * @param session
	 * @return 동물병원 등록페이지
	 */
	@RequestMapping(value="/vet/add.action")
	public String add(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		return "vet.add";
	}
	
	/***
	 * 동물병원 등록 DB작업을 요청하는 메소드입니다.
	 * @param request
	 * @param response
	 * @param session
	 * @param vdto
	 */
	@RequestMapping(value="/vet/addok.action", method = { RequestMethod.POST })
	public void addok(HttpServletRequest request, HttpServletResponse response, HttpSession session, VetDTO vdto) {
		
	
		int result = dao.add(vdto);
		
		try {
			
			if(result == 1) {
				response.sendRedirect("/mypet/vet/list.action");
			}else {
				response.sendRedirect("/mypet/vet/add.action");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
	}
	/***
	 * 동물병원 수정페이지를 요청하는 메소드입니다.
	 * @param request
	 * @param response
	 * @param session
	 * @param seq
	 * @return 동물병원 수정페이지
	 */
	@RequestMapping(value="/vet/edit.action")
	public String edit(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seq) {
		
		VetDTO vdto = dao.get(seq);
		
		request.setAttribute("vdto", vdto);
		
		return "vet.edit";
	}
	
	/***
	 * 동물병원 수정 DB작업 요청 메소드입니다.
	 * @param request
	 * @param response
	 * @param session
	 * @param vdto
	 */
	@RequestMapping(value="/vet/editok.action", method = { RequestMethod.POST })
	public void editok(HttpServletRequest request, HttpServletResponse response, HttpSession session, VetDTO vdto) {
		
		int result = dao.edit(vdto);
		
		try {
			if(result == 1) {
				response.sendRedirect("/mypet/vet/view.action?seqVet=" + vdto.getSeqVet());
			}else {
				response.sendRedirect("/mypet/vet/edit.action?seqVet=" + vdto.getSeqVet());
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	/***
	 * 동물병원 삭제 DB작업 요청 메소드입니다.
	 * @param request
	 * @param response
	 * @param session
	 * @param seqVet
	 */
	@RequestMapping(value="/vet/deleteok.action")
	public void delete(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seqVet) {
		
		int result = dao.delete(seqVet);
		
		try {
			if (result == 1) {
				response.sendRedirect("/mypet/vet/list.action");
			} else {
				response.sendRedirect("/mypet/vet/view.action?seqVet=" + seqVet);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	//주소 검색 + Open API
	/***
	 * 주소검색 Open API 페이지 요청 및 출력하는 메소드입니다
	 * @param request
	 * @param response
	 * @param query
	 * @return 주소검색 페이지
	 */
	@RequestMapping(value="/vet/more.action", method={RequestMethod.GET})
	public String more(HttpServletRequest request, HttpServletResponse response, String query) {
		
		ArrayList<MoreDTO> mlist = new ArrayList<MoreDTO>();
		
		
		
		if (query != null && query != "") {
			//검색O
			
			String clientId = "SWbDIKDagbf75R1DVPDD"; //애플리케이션 클라이언트 아이디값"
	        String clientSecret = "R7OTDnOLHW"; //애플리케이션 클라이언트 시크릿값"


	        String text = null;
	        
	        try {
	            text = URLEncoder.encode(query, "UTF-8");
	        } catch (UnsupportedEncodingException e) {
	            throw new RuntimeException("검색어 인코딩 실패",e);
	        }


	        String apiURL = "https://openapi.naver.com/v1/search/local.json?query=" + text;    
	        

	        Map<String, String> requestHeaders = new HashMap<>();
	        requestHeaders.put("X-Naver-Client-Id", clientId);
	        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	        String responseBody = get(apiURL,requestHeaders);

	        
	        System.out.println(responseBody);
	        
	        try {
	    	
		        JSONParser parser = new JSONParser();
		        
		        //해석(구문분석)
		        JSONObject json = (JSONObject)parser.parse(responseBody);
		        			        
		        System.out.println(json.get("total"));
		        System.out.println(json.get("display"));
		        
		      //목록들(items)
		        JSONArray list = (JSONArray)json.get("items");
		        
		        for (int i=0; i<list.size(); i++) {
		        	
		        	MoreDTO dto = new MoreDTO();
		        	
		        	JSONObject more = (JSONObject)list.get(i);
		        	
		        	String category = (String)more.get("category");
		        	String title = (String)more.get("title");
		        	String link = (String)more.get("link");
		        	String description = (String)more.get("description");
		        	String telephone = (String)more.get("telephone");
		        	String address = (String)more.get("address");
		        	String roadAddress = (String)more.get("roadAddress");
		        	
		        	//dto에 채워넣기
		        	dto.setCategory(category);
		        	dto.setTitle(title);
		        	dto.setLink(link);
		        	dto.setDescription(description);
		        	dto.setTelephone(telephone);
		        	dto.setAddress(address);
		        	dto.setRoadAddress(roadAddress);
		        	
		        	//ArrayList에 담기
		        	mlist.add(dto);
		        }
		        
			} catch(Exception e) {
	        	System.out.println(e);
	        }
   	}		
	
	//request에 넣어서 jsp에 넘기기
	request.setAttribute("mlist", mlist);
				     
		return "vet/more";
	} //more.action
	
	
	private String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }


    private HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    private String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }

}
