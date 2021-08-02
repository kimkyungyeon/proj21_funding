package proj21_funding.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.FundingInfo;
import proj21_funding.dto.paging.Pagination;
import proj21_funding.service.FundingInfoService;

@Controller
public class MyPageController {

	@Autowired
	private  FundingInfoService fundingService;
	
	@RequestMapping("/user/funding_status/{authInfo.userNo}")
	public ModelAndView showFundingStatus(@PathVariable("authInfo.userNo") int userNo,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
			HttpSession session	) throws Exception {
		//로그인 확인
		
		if(session.getAttribute("authInfo")==null) {
			return new ModelAndView("redirect:/login");
		}

		int pageSearch = (currentPage-1)*cntPerPage;
		int count = fundingService.showCountByUserNo(userNo);
		
		//매개변수로 쓸 맵 선언
		Map<String,Object> listMap = new HashMap<String,Object>();
		listMap.put("currentPage",currentPage );
		listMap.put("cntPerPage", cntPerPage);
		listMap.put("pageSize",pageSize );
		listMap.put("pageSearch",pageSearch);
		listMap.put("userNo", userNo);
		
		Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
		pagination.setTotalRecordCount(count);
		session.setAttribute("pagination", pagination);
		
		List<FundingInfo> fundingList = fundingService.showFundingInfoByUserNoMap(listMap);
		
		ModelAndView mav = new ModelAndView("/user/funding_status");
		mav.addObject("fundingList",fundingList);
		mav.addObject("count",count);
		return mav;
	}
}
