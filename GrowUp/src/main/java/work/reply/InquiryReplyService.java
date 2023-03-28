package work.reply;

import java.util.List;
import java.util.Map;


public interface InquiryReplyService {

	public List<Map<String, String>> inquiryReplyList(Map<String, String> inqreParam);

	public void inquiryReplyWrite(Map<String, String> inqreParam);

	public void inquiryReplyModify(Map<String, String> inqreParam);
	
	public void inquiryReplyDelete(Map<String, String> inqreParam);
}
