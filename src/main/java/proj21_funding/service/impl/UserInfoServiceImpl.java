package proj21_funding.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.account.UserLogin;
import proj21_funding.exception.CategoryException;
import proj21_funding.exception.DuplicateEmailException;
import proj21_funding.exception.DuplicateNickNameException;
import proj21_funding.exception.EmptySpaceException;
import proj21_funding.exception.WrongIdPasswordException;
import proj21_funding.mapper.UserInfoMapper;
import proj21_funding.service.UserInfoService;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	private UserInfoMapper mapper;

	@Override
	public int modifyUserInfo(UserInfo userInfo) {
		UserInfo userInfo1 = mapper.selectUserbyNickname(userInfo.getNickName());

		if (userInfo.getNickName().equals("관리자")) {
			throw new DuplicateNickNameException("dup nickname" + userInfo.getNickName());
		}

		if (userInfo1 != null) {
			if (userInfo.getUserId().equals(userInfo1.getUserId())) {
			} else {
				throw new DuplicateNickNameException("dup nickname" + userInfo.getNickName());
			}
		}

		UserInfo userInfo2 = mapper.selectUserbyEmail(userInfo.getEmail());
		if (userInfo2 != null) {
			if (userInfo.getEmail().equals(userInfo2.getEmail())) {
			} else {
				throw new DuplicateEmailException();
			}
			
		}
		
		return mapper.updateUser(userInfo);
	}

	@Override
	public int removeUserInfo(String userId, String userPw) {
		UserLogin userLogin = new UserLogin(userId, userPw);
		UserInfo userInfo = mapper.selectUserbylogin(userLogin);
		if(userInfo == null) {
			throw new WrongIdPasswordException();
		}
		return mapper.deleteUser(userInfo);
	}

	@Override
	public UserInfo showUserInfoById(String userId) {
		return mapper.selectUserbyId(userId);
	}

	@Override
	public List<UserInfo> showUserAll() {
		return mapper.selectUserAll();
	}

	@Override
	public List<UserInfo> showUserListbyId(String userId) {
		return mapper.selectUserListbyId(userId);
	}

	@Override
	public List<UserInfo> showUserListbyName(String userName) {
		return mapper.selectUserListbyName(userName);
	}

	@Override
	public List<UserInfo> showUserListbyNickname(String nickName) {
		return mapper.selectUserListbyNickname(nickName);
	}

	@Override
	public int userCount() {
		return mapper.userCount();
	}

	@Override
	public int currentUserCount() {
		return mapper.currentUserCount() ;
	}

	@Override
	public int prdcount() {
		return mapper.prdCount();
	}

	@Override
	public List<UserInfo> showUserListByMap(Map<String, Object> listMap) {
		return mapper.selectUserListByMap(listMap);
	}
	
	public UserInfo showBankAccount(int userNo) {
		return mapper.showBankAccount(userNo);
	}

//	 계좌등록
	@Override
	public int updateBankAccount(UserInfo userInfo) {
		int accountHolder = userInfo.getAccountHolder().trim().length();
		int bankAccount = userInfo.getBankAccount().trim().length();
		
		String bankName =  userInfo.getBankName();
		System.out.println("accountHolder>> "+ accountHolder);
		System.out.println("bankAccount>> "+ bankAccount);
		
		  if(accountHolder == 0 || bankAccount ==0) {
			 throw new EmptySpaceException("문자를 등록 해야됩니다."); 
			 }else if(bankName.contains("0")){
				 System.out.println("111");
			throw new CategoryException("은행명을 선택하세요.");
			 }
		
		return mapper.updateBankAccount(userInfo);
	}

	@Override
	public List<UserInfo> showUserListByMapAdmin(Map<String, Object> listMap) {
		return mapper.selectUserListByMapAdmin(listMap);
	}

	@Override
	public int showUserListByMapAdminCount(Map<String, Object> listMap) {
		return mapper.selectUserListByMapAdminCount(listMap);
	}

}
