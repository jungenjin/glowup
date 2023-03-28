package work.reply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("inquiryReplyService")
public class InquiryReplyServiceImpl implements InquiryReplyService{

	@Autowired
	private InquiryReplyDAO inqreDAO;

	public List<Map<String, String>> inquiryReplyList(Map<String, String> inqreParam){
		return inqreDAO.inquiryReplyList(inqreParam);
	}

	public void inquiryReplyWrite(Map<String, String> inqreParam){
		inqreDAO.inquiryReplyWrite(inqreParam);
	}

	public void inquiryReplyModify(Map<String, String> inqreParam){
		inqreDAO.inquiryReplyModify(inqreParam);
	}

	public void inquiryReplyDelete(Map<String, String> inqreParam){
		inqreDAO.inquiryReplyDelete(inqreParam);
	}
}
