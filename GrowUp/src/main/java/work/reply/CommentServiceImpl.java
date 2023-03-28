package work.reply;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("commentService")
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentDAO commentDAO;

	public void createComment(Map<String, String> commentParam){
		commentDAO.createComment(commentParam);
	}

}
