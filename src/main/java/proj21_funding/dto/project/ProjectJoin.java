package proj21_funding.dto.project;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class ProjectJoin {
	private int prjNo;
	private String userId;
	private String prjManager;
	private String managerName;
	private String prjName;
	private String prjContent;
	private int prjGoal;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate endDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate payDate;
	private boolean endYn;
	private int optNo;
	private String optName;
	private int optPrice;
	private String optContent;
	private int fundingNo;
	private String sponsor;
	private String sponsorName;
	private int accountNo;
	private boolean payYn;
	private double rate;
	private int totalCount;
	private int totalPrice;
	private int pCategoryNo;
	private String pCategoryName;
	
	public int getPrjNo() {
		return prjNo;
	}
	public void setPrjNo(int prjNo) {
		this.prjNo = prjNo;
	}
	public String getPrjManager() {
		return prjManager;
	}
	public void setPrjManager(String prjManager) {
		this.prjManager = prjManager;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPrjName() {
		return prjName;
	}
	public void setPrjName(String prjName) {
		this.prjName = prjName;
	}
	public String getPrjContent() {
		return prjContent;
	}
	public void setPrjContent(String prjContent) {
		this.prjContent = prjContent;
	}
	public int getPrjGoal() {
		return prjGoal;
	}
	public void setPrjGoal(int prjGoal) {
		this.prjGoal = prjGoal;
	}
	
	public LocalDate getStartDate() {
		return startDate;
	}
	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}
	public LocalDate getEndDate() {
		return endDate;
	}
	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}
	public LocalDate getPayDate() {
		return payDate;
	}
	public void setPayDate(LocalDate payDate) {
		this.payDate = payDate;
	}
	public boolean isEndYn() {
		return endYn;
	}
	public void setEndYn(boolean endYn) {
		this.endYn = endYn;
	}
	public int getOptNo() {
		return optNo;
	}
	public void setOptNo(int optNo) {
		this.optNo = optNo;
	}
	public String getOptName() {
		return optName;
	}
	public void setOptName(String optName) {
		this.optName = optName;
	}
	public int getOptPrice() {
		return optPrice;
	}
	public void setOptPrice(int optPrice) {
		this.optPrice = optPrice;
	}
	public String getOptContent() {
		return optContent;
	}
	public void setOptContent(String optContent) {
		this.optContent = optContent;
	}
	public int getFundingNo() {
		return fundingNo;
	}
	public void setFundingNo(int fundingNo) {
		this.fundingNo = fundingNo;
	}
	public String getSponsor() {
		return sponsor;
	}
	public void setSponsor(String sponsor) {
		this.sponsor = sponsor;
	}
	public int getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(int accountNo) {
		this.accountNo = accountNo;
	}
	public boolean isPayYn() {
		return payYn;
	}
	public void setPayYn(boolean payYn) {
		this.payYn = payYn;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getpCategoryNo() {
		return pCategoryNo;
	}
	public void setpCategoryNo(int pCategoryNo) {
		this.pCategoryNo = pCategoryNo;
	}
	public String getpCategoryName() {
		return pCategoryName;
	}
	public void setpCategoryName(String pCategoryName) {
		this.pCategoryName = pCategoryName;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getSponsorName() {
		return sponsorName;
	}
	public void setSponsorName(String sponsorName) {
		this.sponsorName = sponsorName;
	}
	@Override
	public String toString() {
		return String.format(
				"ProjectJoin [prjNo=%s, prjManager=%s, prjName=%s, prjContent=%s, prjGoal=%s, startDate=%s, endDate=%s, payDate=%s, endYn=%s, optNo=%s, optName=%s, optPrice=%s, optContent=%s, fundingNo=%s, sponsor=%s, accountNo=%s, payYn=%s, rate=%s, totalCount=%s, totalPrice=%s, pCategoryNo=%s, pCategoryName=%s]",
				prjNo, prjManager, prjName, prjContent, prjGoal, startDate, endDate, payDate, endYn, optNo, optName,
				optPrice, optContent, fundingNo, sponsor, accountNo, payYn, rate, totalCount, totalPrice, pCategoryNo,
				pCategoryName);
	}
	
	

	
	
}
