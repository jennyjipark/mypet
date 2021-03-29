package com.test.mypet.vet;

import java.util.HashMap;
import java.util.List;

import com.test.mypet.shelter.LocationDTO;

/***
 * 동물병원 DAO 인터페이스입니다.
 * @author 윤지현
 *
 */
public interface IVetDAO {
	
	/***
	 * 동물병원 목록 반환 메소드입니다.
	 * @param map
	 * @return 동물병원 목록
	 */
	List<VetDTO> list(HashMap<String, String> map);

	/***
	 * 동물병원 정보 메소드입니다.
	 * @param seq
	 * @return 동물병원 정보
	 */
	VetDTO get(String seq);

	/***
	 * 동물병원 수정 메소드입니다.
	 * @param vdto
	 * @return 동물병원 수정정보
	 */
	int edit(VetDTO vdto);

	/***
	 * 동물병원 총 게시글 수 메소드입니다.
	 * @param map
	 * @return 동물병원 총 게시글
	 */
	int getTotalCount(HashMap<String, String> map);

	/***
	 * 동물병원 등록 메소드 입니다.
	 * @param vdto
	 * @return 동물병원 등록 정보
	 */
	int add(VetDTO vdto);

	/***
	 * 동물병원 삭제 메소드입니다.
	 * @param seqVet
	 * @return 동물병원 삭제정보
	 */
	int delete(String seqVet);



}
