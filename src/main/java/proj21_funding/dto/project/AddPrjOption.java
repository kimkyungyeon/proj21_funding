package proj21_funding.dto.project;

import proj21_funding.dto.Project;

public class AddPrjOption {
	private Project prjNo;
	private int addOptNo1;
	private String addOptName1;
	private int addOptPrice1;
	private String addOptContent1;
	private int addOptNo2;
	private String addOptName2;
	private int addOptPrice2;
	private String addOptContent2;
	
	public AddPrjOption() {}

	public AddPrjOption(Project prjNo) {
		this.prjNo = prjNo;
	}

	public AddPrjOption(int addOptNo1) {
		this.addOptNo1 = addOptNo1;
	}	
	public AddPrjOption(Project prjNo, String addOptName1, int addOptPrice1, String addOptContent1) {
		this.prjNo = prjNo;
		this.addOptName1 = addOptName1;
		this.addOptPrice1 = addOptPrice1;
		this.addOptContent1 = addOptContent1;
	}

	public AddPrjOption(Project prjNo, String addOptName1, int addOptPrice1, String addOptContent1, String addOptName2,
			int addOptPrice2, String addOptContent2) {
		this.prjNo = prjNo;
		this.addOptName1 = addOptName1;
		this.addOptPrice1 = addOptPrice1;
		this.addOptContent1 = addOptContent1;
		this.addOptName2 = addOptName2;
		this.addOptPrice2 = addOptPrice2;
		this.addOptContent2 = addOptContent2;
	}
	

	public AddPrjOption(int addOptNo1, String addOptName1, int addOptPrice1, String addOptContent1) {
		this.addOptNo1 = addOptNo1;
		this.addOptName1 = addOptName1;
		this.addOptPrice1 = addOptPrice1;
		this.addOptContent1 = addOptContent1;
	}
	
	

	public Project getPrjNo() {
		return prjNo;
	}

	public void setPrjNo(Project prjNo) {
		this.prjNo = prjNo;
	}

	public int getAddOptNo1() {
		return addOptNo1;
	}

	public void setAddOptNo1(int addOptNo1) {
		this.addOptNo1 = addOptNo1;
	}

	public String getAddOptName1() {
		return addOptName1;
	}

	public void setAddOptName1(String addOptName1) {
		this.addOptName1 = addOptName1;
	}

	public int getAddOptPrice1() {
		return addOptPrice1;
	}

	public void setAddOptPrice1(int addOptPrice1) {
		this.addOptPrice1 = addOptPrice1;
	}

	public String getAddOptContent1() {
		return addOptContent1;
	}

	public void setAddOptContent1(String addOptContent1) {
		this.addOptContent1 = addOptContent1;
	}

	public int getAddOptNo2() {
		return addOptNo2;
	}

	public void setAddOptNo2(int addOptNo2) {
		this.addOptNo2 = addOptNo2;
	}

	public String getAddOptName2() {
		return addOptName2;
	}

	public void setAddOptName2(String addOptName2) {
		this.addOptName2 = addOptName2;
	}

	public int getAddOptPrice2() {
		return addOptPrice2;
	}

	public void setAddOptPrice2(int addOptPrice2) {
		this.addOptPrice2 = addOptPrice2;
	}

	public String getAddOptContent2() {
		return addOptContent2;
	}

	public void setAddOptContent2(String addOptContent2) {
		this.addOptContent2 = addOptContent2;
	}

	@Override
	public String toString() {
		return String.format(
				"AddPrjOption [prjNo=%s, addOptNo1=%s, addOptName1=%s, addOptPrice1=%s, addOptContent1=%s, addOptNo2=%s, addOptName2=%s, addOptPrice2=%s, addOptContent2=%s]",
				prjNo, addOptNo1, addOptName1, addOptPrice1, addOptContent1, addOptNo2, addOptName2, addOptPrice2,
				addOptContent2);
	}	

}
