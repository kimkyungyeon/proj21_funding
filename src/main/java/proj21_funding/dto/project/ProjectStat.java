package proj21_funding.dto.project;

public class ProjectStat {
	private String period;
	private String nickname;
	private int count1;
	private int count2;
	private int sum1;
	private int sum2;

	public ProjectStat() {
		super();
	}
	
	
	public ProjectStat(String period, String nickname, int count1, int count2, int sum1, int sum2) {
		this.period = period;
		this.nickname = nickname;
		this.count1 = count1;
		this.count2 = count2;
		this.sum1 = sum1;
		this.sum2 = sum2;
	}


	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getCount1() {
		return count1;
	}
	public void setCount1(int count1) {
		this.count1 = count1;
	}
	public int getCount2() {
		return count2;
	}
	public void setCount2(int count2) {
		this.count2 = count2;
	}
	public int getSum1() {
		return sum1;
	}
	public void setSum1(int sum1) {
		this.sum1 = sum1;
	}
	public int getSum2() {
		return sum2;
	}
	public void setSum2(int sum2) {
		this.sum2 = sum2;
	}


	@Override
	public String toString() {
		return String.format("ProjectStat [period=%s, nickname=%s, count1=%s, count2=%s, sum1=%s, sum2=%s]", period,
				nickname, count1, count2, sum1, sum2);
	}
	
	
	
}
