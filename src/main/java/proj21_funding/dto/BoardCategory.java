package proj21_funding.dto;

public class BoardCategory {
	private int categoryNo; // 게시글 분류
	private String categoryName; // 분류명
	private String categoryClass; // 적용게시판

	public BoardCategory() {
		super();
	}

	public BoardCategory(int categoryNo, String categoryName, String categoryClass) {
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.categoryClass = categoryClass;
	}

	public BoardCategory(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public BoardCategory(String categoryName, String categoryClass) {
		this.categoryName = categoryName;
		this.categoryClass = categoryClass;
	}

	/* getter & setter */
	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryClass() {
		return categoryClass;
	}

	public void setCategoryClass(String categoryClass) {
		this.categoryClass = categoryClass;
	}

	/* toString */
	@Override
	public String toString() {
		return "BoardCategory [categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", categoryClass="
				+ categoryClass + "]";
	}

	
}
