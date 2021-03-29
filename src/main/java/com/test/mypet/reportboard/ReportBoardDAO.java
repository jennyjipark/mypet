package com.test.mypet.reportboard;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ReportBoardDAO implements IReportBoardDAO{

	@Autowired
	private SqlSessionTemplate template;

	@Override
	public int checkPassword(ReportBoardDTO dto) {
		return template.selectOne("reportBoard.checkPassword", dto);
	}

	@Override
	public ReportBoardDTO getContent(String seqReportBoard) {
		return template.selectOne("reportBoard.getContent", seqReportBoard);
	}

	@Override
	public List<ReportBoardDTO> getComments(String seqReportBoard) {
		return template.selectList("reportBoard.getComments", seqReportBoard);
	}

	@Override
	public void addComments(ReportBoardDTO rdto) {
		template.insert("reportBoard.addComment", rdto);
	}

	@Override
	public void write(ReportBoardDTO dto) {
		template.insert("reportBoard.addWrite", dto);
	}

	@Override
	public int getTotalCount() {
		return template.selectOne("reportBoard.getTotalCount");
	}

	@Override
	public List<ReportBoardDTO> list(HashMap<String, String> map) {
		return template.selectList("reportBoard.list", map);
	}
	
	

}
