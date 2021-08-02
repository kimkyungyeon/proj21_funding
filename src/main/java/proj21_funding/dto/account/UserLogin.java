package proj21_funding.dto.account;

// 로그인시도시  정보확인
public class UserLogin {
	private String userId;//회원계정
	private String userPw;//회원비밀번호
	private boolean rememberUserId; //아이디기억하기

	public UserLogin() {}

	public UserLogin(String userId, String userPw) {
		this.userId = userId;
		this.userPw = userPw;
	}

	// getter & setter
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public boolean isRememberUserId() {
		return rememberUserId;
	}

	public void setRememberUserId(boolean rememberUserId) {
		this.rememberUserId = rememberUserId;
	}

	@Override
	public String toString() {
		return String.format("LoginCommand [userId=%s, userPw=%s, rememberUserId=%s]", userId, userPw, rememberUserId);
	}
	

}
