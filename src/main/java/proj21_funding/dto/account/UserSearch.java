package proj21_funding.dto.account;

import javax.validation.constraints.Email;

public class UserSearch {
	private String userId; // 회원계정
	private String userName; // 회원성명
	@Email
	private String email; // 회원H.P


	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return String.format("UserSearch [userId=%s, userName=%s, email=%s]", userId, userName, email);
	}

	

}
