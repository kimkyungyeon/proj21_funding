package proj21_funding.dto.account;

import javax.validation.constraints.Size;

// 비밀번호 변경
public class UserChangePw {

	private String currentUserPw; // 현재비빌번호
	@Size(min = 4)
	private String newUserPw; // 변경할비밀번호
	@Size(min = 4)
	private String confirmUserPw; // 비밀번호 확인

	// getter & setter
	public String getCurrentUserPw() {
		return currentUserPw;
	}

	public void setCurrentUserPw(String currentUserPw) {
		this.currentUserPw = currentUserPw;
	}

	public String getNewUserPw() {
		return newUserPw;
	}

	public void setNewUserPw(String newUserPw) {
		this.newUserPw = newUserPw;
	}

	public String getConfirmUserPw() {
		return confirmUserPw;
	}

	public void setConfirmUserPw(String confirmUserPw) {
		this.confirmUserPw = confirmUserPw;
	}

	public boolean isPasswordEqualToComfirmPassword() {
		return newUserPw.equals(confirmUserPw);
	}
}
