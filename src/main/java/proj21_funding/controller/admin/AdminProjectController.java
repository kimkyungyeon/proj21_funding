package proj21_funding.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.PrjCategory;
import proj21_funding.dto.project.ProjectJoin;
import proj21_funding.service.PrjCategoryService;
import proj21_funding.service.ProjectJoinService;
import proj21_funding.service.UserInfoService;

@Controller
public class AdminProjectController {
	@Autowired
	private UserInfoService userService;
	@Autowired
	private ProjectJoinService joinService;
	@Autowired
	private PrjCategoryService categoryService;
	

	@RequestMapping("/sponsorList/{prjNo}")
	public ModelAndView sponsorList(@PathVariable("prjNo") int prjNo) {
		System.out.println(prjNo);
		ProjectJoin prjDetail = joinService.showProjectJoinByPrjNo(prjNo);
		List<ProjectJoin> sponsorList = joinService.showSponsorListByPrjNo(prjNo);
		List<PrjCategory> categoryList = categoryService.showCategory();
		
		ModelAndView mav= new ModelAndView();
		mav.setViewName("admin/sponsorList");
		mav.addObject("prjDetail",prjDetail);
		mav.addObject("sponsorList",sponsorList);
		mav.addObject("categoryList",categoryList);
		return mav;
	}
	
	@RequestMapping("/searchProject")
	public ModelAndView searchProject(@RequestParam(value="category") String category,
			@RequestParam(value="keyword") String keyword,
			@RequestParam(value="searchKeyword", required = false) String searchKeyword,
			@RequestParam(value="successYn", required = false) String successYn) {
		System.out.println(successYn);
		System.out.println(keyword);
		System.out.println(searchKeyword);
		System.out.println(category);
		List<PrjCategory> categoryList = categoryService.showCategory();
		ProjectJoin sumCount =joinService.showProjectSumCountAll();

		Map<String,Object> listMap = new HashMap<String,Object>();
		listMap.put("category", category);
		listMap.put("keyword", keyword);
		listMap.put("searchKeyword", searchKeyword);
		listMap.put("successYn",successYn);
		List<ProjectJoin> prjList = joinService.showProjectJoinByMap(listMap);
		
		ModelAndView mav= new ModelAndView();
		mav.setViewName("admin/adminProject");
		mav.addObject("prjList",prjList);
		mav.addObject("sumCount",sumCount);
		mav.addObject("categoryList",categoryList);
		return mav;
	}
	
}
