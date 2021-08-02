package proj21_funding.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.FundingInfo;
import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.service.FundingInfoService;

@Controller
public class FundingController {
	
	@Autowired
	FundingInfoService fundingService;

	@RequestMapping(value={"/fundingSuccess/{userNo}/{optNo}"})
	ModelAndView fundingSuccess(@PathVariable("userNo") int userNo,
			 @PathVariable("optNo")int optNo,  HttpServletRequest request, HttpSession session) {
		UserInfo userNo1 = new UserInfo(userNo);
		int prj = Integer.parseInt(request.getParameter("prjNo"));
		Project prjNo = new Project(prj);
		PrjOption optNo1 = new PrjOption(optNo);
		String accountNo = request.getParameter("accountNo");
		int zipCode = Integer.parseInt(request.getParameter("zipCode"));
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		FundingInfo fundingInfo = new FundingInfo(userNo1,prjNo,optNo1,accountNo,zipCode,address,detailAddress);
		System.out.println(fundingService.addFundingInfo(fundingInfo));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("funding/fundingSuccess");
		return mav;
	}
	
}
