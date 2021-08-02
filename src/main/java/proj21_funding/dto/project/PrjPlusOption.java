package proj21_funding.dto.project;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

//프로젝트 등록 업데이트 커멘드객
public class PrjPlusOption {
	
	private int pNo;	//프로젝트No
	private int uNo;	//유저No
	private int pCateNo; 	//카테고리No
	private String pName;	//프로젝트Name
	private String pContent;	// 프로젝트Content
	private int pGoal; //프로젝트Goal
	@DateTimeFormat(pattern = "yyyy-MM-dd") // 데이터 타임 포맷트 패턴 "와이와이와이와이-앰앰-디디"
	private LocalDate sDate;//시작일  
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate eDate;	//마감일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate pDate;	//결제일
	private int totalprice;		//프로젝트opt총가격
	private int oNo;  //옵션No
	private String oName; //옵션Name
	private int oPrice; //옵션Price
	private String oContent; //옵션Content
	//추가옵션 No
	private int addOptNo1;
	private int addOptNo2;
	private int addOptNo3;
	//추가옵션 Name
	private String addOptName1;
	private String addOptName2;
	private String addOptName3;
	//추가옵션 Price
	private int addOptPrice1;
	private int addOptPrice2;
	private int addOptPrice3;
	//추가옵션 Content
	private String addOptContent1;
	private String addOptContent2;
	private String addOptContent3;
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public int getpCateNo() {
		return pCateNo;
	}
	public void setpCateNo(int pCateNo) {
		this.pCateNo = pCateNo;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public int getpGoal() {
		return pGoal;
	}
	public void setpGoal(int pGoal) {
		this.pGoal = pGoal;
	}
	public LocalDate getsDate() {
		return sDate;
	}
	public void setsDate(LocalDate sDate) {
		this.sDate = sDate;
	}
	public LocalDate geteDate() {
		return eDate;
	}
	public void seteDate(LocalDate eDate) {
		this.eDate = eDate;
	}
	public LocalDate getpDate() {
		return pDate;
	}
	public void setpDate(LocalDate pDate) {
		this.pDate = pDate;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public int getoNo() {
		return oNo;
	}
	public void setoNo(int oNo) {
		this.oNo = oNo;
	}
	public String getoName() {
		return oName;
	}
	public void setoName(String oName) {
		this.oName = oName;
	}
	public int getoPrice() {
		return oPrice;
	}
	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}
	public String getoContent() {
		return oContent;
	}
	public void setoContent(String oContent) {
		this.oContent = oContent;
	}
	public int getAddOptNo1() {
		return addOptNo1;
	}
	public void setAddOptNo1(int addOptNo1) {
		this.addOptNo1 = addOptNo1;
	}
	public int getAddOptNo2() {
		return addOptNo2;
	}
	public void setAddOptNo2(int addOptNo2) {
		this.addOptNo2 = addOptNo2;
	}
	public int getAddOptNo3() {
		return addOptNo3;
	}
	public void setAddOptNo3(int addOptNo3) {
		this.addOptNo3 = addOptNo3;
	}
	public String getAddOptName1() {
		return addOptName1.trim();
	}
	public void setAddOptName1(String addOptName1) {
		this.addOptName1 = addOptName1;
	}
	public String getAddOptName2() {
		return addOptName2;
	}
	public void setAddOptName2(String addOptName2) {
		this.addOptName2 = addOptName2;
	}
	public String getAddOptName3() {
		return addOptName3;
	}
	public void setAddOptName3(String addOptName3) {
		this.addOptName3 = addOptName3;
	}
	public int getAddOptPrice1() {
		return addOptPrice1;
	}
	public void setAddOptPrice1(int addOptPrice1) {
		this.addOptPrice1 = addOptPrice1;
	}
	public int getAddOptPrice2() {
		return addOptPrice2;
	}
	public void setAddOptPrice2(int addOptPrice2) {
		this.addOptPrice2 = addOptPrice2;
	}
	public int getAddOptPrice3() {
		return addOptPrice3;
	}
	public void setAddOptPrice3(int addOptPrice3) {
		this.addOptPrice3 = addOptPrice3;
	}
	public String getAddOptContent1() {
		return addOptContent1.trim();
	}
	public void setAddOptContent1(String addOptContent1) {
		this.addOptContent1 = addOptContent1;
	}
	public String getAddOptContent2() {
		return addOptContent2;
	}
	public void setAddOptContent2(String addOptContent2) {
		this.addOptContent2 = addOptContent2;
	}
	public String getAddOptContent3() {
		return addOptContent3;
	}
	public void setAddOptContent3(String addOptContent3) {
		this.addOptContent3 = addOptContent3;
	}
	@Override
	public String toString() {
		return String.format(
				"PrjPlusOption [pNo=%s, pCateNo=%s, pName=%s, pContent=%s, pGoal=%s, eDate=%s, pDate=%s, oNo=%s, oName=%s, oPrice=%s, oContent=%s]",
				pNo, pCateNo, pName, pContent, pGoal, eDate, pDate, oNo, oName, oPrice, oContent);
	}
	
	
	
	
	

}
