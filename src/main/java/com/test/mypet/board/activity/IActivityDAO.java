package com.test.mypet.board.activity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 활동 게시글 DAO 인터페이스 입니다.
 * @author 이대홍
 *
 */

public interface IActivityDAO {

	List<ActivityDTO> list(HashMap<String, String> map);
	
	
	ActivityDTO view(String seqActivity);
	
	
	int totalCount(HashMap<String, String> map);


	int writer(ActivityDTO dto);


	List<ActivityDTO> list_info();
	
	
	
}
