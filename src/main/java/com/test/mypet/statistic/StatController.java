package com.test.mypet.statistic;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.math3.stat.descriptive.moment.Mean;
import org.apache.commons.math3.stat.descriptive.moment.Variance;
import org.apache.commons.math3.stat.regression.SimpleRegression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 
 * 통계 자료를 보여주는 페이지 구현 클래스 
 * @author 이대홍
 *
 */

@Controller
public class StatController {

	@Autowired
	private IStatisticDAO dao;

	
	/**
	 * 
	 * 통계자료를 보여주는 메소드 입니다. 
	 * @param request
	 * @param response
	 * @param ymdate  검색하고 싶은 통계 년도
	 * @param location 검색 하고 싶은 통계 지역
	 * @return
	 */
	@RequestMapping(value = "stat/view.action", method = { RequestMethod.GET })
	public String stat_view(HttpServletRequest request, HttpServletResponse response, String ymdate, String location) {
		// 1.2016~2020 월별자료 통계 얻어 오기

		if ((ymdate == null || ymdate == "") && (location == null || location == "")) {
			ymdate = "없음";
			location = "없음";
		} else if (ymdate == null || ymdate == "") {
			ymdate = "없음";
		} else if (location == null || location == "") {
			location = "없음";
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("ymdate", ymdate);
		map.put("location", location);
		// 개별 통계 맵 
		VwAnimalDataDTO dto = dao.list(map);

		
		//회기식 아무것다 넣음.. 대충이다.. 하....
		List<VwAnimalDataDTO> aniList = dao.listReg();

		Queue<String> reg = stat(aniList);
		
		StringBuilder sb = new StringBuilder();
		sb.append("기준 = 수도권(서울,인천,경기 ); 회기 식 월 변화= ");
		sb.append(reg.poll().substring(0, 4) );
		sb.append("*(월별 입양율변화) +  ");
		sb.append(reg.poll().substring(0, 4) +"(절편); , ");
		sb.append( " 평균 : "+ reg.poll().substring(0, 4));
		sb.append( " 분산 : "+ reg.poll().substring(0, 4));
		
		String regression = sb.toString();

		System.out.println("regression" + regression);

		
		//전체 가지고 오기 지도의 %
		List<VwAnimalDataDTO> mapList = dao.listMap();
		HashMap<String,String> mapInfo = map(mapList);
		
		// 카운트 
		VwCountDTO countDto = dao.count();
		
		mapInfo.put("전체회원",countDto.getAllUser()+"");
		mapInfo.put("전체동물",countDto.getPet()+"");
		mapInfo.put("입양된동물",countDto.getComPet()+"");
		mapInfo.put("입양가능동물",countDto.getAblePet()+"");
		
		mapInfo.put("입양가능", (((double)countDto.getAblePet()*100/countDto.getPet())+"").substring(0,4)  );
		mapInfo.put("입양완료", (((double)countDto.getComPet()*100/countDto.getPet())+"").substring(0,4)  );
		mapInfo.put("기타사항", ((double)( countDto.getPet()-countDto.getAblePet()-countDto.getComPet() )*100/countDto.getPet()+"").substring(0,4) );
		//mapInfo.put("강아지",(((double)countDto.getDog()*100/countDto.getAblePet())+"").substring(0,4) );
		mapInfo.put("강아지",(((double)countDto.getDog()*100/countDto.getAblePet())+"").substring(0,4) );
		mapInfo.put("고양이",(((double)countDto.getCat()*100/countDto.getAblePet())+"").substring(0,4));
		mapInfo.put("기타",((double)( countDto.getAblePet()-countDto.getDog()-countDto.getCat() )*100/countDto.getAblePet()+"").substring(0,4) ); 
		
		
		request.setAttribute("dto", dto);
		request.setAttribute("ymdate", ymdate);
		request.setAttribute("location", location);
		request.setAttribute("regression", regression);	
		request.setAttribute("countDto", countDto);	
		request.setAttribute("mapInfo", mapInfo);

		
		
		
		return "statistic/view";
	}

	
	/**
	 * 통계자료에 대한 비율을 계산하는 메소드 입니다.
	 * @param mapList 전체 통계자료 
	 * @return 자료의 수치계산반환
	 */
	
	private HashMap<String, String> map(List<VwAnimalDataDTO> mapList) {
		HashMap<String, String> map = new HashMap<String, String>(); 
		
		for (VwAnimalDataDTO dto :mapList) {
			map.put( dto.getLocation() , ((Double.valueOf(dto.getAdoption())*100/Double.valueOf(dto.getTotal()))+"").substring(0,2));
		}
		
		return map;
	}

	/**
	 * 
	 * 통계자료의 데이터 값을 회귀분석을 통해 정확도와 정보를 돌려주는 메소드입니다.
	 * @param aniList 통계자료
	 * @return 통계자료의 회귀분석값
	 */
	private Queue<String> stat(List<VwAnimalDataDTO> aniList) {
		int count = 0;

		Queue<String> test = new LinkedList<String>();

		double[] month = new double[aniList.size()];
		double[] adoption = new double[aniList.size()];
		System.out.println(aniList.size());

		SimpleRegression reg = new SimpleRegression();

		for (VwAnimalDataDTO dto : aniList) {
			month[count] = count + 1;
			adoption[count] = Double.valueOf(dto.getAdoption()) / Double.valueOf(dto.getTotal());
			System.out.println("month[count]" + month[count] + "adoption[count]" + adoption[count]);
			count++;
		}
		for (int i = 0; i < month.length; i++) {

			reg.addData(month[i], adoption[i]);

		}

		test.add(reg.getSlope() + "");
		test.add(reg.getIntercept() + "");
		
		Mean m = new Mean(); // 이것이 math3 라이브러리에서 평균을 구해주는 객체이다.
		for (int i = 0; i < adoption.length; i++) {

			m.increment(adoption[i]);// 자료를 넣고

		}

		Variance v = new Variance();
		
		for (int i = 0; i < adoption.length; i++) {

			v.increment(adoption[i]);// 자료를 넣고
		}
		
		
		test.add(m.getResult()+"");
		test.add(v.getResult()+"");
		return test;

	}

}
