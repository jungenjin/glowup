package work.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import work.reply.InquiryReplyService;
import work.user.UserService;

@Controller
public class InquiryController {
	@Resource(name = "inquiryService")
	private InquiryService inquiryService;

	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "inquiryReplyService")
	private InquiryReplyService inquiryReplyService;

	@RequestMapping(value="/work/board/inquiryWrite.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView inquiryWrite(@ModelAttribute InquiryBean inquiry, HttpServletRequest request){
		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");

		ModelAndView mv = new ModelAndView();

		String flag = inquiry.getInqTitle(); //Inquiryrst 존재여부
		

		if(flag == null){
			mv.setViewName("/board/inquiryWrite");
		}else if(flag != null){
			//게시글 생성
			inquiry.setInqRegId(userCode);
			inquiryService.inquiryWrite(inquiry);
			
			//System.out.println("cccccccccccccccccccccccccccccccccccccc");

			String maxInquiryNo = inquiryService.maxInquiryNo();
			
			//System.out.println("ddddddd" + maxInquiryNo);

			mv.setViewName("redirect:/work/board/inquiryView.do?inqNo=" + maxInquiryNo + "&fromCreate=true");
		}

		return mv;
		
		
		
	}
	
	@RequestMapping(value="/work/board/inquiry.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goMain(){
//		ModelAndView mv = new ModelAndView();
//
//		mv.setViewName("/intro/index");

		return "redirect:inquiryList.do";
	}

	@RequestMapping(value="/work/board/inquiryView.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView inquiryView(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		String inquiryNo = request.getParameter("inqNo");
		
		HttpSession session = request.getSession();
		
		String inqreNo = (String)session.getAttribute("inqreNo");
		String userCode = (String)session.getAttribute("userCode");
		String inqreContent = (String)session.getAttribute("inqreContent");
		String inqreRegDate = (String)session.getAttribute("inqreRegDate");
		
		if(inquiryNo == null) inquiryNo = request.getParameter("inqNo");

		Map<String, String> inquiryParam = new HashMap<String, String>();
		Map<String, String> inqreParam = new HashMap<String, String>();

		inquiryParam.put("inqNo", inquiryNo);
		inquiryParam.put("userCode", userCode);

		inqreParam.put("inqNo", inquiryNo);
		inqreParam.put("inqreNo", inqreNo);
		inqreParam.put("userCode", userCode);
		inqreParam.put("inqreContent", inqreContent);
		inqreParam.put("inqreRegDate", inqreRegDate);

		//문의글내용
		Map<String, String> dsInquiry = inquiryService.inquiryView(inquiryParam);
		mv.addObject("dsInquiry", dsInquiry);

		System.out.println("inqreParam 출력////////////////////"+inqreParam );
		
		//댓글리스트
		List<Map<String, String>> dsComment = inquiryReplyService.inquiryReplyList(inqreParam);
		mv.addObject("dsComment", dsComment);

		System.out.println("dsComment 출력////////////////////"+dsComment );
		
		mv.setViewName("/board/inquiryView");

		return mv;
	}

	@RequestMapping(value="/work/board/inquiryList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView inquiryList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		String userCode = (String)session.getAttribute("userCode");
		String grade = (String)session.getAttribute("grade");
		
		Map<String, String> inquiryParam = new HashMap<String, String>();
		
		inquiryParam.put("userCode", userCode);
		inquiryParam.put("grade", grade);
		
		List<Map<String, String>> dsInquiryList = inquiryService.inquiryList(inquiryParam);
		System.out.println("userCode****************************************" + userCode);
		System.out.println("grade****************************************" + grade);
		System.out.println("inquiryParam****************************************" + inquiryParam);
		System.out.println("dsInquiryList****************************************" + dsInquiryList);
		

		mv.addObject("dsinquiryList", dsInquiryList);
		mv.setViewName("/board/inquiryList");

		return mv;
	}

	@RequestMapping(value="/work/board/deleteInquiry.do", method=RequestMethod.GET)
	public ModelAndView deleteInquiry(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> inquiryParam = new HashMap<String, String>();
		Map<String, String> replyParam = new HashMap<String, String>();
		Map<String, String> markParam = new HashMap<String, String>();

		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");
		String inquiryNo = request.getParameter("inqNo");

		inquiryParam.put("userCode", userCode);
		inquiryParam.put("inqNo", inquiryNo);

		replyParam.put("inqNo", inquiryNo);

		markParam.put("inqNo", inquiryNo);

		//글 삭제
		inquiryService.deleteInquiry(inquiryParam);

		mv.setViewName("redirect:/work/board/inquiryList.do");

		return mv;
	}

	@RequestMapping(value="/work/board/updateInquiryRating.do", method=RequestMethod.GET)
	public ModelAndView updateInquiryRating(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> inquiryParam = new HashMap<String, String>();
		Map<String, String> markParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		String inquiryNo = request.getParameter("inqNo");

		inquiryParam.put("inqNo", inquiryNo);

		markParam.put("userCode", userCode);
		markParam.put("inqNo", inquiryNo);

		mv.setViewName("redirect:inquiryView.do?inqNo=" + inquiryNo + "&fromRating=true");

		return mv;
	}

	@RequestMapping(value="/work/board/inquiryModify.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView inquiryModify(HttpServletRequest request, @ModelAttribute InquiryBean bean){
		Map<String, String> inquiryParam = new HashMap<String, String>();
				
		ModelAndView mv = new ModelAndView();
		
		
        String inquiryNo = request.getParameter("inqNo"); //없으면 GET(create안함), 있으면 POST(create)
       
        String flag = bean.getInqTitle();
        
        inquiryParam.put("inqNo", inquiryNo);

        System.out.println("111111111111-" + flag);
        
//        System.out.println("2222222222222222-" + inquiryParam);

        Map<String, String> dsInquiry = inquiryService.inquiryView(inquiryParam);

		if(flag == null){
			
			System.out.println("333333333333-" + dsInquiry);
			
			mv.addObject("dsInquiry", dsInquiry);
			mv.setViewName("/board/inquiryModify");
		}else{
			
			 System.out.println("44444444-" + inquiryNo);
			 System.out.println("555-" + bean.getInqTitle());
			 System.out.println("666-" + bean.getInqContent());
			 System.out.println("777-" + bean.getInqNo());
			 System.out.println("877-" + bean.getInqPhone());
			 System.out.println("977-" + bean.getInqEmail());			 
			 
			inquiryService.inquiryModify(bean);
			mv.setViewName("/work/board/inquiryView.do?inqNo=" + inquiryNo + "&fromUpdate=true");
		}
		return mv;
	}


}
