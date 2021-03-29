package com.test.mypet.board;

import java.util.List;

/**
 * 공지사항 관련 db작업 전담 인터페이스
 * @author 노푸른
 *
 */
public interface INoticeDAO {

	List<NoticeDTO> noticeList();

	int getTotalCount();

	NoticeDTO get(String seqNotice);

	NoticeDTO getDetail(String seqNotice);

	int write(NoticeDTO ndto);

	void updateViewCount(NoticeDTO ndto);
}
