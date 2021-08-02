package proj21_funding.dto;

public class PrjCategory {
	private int pCategoryNo;
	private String pCategoryName;
	

	public PrjCategory() {}
	
	public PrjCategory(int pCategoryNo) {
		this.pCategoryNo = pCategoryNo;
	}

	
	public PrjCategory(int pCategoryNo, String pCategoryName) {
		this.pCategoryNo = pCategoryNo;
		this.pCategoryName = pCategoryName;		}
	

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

	@Override
	public String toString() {
		return String.format("PrjCategory [pCategoryNo=%s, pCategoryName=%s]", pCategoryNo, pCategoryName);
	}
	
	
	

}
