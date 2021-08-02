package proj21_funding.dto.account;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

// 회원정보 
public class UserInfo {
	private int userNo; // 회원번호
	@Size(min = 4)
	private String userId; // 회원계정
	@Size(min = 4)
	private String userPw; // 비밀번호
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
	private String detailAddress;// 상세주소
	private String bankName; // 은행명
	private String accountHolder; // 예금주	
	private String bankAccount; // 계좌번호
	private boolean secession; // 탈퇴여부

	// 생성자
	public UserInfo() {
	}

	// 회원번호
	public UserInfo(int userNo) {
		this.userNo = userNo;
	}

	// 회원아이디
	public UserInfo(String userId) {
		this.userId = userId;
	}

	// 아이디 찾기
	public UserInfo(String userName, @Email @NotBlank String email) {
		this.userName = userName;
		this.email = email;
	}

	public UserInfo(@Size(min = 4) String userId, @Size(min = 4) String userPw, @NotBlank String userName,
			@NotBlank String nickName, @Email @NotBlank String email, String userPhone, int zipCode,
			@NotBlank String address, String detailAddress, String bankName, String accountHolder, String bankAccount) {
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.nickName = nickName;
		this.email = email;
		this.userPhone = userPhone;
		this.zipCode = zipCode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.bankName = bankName;
		this.accountHolder = accountHolder;
		this.bankAccount = bankAccount;
	}
	
// 계좌 등록

	public UserInfo(int userNo, String bankName, String accountHolder, String bankAccount) {
		super();
		this.userNo = userNo;
		this.bankName = bankName;
		this.accountHolder = accountHolder;
		this.bankAccount = bankAccount;
	}

	// getter & setter
	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

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

	public boolean isSecession() {
		return secession;
	}

	public void setSecession(boolean secession) {
		this.secession = secession;
	}

	public String getAccountHolder() {
		return accountHolder;
	}

	public void setAccountHolder(String accountHolder) {
		this.accountHolder = accountHolder;
	}

	@Override
	public String toString() {
		return String.format(
				"UserInfo [userNo=%s, userId=%s, userPw=%s, userName=%s, nickName=%s, email=%s, userPhone=%s, zipCode=%s, address=%s, detailAddress=%s, bankName=%s, accountHolder=%s, bankAccount=%s, secession=%s]",
				userNo, userId, userPw, userName, nickName, email, userPhone, zipCode, address, detailAddress, bankName,
				accountHolder, bankAccount, secession);
	}



}
