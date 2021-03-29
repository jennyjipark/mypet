package com.test.mypet.statistic;

import java.util.HashMap;
import java.util.List;

/**
 * 
 * 통계 DAO 인터페이스 
 * @author 이대홍
 *
 */
public interface IStatisticDAO {

	VwAnimalDataDTO list(HashMap<String, String> map);

	List<VwAnimalDataDTO> listReg();

	List<VwAnimalDataDTO> listMap();

	VwCountDTO count();

}
