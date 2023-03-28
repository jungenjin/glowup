package work.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import work.board.InquiryService;
import work.user.UserService;

@Controller
public class InquiryReplyController {
	@Resource(name = "inquiryReplyService")
	private InquiryReplyService inquiryReplyService;

	@Resource(name = "inquiryService")
	private InquiryService inquiryService;

	@Resource(name = "userService")
	private UserService userService;

	//댓글 작성
	@RequestMapping(value="/work/reply/inquiryReplyWrite.do", method=RequestMethod.POST)
	public ModelAndView inquiryReplyWrite(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> inqreParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		//String inqNo = request.getParameter("inqNo");
		String inqreNo = request.getParameter("inqreNo");
		String inqreContent = request.getParameter("inqreContent");

		inqreParam.put("userCode", userCode);
		//inqreParam.put("inqNo", inqNo);
		inqreParam.put("inqreNo", inqreNo);
		inqreParam.put("inqreContent", inqreContent);

		//댓글 생성
		inquiryReplyService.inquiryReplyWrite(inqreParam);

		mv.setViewName("redirect:/work/board/inquiryView.do?inqNo=" + inqreNo);

		return mv;
	}

	//댓글 삭제
	@RequestMapping(value="/work/reply/inquiryReplyDelete.do", method=RequestMethod.GET)
	public ModelAndView inquiryReplyDelete(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> inqreParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		String inqNo = request.getParameter("inqNo");
		String inqreContent = request.getParameter("inqreContent");

		inqreParam.put("userCode", userCode);
		inqreParam.put("inqNo", inqNo);
		inqreParam.put("inqreContent", inqreContent);

		//댓글 삭제
		inquiryReplyService.inquiryReplyDelete(inqreParam);

		mv.setViewName("redirect:/work/board/inqView.do?inqNo=" + inqNo);

		return mv;
	}
	
	//댓글목록보기
	@RequestMapping(value="/work/board/inquiryReply.do", method = {RequestMethod.GET})
	public ModelAndView inquiryReplyList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> inqreParam = new HashMap<String, String>();

		String inqNo = request.getParameter("inqNo");
		String inqreNo = request.getParameter("inqreNo");
		String userCode = request.getParameter("userCode");
		String inqreContent = request.getParameter("inqreContent");
		String inqreRegDate = request.getParameter("inqreRegDate");
		
		inqreParam.put("inqNo", inqNo);
		inqreParam.put("inqreNo", inqreNo);
		inqreParam.put("userCode", userCode);
		inqreParam.put("inqreContent", inqreContent);
		inqreParam.put("inqreRegDate", inqreRegDate);
		
		
		List<Map<String, String>> dsComment = inquiryReplyService.inquiryReplyList(inqreParam);
		
		mv.addObject("inqreParam", inqreParam);
		
		System.out.println("inqreParam 출력////////////////////"+inqreParam );
		
		mv.addObject("dsComment", dsComment);

		System.out.println("dsComment 출력////////////////////"+dsComment );
		
		mv.setViewName("/board/inquiryReply");
		return mv;
	}
	
}