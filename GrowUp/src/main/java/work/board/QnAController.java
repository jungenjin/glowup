package work.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import work.reply.CommentService;
import work.user.UserService;

@Controller
public class QnAController {
	@Resource(name = "qnaService")
	private QnAService qnaService;

	@Resource(name = "userService")
	private UserService userService;
	
	@Autowired
	private CommentService commentService;


	@RequestMapping(value="/work/board/qnaWrite.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView qnaWrite(@ModelAttribute QnABean qna, HttpServletRequest request){
		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");

		ModelAndView mv = new ModelAndView();

		String flag = qna.getQaTitle(); //BoardBean 존재여부

		if(flag == null){
			mv.setViewName("/board/qnaWrite");
		}else if(flag != null){
			//게시글 생성
			qna.setQaRegId(userCode);
			qnaService.qnaWrite(qna);

			String maxQnANo = qnaService.maxQnANo();

			mv.setViewName("redirect:/work/board/qnaView.do?qaNo=" + maxQnANo);
		}

		return mv;
	}
	@RequestMapping(value="/work/board/qna.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goMain(){
//		ModelAndView mv = new ModelAndView();
//
//		mv.setViewName("/intro/index");

		return "redirect:/work/board/qnaList.do";
	}

	@RequestMapping(value="/work/board/qnaView.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView qnaView(HttpServletRequest request){
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();

		String qnaNo = request.getParameter("qaNo");
		String userCode = (String)session.getAttribute("userCode");
		String userCommentNo = request.getParameter("userCommentNo");
		String userComment = request.getParameter("userComment");
		String commentDate = request.getParameter("commentDate");
//		String fromRating = request.getParameter("fromRating");
//		String fromCreate = request.getParameter("fromCreate");
//		String fromReply = request.getParameter("fromReply");

		if(qnaNo == null) qnaNo = request.getParameter("qaNo");

		Map<String, String> qnaParam = new HashMap<String, String>();
		Map<String, String> replyParam = new HashMap<String, String>();

		qnaParam.put("qaNo", qnaNo);
		replyParam.put("qaNo", qnaNo);
		replyParam.put("userCode",userCode);
		replyParam.put("userCommentNo",userCommentNo);
		replyParam.put("userComment",userComment);
		replyParam.put("commentDate",commentDate);

//		//조회수 증가
//		if(!"true".equals(fromRating) && !"true".equals(fromCreate) && !"true".equals(fromReply) ){
//			qnaService.updateQnAHit(qnaParam);
//		}

		
		Map<String, String> dsQnA = qnaService.qnaView(qnaParam);

		mv.addObject("dsQnA", dsQnA);
		System.out.println("dsQnA===================================="+dsQnA);
		
		

		List<Map<String, String>> dsComment = commentService.retrieveCommentList(replyParam);
			mv.addObject("dsComment", dsComment);
			
			mv.setViewName("/board/qnaView");
		
			return mv;
	}
	@RequestMapping(value="/work/board/qnaList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView qnaList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> qnaParam = new HashMap<String, String>();

		List<Map<String, String>> dsQnAList = qnaService.qnaList(qnaParam);

		mv.addObject("dsQnAList", dsQnAList);
		mv.setViewName("/board/qnaList");

		return mv;
	}

	@RequestMapping(value="/work/board/deleteQnA.do", method=RequestMethod.GET)
	public ModelAndView deleteQnA(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> qnaParam = new HashMap<String, String>();
		Map<String, String> replyParam = new HashMap<String, String>();
		Map<String, String> markParam = new HashMap<String, String>();

		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");
		String qnaNo = request.getParameter("qaNo");

		qnaParam.put("userCode", userCode);
		qnaParam.put("qaNo", qnaNo);

		replyParam.put("qaNo", qnaNo);

		markParam.put("qaNo", qnaNo);

		//글 삭제
		qnaService.deleteQnA(qnaParam);

		mv.setViewName("redirect:/work/board/qnaList.do");

		return mv;
	}

	@RequestMapping(value="/work/board/updateQnARating.do", method=RequestMethod.GET)
	public ModelAndView updateQnARating(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> qnaParam = new HashMap<String, String>();
		Map<String, String> markParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		String qnaNo = request.getParameter("qaNo");

		qnaParam.put("qaNo", qnaNo);

		markParam.put("userCode", userCode);
		markParam.put("qaNo", qnaNo);

		mv.setViewName("redirect:/work/board/qnaView.do?boNo=" + qnaNo + "&fromRating=true");

		return mv;
	}

	@RequestMapping(value="/work/board/qnaModify.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView qnaModify(HttpServletRequest request, @ModelAttribute QnABean bean){
		Map<String, String> qnaParam = new HashMap<String, String>();
		ModelAndView mv = new ModelAndView();
        String qnaNo = request.getParameter("qaNo"); //없으면 GET(create안함), 있으면 POST(create)

        String flag = bean.getQaTitle();
        qnaParam.put("qaNo", qnaNo);

        Map<String, String> dsQnA = qnaService.qnaView(qnaParam);

		if(flag == null){
			mv.addObject("dsQnA", dsQnA);
			mv.setViewName("/board/qnaModify");
		}else{
			qnaService.qnaModify(bean);
			mv.setViewName("/work/board/qnaView.do?boNo=" + qnaNo + "&fromUpdate=true");
		}
		return mv;
	}

}
