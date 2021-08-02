package proj21_funding.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.account.UserLogin;
import proj21_funding.exception.WrongIdPasswordException;
import proj21_funding.mapper.UserInfoMapper;
import proj21_funding.service.UserChangePwService;


@Service
public class UserChangePwServiceImpl implements UserChangePwService {

	@Autowired
	private UserInfoMapper mapper;

	@Transactional
	public void changePassword(String userId, String oldPwd, String newPwd) {
		UserLogin userLogin = new UserLogin(userId, oldPwd);
		UserInfo userInfo = mapper.selectUserbylogin(userLogin);
		if (userInfo == null) {
			throw new WrongIdPasswordException();
		}	
		userInfo.setUserPw(newPwd);		
		
		mapper.updateUserPw(userInfo);
	}

}
