package proj21_funding.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import proj21_funding.dto.account.UserAuthInfo;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.exception.DuplicateEmailException;
import proj21_funding.exception.DuplicateNickNameException;
import proj21_funding.exception.WrongIdPasswordException;
import proj21_funding.service.UserInfoService;

@Controller
public class UserInfoController {

	@Autowired
	private UserInfoService service;

	// 회원정보 보기
	@GetMapping("/account/userInfo")
	public String form(UserInfo userInfo, HttpSession session, Model model) {
		UserAuthInfo userAuthInfo = (UserAuthInfo) session.getAttribute("authInfo");
		
		if(userAuthInfo.getUserNo() < 0) {
		         return "redirect:/main";
		}		
		
		userInfo = service.showUserInfoById(userAuthInfo.getUserId());
		model.addAttribute(userInfo);
		return "account/userInfo";
	}

	// 회원정보 수정
	@PostMapping("/account/userInfo")
	public String submit(@Valid UserInfo userInfo, Errors errors, HttpSession session) {
		if (errors.hasErrors())
			return "account/userInfo";

		try {
			service.modifyUserInfo(userInfo);
			UserAuthInfo userAuthInfo = (UserAuthInfo) session.getAttribute("authInfo");
			userAuthInfo.setNickName(userInfo.getNickName());			
			
			session.setAttribute("authInfo", userAuthInfo);
			return "account/userInfo";
		} catch (DuplicateEmailException e) {
			errors.rejectValue("email", "duplicate");
			return "account/userInfo";
		} catch (DuplicateNickNameException  e) {
			errors.rejectValue("nickName", "duplicate");
			return "account/userInfo";
		} 

	}

	// 회원탈퇴 화면이동
	@GetMapping("/account/userReSign")
	public String formResign(UserInfo userInfo) {
		return "account/userReSign";
	}

	// 회원탈퇴 확인
	@PostMapping("/account/userReSign")
	public String submitResign(UserInfo userInfo, Errors errors, HttpSession session) {
		UserAuthInfo userAuthInfo = (UserAuthInfo) session.getAttribute("authInfo");
		try {
			service.removeUserInfo(userAuthInfo.getUserId(), userInfo.getUserPw());
			session.invalidate();
			return "redirect:/main";
		} catch (WrongIdPasswordException e) {
			errors.rejectValue("userPw", "notMatching");
			return "account/userReSign";
		}
	}
}
