package proj21_funding.dto;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.InputMismatchException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.format.annotation.DateTimeFormat;

import proj21_funding.dto.account.UserInfo;
import proj21_funding.exception.InputTypeStringError;

public class Project {
	private int prjNo;			//프로젝트번호	
	private UserInfo userNo;		//프로젝트관리자
	private PrjCategory pCategoryNo;		//프로젝트 분류
	private String prjName;			//프로젝트명
	private String prjContent;		//프로젝트내용
	private int prjGoal;			//목표금액
	@DateTimeFormat(pattern = "yyyy-MM-dd") // 데이터 타임 포맷트 패턴 "와이와이와이와이-앰앰-디디"
	private LocalDate startDate;//시작일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate endDate;	//마감일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate payDate;	//결제일
	private boolean	endYn;			//마감여부
	private int totalPrice;
	private HttpServletResponse response;
	
//	생성자
	public Project() {
	}
	
	//프로젝트 등록	
	public Project(UserInfo userNo, PrjCategory pCategoryNo, String prjName, String prjContent, int prjGoal, 
			LocalDate endDate, LocalDate payDate) {
		this.userNo = userNo;
		this.pCategoryNo = pCategoryNo;
		this.prjName = prjName;
		this.prjContent = prjContent;
		this.prjGoal = prjGoal;
		this.endDate = endDate;
		this.payDate = payDate;
	}

	//프로젝트 수정
	public Project(int prjNo, PrjCategory pCategoryNo, String prjName, String prjContent, int prjGoal,
			LocalDate endDate, LocalDate payDate) {
		this.prjNo = prjNo;
		this.pCategoryNo = pCategoryNo;
		this.prjName = prjName;
		this.prjContent = prjContent;
		this.prjGoal = prjGoal;
		this.endDate = endDate;
		this.payDate = payDate;
	}

	public Project(int prjNo) {
		this.prjNo = prjNo;
	}
	
	
	public Project(UserInfo userNo) {
		this.userNo = userNo;
	}


	//	getter & setter
	public int getPrjNo() {
		return prjNo;
	}

	public void setPrjNo(int prjNo) {
		this.prjNo = prjNo;
	}

	public UserInfo getUserNo() {
		return userNo;
	}

	public void setUserNo(UserInfo userNo) {
		this.userNo = userNo;
	}

	public String getPrjName() {
		return prjName;
	}

	public void setPrjName(String prjName) {
		this.prjName = prjName;
	}


	public PrjCategory getpCategoryNo() {
		return pCategoryNo;
	}

	public void setpCategoryNo(PrjCategory pCategoryNo) {
		this.pCategoryNo = pCategoryNo;
	}

	public String getPrjContent() {
		return prjContent;
	}

	public void setPrjContent(String prjContent) {
		this.prjContent = prjContent;
	}

	public int getPrjGoal()  {			
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

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return String.format(
				"Project [prjNo=%s, userNo=%s, pCategoryNo=%s, prjName=%s, prjContent=%s, prjGoal=%s, startDate=%s, endDate=%s, payDate=%s, endYn=%s, totalPrice=%s]",
				prjNo, userNo, pCategoryNo, prjName, prjContent, prjGoal, startDate, endDate, payDate, endYn,
				totalPrice);
	}
	


	
}
