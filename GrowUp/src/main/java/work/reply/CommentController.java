package work.reply;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import work.board.QnAService;
import work.mark.MarkService;
import work.sell.SellService;

@Controller
public class CommentController {
	@Resource(name = "commentService")
	private CommentService commentService;

	@Resource(name = "qnaService")
	private QnAService qnaService;

	@Resource(name = "markService")
	private MarkService markService;

	@RequestMapping(value="/work/reply/createComment.do", method=RequestMethod.POST)
	public ModelAndView createComment
	(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> commentParam = new HashMap<String, String>();
		Map<String, String> markParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		String qnaNo = request.getParameter("qnaNo");
		String userComment = request.getParameter("userComment");
		String markYn = request.getParameter("markYn");
		String markRating = request.getParameter("markRating");

		commentParam.put("userCode", userCode);
		commentParam.put("qnaNo", qnaNo);
		commentParam.put("userComment", userComment);

		if("N".equals(markYn)){
			markParam.put("qnaNo", qnaNo);
			markParam.put("userCode", userCode);
			markParam.put("markRating", markRating);

			markService.createMark(markParam);
		}

		//댓글 생성
		commentService.createComment(commentParam);

		mv.setViewName("redirect:/work/board/qnaView.do?qaNo=" + qnaNo);

		return mv;
	}

}