package proj21_funding.dto;

import java.time.LocalDateTime;
import java.util.Arrays;

//메세지
public class Message {
	private int msgNo; // 메세지번호
	private String sendUser; // 발신자
	private String receiveUser;// 수신자
	private String msgContent; // 내용
	private LocalDateTime sendDate; // 발신일
	private boolean readYN; // 확인여부
	private boolean delSend; //보낸메세지삭제
	private boolean delRecevie; // 받은메세지삭제
	private String[] check; // 체크여부	
	private int currentPage; // 현재페이지
	// 생성자
	public Message() {
	}

	public Message(String sendUser, String receiveUser, String msgContent) {
		this.sendUser = sendUser;
		this.receiveUser = receiveUser;
		this.msgContent = msgContent;
	}

	// getter & setter
	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public String getSendUser() {
		return sendUser;
	}

	public void setSendUser(String sendUser) {
		this.sendUser = sendUser;
	}

	public String getReceiveUser() {
		return receiveUser;
	}

	public void setReceiveUser(String receiveUser) {
		this.receiveUser = receiveUser;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public LocalDateTime getSendDate() {
		return sendDate;
	}

	public void setSendDate(LocalDateTime sendDate) {
		this.sendDate = sendDate;
	}

	public boolean isReadYN() {
		return readYN;
	}

	public void setReadYN(boolean readYN) {
		this.readYN = readYN;
	}

	public boolean isDelSend() {
		return delSend;
	}

	public void setDelSend(boolean delSend) {
		this.delSend = delSend;
	}

	public boolean isDelRecevie() {
		return delRecevie;
	}

	public void setDelRecevie(boolean delRecevie) {
		this.delRecevie = delRecevie;
	}

	public String[] getCheck() {
		return check;
	}

	public void setCheck(String[] check) {
		this.check = check;
	}

	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	@Override
	public String toString() {
		return String.format(
				"Message [msgNo=%s, sendUser=%s, receiveUser=%s, msgContent=%s, sendDate=%s, readYN=%s, delSend=%s, delRecevie=%s, check=%s]",
				msgNo, sendUser, receiveUser, msgContent, sendDate, readYN, delSend, delRecevie,
				Arrays.toString(check));
	}

	

}
