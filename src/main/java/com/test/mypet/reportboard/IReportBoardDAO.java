package com.test.mypet.reportboard;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

public interface IReportBoardDAO {

	/**
	 * 게시글 리스트를 가져오는 메서드
	 * @param 처음과 끝 (페이징을 위한)
	 * @return 게시글
	 */
	List<ReportBoardDTO> list(HashMap<String, String> map);
 
	/**
	 * 게시글 비밀번호를 확인하는 메서드
	 * @param dto
	 * @return 결과유무
	 */
	int checkPassword(ReportBoardDTO dto);

	/**
	 * 게시글 정보를 가져오는 메서드
	 * @param seqReportBoard 게시글 번호
	 * @return 게시글 내용
	 */
	ReportBoardDTO getContent(String seqReportBoard);

	/**
	 * 특정 게시글의 댓글을 가져오는 메서드
	 * @param seqReportBoard 게시글번호
	 * @return 댓글 리스트
	 */
	List<ReportBoardDTO> getComments(String seqReportBoard);

	/**
	 * 댓글 추가하는 메서드
	 * @param rdto 
	 */
	void addComments(ReportBoardDTO rdto);

	/**
	 * 게시글 추가하는 메서드
	 * @param dto
	 */
	void write(ReportBoardDTO dto);

	/**
	 * 총 게시글을 긁어오는 메서드
	 * @param map
	 * @return count(*)
	 */
	int getTotalCount();

	
	
}
