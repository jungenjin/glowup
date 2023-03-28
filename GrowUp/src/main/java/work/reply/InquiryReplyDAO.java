package work.reply;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InquiryReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String, String>> inquiryReplyList(Map<String, String> inqreParam){
		return sqlSession.selectList("inquiryReply.inquiryReplyList", inqreParam);
	}
	public void inquiryReplyWrite(Map<String, String> inqreParam){
		sqlSession.insert("inquiryReply.inquiryReplyWrite", inqreParam);
	}

	public void inquiryReplyModify(Map<String, String> inqreParam){
		sqlSession.update("inquiryReply.inquiryReplyModify", inqreParam);
	}

	public void inquiryReplyDelete(Map<String, String> inqreParam){
		sqlSession.delete("inquiryReply.inquiryReplyDelete", inqreParam);
	}


}
