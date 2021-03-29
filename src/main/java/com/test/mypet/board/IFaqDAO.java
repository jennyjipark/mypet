package com.test.mypet.board;

import java.util.HashMap;
import java.util.List;

/***
 * FAQ 게시판 DAO 인터페이스 입니다.
 * @author 윤지현
 *
 */
public interface IFaqDAO {

	/***
	 * 전체 FAQ 목록 요청 메소드
	 * @return 
	 */
	List<FaqDTO> list();

	/***
	 * FAQ 게시글 정보 요청 메소드
	 * @param seq FAQ게시글 번호
	 * @return FAQ객체 반환
	 */
	FaqDTO get(String seq);

	/***
	 * FAQ 게시글 등록 요청 메소드
	 * @param fdto FAQ 객체
	 * @return FAQ DB작업 결과 반환
	 */
	int add(FaqDTO fdto);

	/***
	 * 
	 * @param map 검색결과
	 * @return FAQ 글 총 게시물
	 */
	int getTotalCount(HashMap<String, String> map);

	/***
	 * FAQ 글 수정 요청 메소드
	 * @param fdto 글정보
	 * @return FAQ 글 수정 DB작업 결과 반환
	 */
	int edit(FaqDTO fdto);

	/***
	 * FAQ 글 삭제 요청 메소드
	 * @param seqFaq FAQ 글 번호
	 * @return FAQ 글 삭제 DB작업 결과 반환
	 */
	int delete(String seqFaq);


}
