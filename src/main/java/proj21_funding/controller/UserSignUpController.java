package proj21_funding.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_funding.dto.account.UserSignUp;
import proj21_funding.exception.DuplicateEmailException;
import proj21_funding.exception.DuplicateNickNameException;
import proj21_funding.exception.DuplicateUserException;
import proj21_funding.service.UserRegisterService;

@Controller
public class UserSignUpController {

	@Autowired
	private UserRegisterService service;

	// 회원가입 화면가기
	@RequestMapping("/account/signUp1")
	public String signUp1(UserSignUp userSignUp) {
		return "account/signUp1";
	}

	// 가입성공화면가기
	@PostMapping("/account/signUp2")
	public String signUp2(@Valid UserSignUp userSignUp, Errors errors) {
		if (errors.hasErrors()) {
			return "account/signUp1";
		}
		if (!userSignUp.getAgree()) {
			errors.rejectValue("agree", "nocheck");
			return "account/signUp1";
		}

		if (!userSignUp.isPasswordEqualToComfirmPassword()) {
			errors.rejectValue("confirmUserPw", "nomatch");
			return "account/signUp1";
		}
		
		try {
			service.regist(userSignUp);
			return "account/signUp2";
		} catch (DuplicateUserException  e) {
			errors.rejectValue("userId", "duplicate");
			return "account/signUp1";
		} catch (DuplicateNickNameException  e) {
			errors.rejectValue("nickName", "duplicate");
			return "account/signUp1";
		} catch (DuplicateEmailException  e) {
			errors.rejectValue("email", "duplicate");
			return "account/signUp1";
		} 
	}

	// 회원가입 성공화면 직접입력방지
	@GetMapping("/account/signUp2")
	public String signUp2() {
		return "redirect:/account/signUp1";
	}

}
