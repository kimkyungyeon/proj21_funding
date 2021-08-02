package proj21_funding.dto;

import proj21_funding.dto.account.UserInfo;

//후원정보
public class FundingInfo {
	private int fundingNo;//후원번호  		ex)F00001
	private UserInfo userNo; //회원번호  		ex)U00001
	private Project prjNo;   //프로젝트번호  		ex)P00001
	private PrjOption optNo; //옵션번호		ex)O00001
	private String accountNo;	 //계좌(카드)번호
	private int zipCode;		//우편번호
	private String address;		//주소
	private String detailAddress;//상세주소
	private boolean payYn;	 //결제여부
	private boolean endYn;	 //마감여부	
	
//	생성자
	public FundingInfo() {
	}
	

	//후원번호 검색
	public FundingInfo(int fundingNo) {
		this.fundingNo = fundingNo;
	}
	
	

	
	public FundingInfo(UserInfo userNo, Project prjNo, PrjOption optNo, String accountNo, int zipCode, String address,
			String detailAddress) {
		this.userNo = userNo;
		this.prjNo = prjNo;
		this.optNo = optNo;
		this.accountNo = accountNo;
		this.zipCode = zipCode;
		this.address = address;
		this.detailAddress = detailAddress;
	}


	//	getter & setter
	public int getFundingNo() {
		return fundingNo;
	}
	public void setFundingNo(int fundingNo) {
		this.fundingNo = fundingNo;
	}
	
	public UserInfo getUserNo() {
		return userNo;
	}


	public void setUserNo(UserInfo userNo) {
		this.userNo = userNo;
	}


	public PrjOption getOptNo() {
		return optNo;
	}


	public void setOptNo(PrjOption optNo) {
		this.optNo = optNo;
	}


	public Project getPrjNo() {
		return prjNo;
	}


	public void setPrjNo(Project prjNo) {
		this.prjNo = prjNo;
	}


	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public boolean isPayYn() {
		return payYn;
	}
	public void setPayYn(boolean payYn) {
		this.payYn = payYn;
	}
	public boolean isEndYn() {
		return endYn;
	}
	public void setEndYn(boolean endYn) {
		this.endYn = endYn;
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


	@Override
	public String toString() {
		return String.format(
				"FundingInfo [fundingNo=%s, userNo=%s, prjNo=%s, optNo=%s, accountNo=%s, zipCode=%s, address=%s, detailAddress=%s, payYn=%s, endYn=%s]",
				fundingNo, userNo, prjNo, optNo, accountNo, zipCode, address, detailAddress, payYn, endYn);
	}


	

	
}
