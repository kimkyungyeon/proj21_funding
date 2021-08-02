package proj21_funding.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.project.ProjectJoin;
import proj21_funding.service.ProjectJoinService;
import proj21_funding.service.UserInfoService;

@Controller
public class AdminMemberController {
	@Autowired
	private UserInfoService userService;
	@Autowired
	private ProjectJoinService joinService;
	

	@RequestMapping("/searchMember")
	public ModelAndView searchMember(@RequestParam(value="keyword", required = false) String keyword,
			@RequestParam(value="searchKeyword", required = false) String searchKeyword,
			@RequestParam(value="delYn", required = false) String delYn) {
		System.out.println(keyword);
		System.out.println(searchKeyword);
		//회원 후원한프로젝트수,후원금액
		List<ProjectJoin> fundingStatic= joinService.showSumCountGroupByUserNo();
		//회원별 등록프로젝트수
		List<ProjectJoin> regProject= joinService.showProjectGroupByUserNo();	
		//회원별 제작성공프로젝트수
		List<ProjectJoin> successProject= joinService.showSucessProjectGroupByUserNo();
		//총유저수
		int count =userService.userCount();
		//탈퇴 제외 유저수
		int currentCount=userService.currentUserCount();
		//제작자수
		int prdCount=userService.prdcount();
		
		Map<String,Object> listMap = new HashMap<String, Object>();
		
		listMap.put("keyword", keyword);
		listMap.put("searchKeyword", searchKeyword);
		listMap.put("delYn", delYn);
		List<UserInfo> userList = userService.showUserListByMap(listMap);
		
		
		ModelAndView mav= new ModelAndView();
		mav.setViewName("admin/adminMember");
		mav.addObject("userList",userList);
		mav.addObject("count",count);
		mav.addObject("prdCount",prdCount);
		mav.addObject("currentCount", currentCount);
		mav.addObject("fundingStatic", fundingStatic);
		mav.addObject("regProject", regProject);
		mav.addObject("successProject", successProject);
		return mav;
	}
	
}
