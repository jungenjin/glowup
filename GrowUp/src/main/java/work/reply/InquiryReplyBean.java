package work.reply;

import java.io.Serializable;

public class InquiryReplyBean implements Serializable{
	private String inqNo;     //1:1문의 게시글번호
	private String inqreNo;    	 //댓글번호
	private String userCode;	 //댓글작성자
	private String inqreContent; //댓글내용
	private String inqreRegDate; //댓글날짜

	public InquiryReplyBean(String inqNo, String inqreNo, String userCode, String inqreContent, String inqreRegDate) {
		super();
		this.inqNo = inqNo;
		this.inqreNo = inqreNo;
		this.userCode = userCode;
		this.inqreContent = inqreContent;
		this.inqreRegDate = inqreRegDate;
	}

	public String getInqNo() {
		return inqNo;
	}

	public void setInqNo(String inqNo) {
		this.inqNo = inqNo;
	}

	public String getInqreNo() {
		return inqreNo;
	}

	public void setInqreNo(String inqreNo) {
		this.inqreNo = inqreNo;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getInqreContent() {
		return inqreContent;
	}

	public void setInqreContent(String inqreContent) {
		this.inqreContent = inqreContent;
	}

	public String getInqreRegDate() {
		return inqreRegDate;
	}

	public void setInqreRegDate(String inqreRegDate) {
		this.inqreRegDate = inqreRegDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("InquiryReplyBean [inqNo=");
		builder.append(inqNo);
		builder.append(", inqreNo=");
		builder.append(inqreNo);
		builder.append(", userCode=");
		builder.append(userCode);
		builder.append(", inqreContent=");
		builder.append(inqreContent);
		builder.append(", inqreRegDate=");
		builder.append(inqreRegDate);
		builder.append("]");
		return builder.toString();
	}
}
