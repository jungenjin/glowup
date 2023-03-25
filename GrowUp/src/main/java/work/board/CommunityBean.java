package work.board;

import java.io.Serializable;

public class CommunityBean implements Serializable{
	private String comuNo;		//글번호
	private String comuTitle;	//제목
	private String comuContent;	//내용
	private String comuRegId;	//등록자
	private String comuRegDate;	//등록일자
	private String comuModId;   //수정자
	private String comuModDate;	//수정일자
	private String comuHit;		//조회수

	public CommunityBean() {
		super();
	}

	public CommunityBean(String comuNo, String comuTitle, String comuContent, String comuRegId, String comuRegDate, String comuModId,
			String comuModDate, String comuHit) {
		super();
		this.comuNo = comuNo;
		this.comuTitle = comuTitle;
		this.comuContent = comuContent;
		this.comuRegId = comuRegId;
		this.comuRegDate = comuRegDate;
		this.comuModId = comuModId;
		this.comuModDate = comuModDate;
		this.comuHit = comuHit;
	}



	public String getComuNo() {
		return comuNo;
	}

	public void setComuNo(String comuNo) {
		this.comuNo = comuNo;
	}

	public String getComuTitle() {
		return comuTitle;
	}

	public void setComuTitle(String comuTitle) {
		this.comuTitle = comuTitle;
	}

	public String getComuContent() {
		return comuContent;
	}

	public void setComuContent(String comuContent) {
		this.comuContent = comuContent;
	}

	public String getComuRegId() {
		return comuRegId;
	}

	public void setComuRegId(String comuRegId) {
		this.comuRegId = comuRegId;
	}

	public String getComuRegDate() {
		return comuRegDate;
	}

	public void setComuRegDate(String comuRegDate) {
		this.comuRegDate = comuRegDate;
	}
	

	public String getComuModId() {
		return comuModId;
	}

	public void setComuModId(String comuModId) {
		this.comuModId = comuModId;
	}

	public String getComuModDate() {
		return comuModDate;
	}

	public void setComuModDate(String comuModDate) {
		this.comuModDate = comuModDate;
	}

	public String getComuHit() {
		return comuHit;
	}

	public void setComuHit(String comuHit) {
		this.comuHit = comuHit;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CommunityBean [communityNo=");
		builder.append(comuNo);
		builder.append(", communityTitle=");
		builder.append(comuTitle);
		builder.append(", communityContent=");
		builder.append(comuContent);
		builder.append(", communityRegId=");
		builder.append(comuRegId);
		builder.append(", communityRegDate=");
		builder.append(comuRegDate);
		builder.append(", communityModId=");
		builder.append(comuModId);
		builder.append(", communityModDate=");
		builder.append(comuModDate);
		builder.append(", communityHit=");
		builder.append(comuHit);
		builder.append("]");
		return builder.toString();
	}

}
