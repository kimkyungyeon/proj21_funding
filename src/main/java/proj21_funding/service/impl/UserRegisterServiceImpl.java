package proj21_funding.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.Admin;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.account.UserSignUp;
import proj21_funding.exception.DuplicateEmailException;
import proj21_funding.exception.DuplicateNickNameException;
import proj21_funding.exception.DuplicateUserException;
import proj21_funding.mapper.AdminMapper;
import proj21_funding.mapper.UserInfoMapper;
import proj21_funding.service.UserRegisterService;

@Service
public class UserRegisterServiceImpl implements UserRegisterService {

	@Autowired
	private UserInfoMapper mapper;

	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public int regist(UserSignUp userSignUp) {		
		Admin admin = adminMapper.selectAdminbyId(userSignUp.getUserId());
		if(admin != null) {
			throw new DuplicateUserException();
		}
		
		UserInfo userInfo = mapper.selectUserbyId(userSignUp.getUserId());
		if (userInfo != null) {
			throw new DuplicateUserException();
		}	
		
		UserInfo userInfo1 = mapper.selectUserbyNickname(userSignUp.getNickName());
		if (userInfo1 != null) {
			throw new DuplicateNickNameException();
		}	
		
		if(userSignUp.getNickName().equals("관리자")) {
			throw new DuplicateNickNameException();
		}
		
		UserInfo userInfo2 = mapper.selectUserbyEmail(userSignUp.getEmail());
		if (userInfo2 != null) {
			throw new DuplicateEmailException();
		}
		
		
		UserInfo newUserInfo = new UserInfo(
				userSignUp.getUserId(), userSignUp.getUserPw(), userSignUp.getUserName(),
				userSignUp.getNickName(), userSignUp.getEmail(), userSignUp.getUserPhone(),
				userSignUp.getZipCode(), userSignUp.getAddress(), userSignUp.getDetailAddress(),
				userSignUp.getBankName(), userSignUp.getAccountHolder(), userSignUp.getBankAccount());

		mapper.insertUser(newUserInfo);
		return newUserInfo.getUserNo();
	}

}
