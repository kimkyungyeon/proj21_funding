package proj21_funding.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_funding.dto.PrjCategory;
import proj21_funding.dto.project.ProjectJoin;
import proj21_funding.service.PrjCategoryService;
import proj21_funding.service.ProjectJoinService;

@Controller
public class MainController {

	@Autowired
	private PrjCategoryService service;

	@Autowired
	private ProjectJoinService joinService;

	// main화면 바로가기
	@RequestMapping("/")
	public String main() {
		return "redirect:/main";
	}

//	@RequestMapping("/main")
//	public String main(Model model) {
//		List<ProjectJoin> maxprj = joinService.showProjectJoinAll();
//		model.addAttribute("maxprj", maxprj);
//		
//		List<ProjectJoin> prjs = joinService.showProjectJoinAll();
//		List<ProjectJoin> newprj = null;
//		if (prjs.size() <= 10) {
//			newprj = prjs;
//		} else {
//			newprj = prjs.subList(prjs.size() - 10, prjs.size());
//		}
//		model.addAttribute("newprj", newprj);
//
//		List<ProjectJoin> recommendPrjs = new ArrayList<ProjectJoin>();
//		for (ProjectJoin rePrj : prjs) {
//			if (rePrj.getRate() >= 100) {
//				recommendPrjs.add(rePrj);
//			} 
//		}		
//		if (recommendPrjs.size() <= 10) {
//			recommendPrjs = prjs;
//		} else {
//			recommendPrjs = prjs.subList(prjs.size() - 10, prjs.size());
//		}
//		model.addAttribute("recommendPrjs", recommendPrjs);
//
//		List<ProjectJoin> endprjs = joinService.showProjectSuccessImbak();
//		List<ProjectJoin> end = new ArrayList<ProjectJoin>();
//		if (endprjs.size() <= 10) {
//			end = endprjs;
//			for(int i = endprjs.size(); i > 10; i++) {
//				end.add(null);
//			}			
//		} else {
//			end = endprjs.subList(endprjs.size() - 10, endprjs.size());
//		}
//		model.addAttribute("endprjs", end);
//		return "main";
//	}
	
	@RequestMapping("/main")
	public String main(Model model) {
		List<ProjectJoin> maxprj = joinService.showProjectJoinAll();
		model.addAttribute("maxprj", maxprj);
		//신규프로젝트
		List<ProjectJoin> newprj = joinService.selectMainNewProject();
		model.addAttribute("newprj", newprj);
		//주목 프로젝트
		List<ProjectJoin> jumokPrjs = joinService.selectMainJumok();
		model.addAttribute("jumokPrjs", jumokPrjs);
		//성공임박 프로젝트
		List<ProjectJoin> successPrjs = joinService.selectMainSuccessImbak();
		model.addAttribute("successPrjs", successPrjs);
		//마감임박 프로젝트
		List<ProjectJoin> endPrjs = joinService.selectMainMagamImbak();
		model.addAttribute("endPrjs", endPrjs);
		return "main";
	}

	// home에서 프로젝트 둘러보기
	@RequestMapping("/home/menu")
	public String menu(Model model, HttpSession session) {
		List<PrjCategory> prjCategory = service.showCategory();
		model.addAttribute("prjCategory", prjCategory);
		return "home/menu";
	}

	// home에서 개인정보 보는거
	@RequestMapping("/home/header_logmenu")
	public String logonMenu() {
		return "home/header_logmenu";
	}
	// 맵핑할때 view안에 있는 폴더이면 꼭! 위치 설정해주세요.

}