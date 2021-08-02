package proj21_funding.dto;

import proj21_funding.dto.account.UserInfo;

public class PrjBoardReply {
	private int replyNo; // 답글번호
	private int postNo; // 게시글번호
	private UserInfo userNo; // 회원번호
	private String replyContent; // 답글내용

	public PrjBoardReply() {
		// TODO Auto-generated constructor stub
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public UserInfo getUserNo() {
		return userNo;
	}

	public void setUserNo(UserInfo userNo) {
		this.userNo = userNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	@Override
	public String toString() {
		return String.format("PrjBoardReply [replyNo=%s, postNo=%s, userNo=%s, replyContent=%s]", replyNo, postNo,
				userNo, replyContent);
	}

}
