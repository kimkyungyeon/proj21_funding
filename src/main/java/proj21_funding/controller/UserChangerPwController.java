package proj21_funding.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_funding.dto.account.UserAuthInfo;
import proj21_funding.dto.account.UserChangePw;
import proj21_funding.exception.WrongIdPasswordException;
import proj21_funding.service.UserChangePwService;

@Controller
@RequestMapping("/account/userChangePw")
public class UserChangerPwController {

	@Autowired
	private UserChangePwService userChangePwService;

	@GetMapping
	public String form(UserChangePw userChangePw) {
		return "account/userChangePw1";
	}

	@PostMapping
	public String submit(@Valid UserChangePw userChangePw, Errors errors, HttpSession session) {
		if (errors.hasErrors())
			return "account/userChangePw1";

		if (!userChangePw.isPasswordEqualToComfirmPassword()) {
			errors.rejectValue("confirmUserPw", "nomatch");
			return "account/userChangePw1"; 
		}

		UserAuthInfo userAuthInfo = (UserAuthInfo) session.getAttribute("authInfo");
		try {
			userChangePwService.changePassword(userAuthInfo.getUserId(), userChangePw.getCurrentUserPw(),
					userChangePw.getNewUserPw());
			return "account/userChangePw2";
		} catch (WrongIdPasswordException e) {
			errors.rejectValue("currentUserPw", "notMatching");
			return "account/userChangePw1";
		}
	}

}
