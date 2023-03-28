package work.reply;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public void createComment(Map<String, String> commentParam){
		sqlSession.insert("comment.createComment", commentParam);
	}


}
