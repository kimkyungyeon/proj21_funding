package proj21_funding.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.account.UserSearch;
import proj21_funding.exception.UserNotFoundException;
import proj21_funding.service.UserSerachService;

@Controller
public class UserSerachController {

	@Autowired
	private UserSerachService service;

	// 아이디/비밀번호 찾기 화면가기
	@RequestMapping("/account/searchAccount")
	public String searchAccount() {
		return "account/searchAccount";
	}

	// 아이디 찾기 화면가기
	@RequestMapping("/account/searchId")
	public String form_Id(UserSearch userSearch) {
		return "account/searchId";
	}

	// 아이디 찾기 결과화면
	@PostMapping("/account/searchId-rs")
	public String submit_IdRs(@Valid UserSearch userSearch, Errors errors) {
		if (errors.hasErrors())
			return "account/searchId";

		try {
			UserInfo userInfo = service.searchuserId(userSearch.getUserName(), userSearch.getEmail());
			userSearch.setUserId(userInfo.getUserId().replaceAll("(?<=.{4}).", "*"));
			return "account/searchId-rs";
		} catch (NullPointerException e) {
			return "account/searchId";
		} catch (UserNotFoundException e) {
			return "account/search-not";
		}
	}

	// 비밀번호 찾기 화면가기
	@RequestMapping("/account/searchPw")
	public String form_Pw(UserSearch userSearch) {
		return "account/searchPw";
	}

	// 비밀번호 찾기 결과화면
	@PostMapping("/account/searchPw-rs")
	public String submit_Pw(@Valid UserSearch userSearch, Errors errors) {
		if (errors.hasErrors())
			return "account/searchPw";

		if (userSearch == null) {
			return "account/searchPw";
		}
		try {
			UserInfo userInfo = service.searchuserPw(userSearch.getUserId(), userSearch.getUserName(),
					userSearch.getEmail());
			userSearch.setUserId(userInfo.getUserId());
			userInfo = service.createMailAndChangePassword(userInfo);
			service.mailSend(userInfo);
			return "account/searchPw-rs";
		} catch (NullPointerException e) {
			return "account/searchPw";
		} catch (UserNotFoundException e) {
			return "account/search-not";
		}

	}

	// 아이디 찾기 결과화면 직접입력방지
	@GetMapping("/account/searchId-rs")
	public String submit_IdRs() {
		return "redirect:/account/searchId";
	}

	// 비밀번호 찾기 결과화면 직접입력방지
	@GetMapping("/account/searchPw-rs")
	public String submit_PwRs() {
		return "redirect:/account/searchPw";
	}

}
