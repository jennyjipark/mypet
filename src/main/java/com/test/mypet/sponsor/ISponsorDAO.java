package com.test.mypet.sponsor;

import java.util.HashMap;
import java.util.List;

/**
 * 
 * 후원페이지의 DAO 인터페이스
 * @author 이대홍
 *
 */

public interface ISponsorDAO {

	List<VwSponsorDTO> list(HashMap<String, String> map);

	int totalCount(HashMap<String, String> map);

	VwSponsorDTO getInfo(String seqShelter);

	String list_All();


	int spon(HashMap<String, String> map);

}
