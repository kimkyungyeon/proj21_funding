package proj21_funding.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;


import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.account.UserLogin;

@Component
public interface UserInfoMapper {

	List<UserInfo> selectUserAll();

	UserInfo selectUserbyNo(int userNo);

	UserInfo selectUserbyId(String userId);
	
	UserInfo selectUserbyNickname(String nickname);
	
	UserInfo selectUserbyEmail(String email);

	UserInfo selectUserbylogin(UserLogin userLogin);

	UserInfo selectUserbySearchId(UserInfo userInfo);

	//	계좌 확인
	UserInfo showBankAccount(int userNo);
	// 계좌 등록 업데이트
	int updateBankAccount(UserInfo userInfo);
	
	int insertUser(UserInfo userInfo);

	int updateUser(UserInfo userInfo);

	int updateUserPw(UserInfo userInfo);

	int deleteUser(UserInfo userInfo);
	
//	회원 검색시 리스트로 리턴
	List<UserInfo> selectUserListbyId(String userId);
	List<UserInfo> selectUserListbyName(String userName);
	List<UserInfo> selectUserListbyNickname(String nickName);
//	회원수
	int userCount();
	int currentUserCount();
	int prdCount();
//	회원찾기 Map이용
	List<UserInfo> selectUserListByMap(Map<String, Object> listMap);
//	desc
	List<UserInfo> selectUserListByMapAdmin(Map<String, Object> listMap);
	int selectUserListByMapAdminCount(Map<String, Object> listMap);
	

}
