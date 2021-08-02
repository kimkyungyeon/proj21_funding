package proj21_funding.dto;

import java.time.LocalDateTime;
import java.util.Arrays;

import proj21_funding.dto.account.UserInfo;

public class PrjBoard {
	private int postNo; // 게시글번호
	private int prjNo;// 프로젝트번호
	private UserInfo userNo;// 글작성자
	private String postContent;// 게시글내용
	private LocalDateTime postDate;// 게시글날짜
	private byte[] postFile;// 첨부파일
	private String fileName;// 파일이름

	// 기본생성자
	public PrjBoard() {
	}

	// 게시글 번호 검색
	public PrjBoard(int postNo) {
		this.postNo = postNo;
	}

	// Getter &Setter

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

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

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public LocalDateTime getPostDate() {
		return postDate;
	}

	public void setPostDate(LocalDateTime postDate) {
		this.postDate = postDate;
	}

	public byte[] getPostFile() {
		return postFile;
	}

	public void setPostFile(byte[] postFile) {
		this.postFile = postFile;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return String.format(
				"PrjBoard [postNo=%s, prjNo=%s, userNo=%s, postContent=%s, postDate=%s, postFile=%s, fileName=%s]",
				postNo, prjNo, userNo, postContent, postDate, Arrays.toString(postFile), fileName);
	}

}
