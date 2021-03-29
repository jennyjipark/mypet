package com.test.mypet.board;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * 공지사항 관련 db전담 객체
 * @author Blue
 *
 */
@Repository
public class NoticeDAO implements INoticeDAO {

	/**
	 * db 연동 객체
	 */
	@Autowired
	private SqlSessionTemplate template;
	
	/**
	 * 공지사항 리스트 출력 메소드
	 */
	@Override
	public List<NoticeDTO> noticeList() {

		return template.selectList("notice.noticeList");
		//nameplace.id
	}
	
	/**
	 * 공지사항 리스트 전체 페이지 조회 메소드
	 */
	@Override
	public int getTotalCount() {
		
		return template.selectOne("notice.getTotalCount");
		
	}
	
	/**
	 * 공지사항 상세페이지 출력 메소드
	 */
	@Override
	public NoticeDTO get(String seqNotice) {

		return template.selectOne("notice.get", seqNotice);
	}
	

//	public static void getDetail(HttpServletRequest request, String seqNotice, NoticeDAO noticeDAO) {
	public NoticeDTO getDetail(String seqNotice) {
		//파라미터로 전달되는 글번호
				//String seqNotice = request.getParameter("seqNotice");
				
				//검색과 관련된 파라미터를 읽어와 본다.
				//String keyword=request.getParameter("keyword");
				//String condition=request.getParameter("condition");
				
				//CafeDto 객체 생성 (select 할때 필요한 정보를 담기 위해)
				NoticeDTO ndto =new NoticeDTO();
				
//				if(keyword != null) {//검색 키워드가 전달된 경우
//					if(condition.equals("content")) {//제목+내용 검색
//						ndto.setContent(keyword);
//					}else if(condition.equals("title")) {//제목 검색
//						ndto.setTitle(keyword);
//					}
//				}
					//request 에 검색 조건과 키워드 담기
					//request.setAttribute("condition", condition);
					/*
					 *  검색 키워드에는 한글이 포함될 가능성이 있기 때문에
					 *  링크에 그대로 출력가능하도록 하기 위해 미리 인코딩을 해서
					 *  request 에 담아준다.
					 */
//					String encodedKeyword=null;
//					
//					try {
//						encodedKeyword=URLEncoder.encode(keyword, "utf-8");
//					} catch (UnsupportedEncodingException e) {
//						e.printStackTrace();
//					}
					//인코딩된 키워드와 인코딩 안된 키워드를 모두 담는다.
//					request.setAttribute("encodedKeyword", encodedKeyword);
//					request.setAttribute("keyword", keyword);
					
				//Dto 에 글번호도 담기
				ndto.setSeqNotice(seqNotice);
				
				//조회수 1 증가 시키기
				//NoticeDAO.addViewCount(seqNotice);
				//글정보를 얻어와서
				//NoticeDTO ndto2 = NoticeDAO.get(seqNotice);
				NoticeDAO noticeDAO = new NoticeDAO();
				
				 NoticeDTO ndto2 = noticeDAO.get(seqNotice);
				   
				
				//request 에 글정보를 담고 
				//request.setAttribute("ndto", ndto2);
				return template.selectOne("notice.getData", seqNotice);
				//return template.selectOne("notice.get", seqNotice);
			
	}
	
	
	/**
	 * 공지사항 글쓰기 메소드
	 */
	@Override
	public int write(NoticeDTO ndto) {

		return template.insert("notice.write", ndto);
	}
	
	
	//조회수 증가
	/**
	 * 공지사항 조회수 증가 메소드
	 */
	@Override
	public void updateViewCount(NoticeDTO ndto) {

		
		template.update("notice.updateViewCount", ndto);
		
	}
	
	

}
	
	

