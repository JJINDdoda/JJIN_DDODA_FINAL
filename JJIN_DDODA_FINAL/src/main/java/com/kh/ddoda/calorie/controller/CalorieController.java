package com.kh.ddoda.calorie.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ddoda.calorie.domain.Calorie;
import com.kh.ddoda.calorie.service.CalorieService;
import com.kh.ddoda.common.PageInfo;
import com.kh.ddoda.common.Pagination;

@Controller
public class CalorieController {
	
	@Autowired
	private CalorieService cService;
	
	// 관리자 음식 칼로리 전체 조회
	@RequestMapping(value="adminCalorieList.doa", method=RequestMethod.GET)
	public ModelAndView adminCalorieList(ModelAndView mv, Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = cService.getCalorieListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Calorie> cList = cService.adminCalorieList(pi);
		if(!cList.isEmpty()) {
			mv.addObject("cList", cList).addObject("pi", pi).setViewName("admin/Admin_Calorie_List");
		} else {
			mv.addObject("cList", cList).addObject("pi", pi).setViewName("admin/Admin_Calorie_List");
		}
		return mv;
	}
	
	// 관리자 음식 칼로리 상세 조회
	@RequestMapping(value="adminCalorieDetail.doa", method=RequestMethod.GET)
	public ModelAndView calorieDetail(ModelAndView mv, int calorieNo, Integer page) {
		int currentPage = page != null ? page : 1;
		Calorie calorie = cService.adminSelectCalorie(calorieNo);
		if(calorie != null) {
			mv.addObject("calorie", calorie).addObject("currentPage", currentPage).setViewName("admin/Admin_Calorie_Detail");
		} else {
			mv.addObject("msg", "게시글 상세조회 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 관리자 음식 칼로리 추가화면 이동
	@RequestMapping(value="cWriteView.doa", method=RequestMethod.GET)
	public String cWriteView() {
		return "admin/Admin_Calorie_Insert";
	}
	
	// 관리자 음식 칼로리 추가
	@RequestMapping(value="adminCalorieInsert.doa", method=RequestMethod.POST)
	public String calorieInsert(Calorie calorie, Model model) {
		int result = 0;
		String path = null;
		result = cService.adminInsertCalorie(calorie);
		if(result > 0) {
			path = "redirect:adminCalorieList.doa";
		} else {
			model.addAttribute("msg", "음식 추가 실패!!");
			path = "common/errorPage";
		}
		return path;
	}
	
	// 관리자 음식 칼로리 수정화면 이동
	@RequestMapping(value="cUpdateView.doa", method=RequestMethod.GET)
	public ModelAndView cUpdateView(ModelAndView mv, int calorieNo, Integer page) {
		mv.addObject("calorie", cService.adminSelectCalorie(calorieNo)).addObject("currentPage", page).setViewName("admin/Admin_Calorie_UpdateView");
		return mv;
	}
	
	// 관리자 음식 칼로리 수정
	@RequestMapping(value="adminCalorieUpdate.doa", method=RequestMethod.POST)
	public ModelAndView calorieUpdate(ModelAndView mv, Calorie calorie, Integer page) {
		int result = cService.adminModifyCalorie(calorie);
		if(result > 0) {
			mv.addObject("page", page).setViewName("redirect:adminCalorieList.doa");
		} else {
			mv.addObject("msg", "게시글 수정 실패!").setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 관리자 음식 칼로리 삭제
	@RequestMapping(value="adminCalorieDelete.doa", method=RequestMethod.GET)
	public String adminCalorieDelete(int calorieNo, Model model) {
		int result = cService.adminDeleteCalorie(calorieNo);
		if(result > 0) {
			return "redirect:adminCalorieList.doa";
		} else {
			model.addAttribute("msg", "음식 정보 삭제 실패!");
			return "common/errorPage";
		}
	}
}