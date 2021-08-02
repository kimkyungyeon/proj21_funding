package proj21_funding.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_funding.dto.account.UserAuthInfo;
import proj21_funding.dto.account.UserLogin;
import proj21_funding.exception.UserNotFoundException;
import proj21_funding.exception.WrongIdPasswordException;
import proj21_funding.service.UserAuthService;

@Controller
public class UserLoginController {

	@Autowired
	private UserAuthService authService;

	// 로그인 화면가기
	@GetMapping("/login")
	public String login(UserLogin userLogin, @CookieValue(value = "REMEMBER", required = false) Cookie rCookie) {
		if (rCookie != null) {
			userLogin.setUserId(rCookie.getValue());
			userLogin.setRememberUserId(true);
		}
		return "account/login";
	}

	// 로그인 성공시 메인화면으로
	@PostMapping("/login")
	public String submit(@Valid UserLogin userLogin, Errors errors, HttpSession session, HttpServletResponse response) {
		if (errors.hasErrors())
			return "account/login";

		try {
			UserAuthInfo userAuthInfo = authService.authenicate(userLogin);
			session.setAttribute("authInfo", userAuthInfo);
			
			Cookie rememberCookie = new Cookie("REMEMBER", userLogin.getUserId());
			rememberCookie.setPath("/");
 
			if (userLogin.isRememberUserId()) {
				rememberCookie.setMaxAge(60 * 60 * 24 * 30);
			} else {
				rememberCookie.setMaxAge(0);
			}
			response.addCookie(rememberCookie);

			if(userAuthInfo.getUserNo() < 0) {
				return "redirect:/admin";
			}
			return "redirect:/main";			
		} catch (UserNotFoundException ex) {
			errors.rejectValue("userId","userNotFound");
			return "account/login";
		}catch (WrongIdPasswordException ex) {
			errors.rejectValue("userPw", "idPasswordNotMatching");
			return "account/login";
		} 

	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}

}
