package com.test.mypet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.mypet.board.AdoptionReviewDTO;
import com.test.mypet.board.IAdoptionReviewDAO;

@Controller
public class MainController {

	@Autowired
	IAdoptionReviewDAO ardao;
	
	
	@RequestMapping(value="/layout/layout.action")
	public String template1() {
		return "layout.layout";		
	}
	
	@RequestMapping(value="/main.action")
	public String main(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		List<AdoptionReviewDTO> rlist = ardao.getList();
		   
		request.setAttribute("rlist", rlist);		   		   
		   
		return "mypet.main";		
	}
	

	
}
