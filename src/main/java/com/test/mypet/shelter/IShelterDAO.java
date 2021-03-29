package com.test.mypet.shelter;

import java.util.HashMap;
import java.util.List;

/***
 * 보호소 DAO 인터페이스입니다.
 * @author 윤지현
 *
 */
public interface IShelterDAO {

	List<ShelterDTO> list(HashMap<String, String> map);

	List<ShelterDTO> get(String seq);
	/*ShelterVolDTO get(String seq);*/

	int edit(ShelterDTO sdto);

	int getTotalCount(HashMap<String, String> map);

	/* List<LocationDTO> location(HashMap<String, String> map); */

	List<LocationDTO> location();

	List<LocationDetailDTO> locationDetail();

	int add(ShelterDTO sdto);

	int delete(String seqShelter);

}
