package proj21_funding.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import proj21_funding.dto.account.UserInfo;

@Service
public interface UserInfoService {

	int modifyUserInfo(UserInfo userInfo);

	int removeUserInfo(String userId, String userPw);
	
	UserInfo showUserInfoById(String userId);
	
	List<UserInfo> showUserAll();
	List<UserInfo> showUserListbyId(String userId);
	List<UserInfo> showUserListbyName(String userName);
	List<UserInfo> showUserListbyNickname(String nickName);
	
	int userCount();
	int currentUserCount();
	int prdcount();
	List<UserInfo> showUserListByMap(Map<String,Object> listMap);
	//	계좌 확인
	UserInfo showBankAccount(int userNo);
	// 계좌 등록 업데이트
	int updateBankAccount(UserInfo userInfo);
	
	List<UserInfo> showUserListByMapAdmin(Map<String, Object> listMap);
	int showUserListByMapAdminCount(Map<String, Object> listMap);

}
