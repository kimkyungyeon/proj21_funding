package proj21_funding.dto.account;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

// 회원가입시 양식 제한
public class UserSignUp {
	@Size(min = 4)
	private String userId; // 회원계정
	@Size(min = 4)
//	@Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\\\W).{4,20}")
	private String userPw; // 비밀번호
	@Size(min = 4)
//	@Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\\\W).{4,20}")
	private String confirmUserPw; // 비밀번호확인
	@NotBlank
	private String userName; // 회원성명
	@NotBlank
	private String nickName; // 회원별명
	@Email
	@NotBlank
	private String email; // 이메일
	private String userPhone; // 회원H.P
	private int zipCode; // 우편번호
	@NotBlank
	private String address; // 주소
	private String detailAddress; // 상세주소
	private String bankName; // 은행명
	private String accountHolder; // 예금주
	private String bankAccount; // 계좌번호
	private Boolean agree;

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

	public String getConfirmUserPw() {
		return confirmUserPw;
	}

	public void setConfirmUserPw(String confirmUserPw) {
		this.confirmUserPw = confirmUserPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public int getZipCode() {
		return zipCode;
	}

	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

	public Boolean getAgree() {
		return agree;
	}

	public void setAgree(Boolean agree) {
		this.agree = agree;
	}

	public String getAccountHolder() {
		return accountHolder;
	}

	public void setAccountHolder(String accountHolder) {
		this.accountHolder = accountHolder;
	}

	// 비밀번호 일치확인
	public boolean isPasswordEqualToComfirmPassword() {
		return userPw.equals(confirmUserPw);
	}

	@Override
	public String toString() {
		return String.format(
				"UserSignUp [userId=%s, userPw=%s, confirmUserPw=%s, userName=%s, nickName=%s, email=%s, userPhone=%s, zipCode=%s, address=%s, detailAddress=%s, bankName=%s, accountHolder=%s, bankAccount=%s, agree=%s]",
				userId, userPw, confirmUserPw, userName, nickName, email, userPhone, zipCode, address, detailAddress,
				bankName, accountHolder, bankAccount, agree);
	}



	

}
