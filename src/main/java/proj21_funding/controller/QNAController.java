package proj21_funding.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.BoardCategory;
import proj21_funding.dto.QNA;
import proj21_funding.dto.account.UserAuthInfo;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.paging.Pagination;
import proj21_funding.service.CategoryService;
import proj21_funding.service.MessageService;
import proj21_funding.service.QNAService;
import proj21_funding.service.UserInfoService;

@Controller
public class QNAController {

	@Autowired
	QNAService qnaService;

	@Autowired
	CategoryService bcService;

	@Autowired
	MessageService userService;
	
	@Autowired
	UserInfoService userinfoService;

	@RequestMapping("/qnaallview")
	public ModelAndView qnaAll() {
		List<QNA> qna = qnaService.showQNAByUserId(1);
		List<BoardCategory> bc = bcService.showBCByClass("qna");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("servicecenter/all_view");
		mav.addObject("qna", qna);
		mav.addObject("bc", bc);
		return mav;
	}

	@RequestMapping("/qnaadminview")
	public ModelAndView qnaAllAdmin(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, HttpSession session,
			HttpServletResponse response) throws Exception {
		UserAuthInfo user = (UserAuthInfo) session.getAttribute("authInfo");

		ModelAndView mav = new ModelAndView();

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (user.getUserNo() >= 0 || session.getAttribute("authInfo") == null) {
			out.println("<script type='text/javascript'>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			
			mav.setViewName("servicecenter/all_view");
			return mav;
		}

		List<BoardCategory> bc = bcService.showBCByClass("qna");

		int listCnt = qnaService.QNACount();
		Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
		pagination.setTotalRecordCount(listCnt);
		session.setAttribute("pagination", pagination);

		mav.setViewName("servicecenter/admin_view");
		mav.addObject("pagination", pagination);
		mav.addObject("qna", qnaService.SelectAllList(pagination));
		mav.addObject("bc", bc);
		return mav;
	}

	@RequestMapping("/qnauserview")
	public ModelAndView qnaUser(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, HttpSession session,
			HttpServletResponse response) throws Exception {
		UserAuthInfo user = (UserAuthInfo) session.getAttribute("authInfo");
		System.out.println(session.getAttribute("authInfo"));

		List<BoardCategory> bc = bcService.showBCByClass("qna");
		ModelAndView mav = new ModelAndView();
		int listCnt = qnaService.QNAUserCount(user.getUserNo());
		Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
		pagination.setTotalRecordCount(listCnt);
		session.setAttribute("pagination", pagination);
		System.out.println(user.getUserNo());
		System.out.println(pagination.getTotalRecordCount());
		
		mav.setViewName("servicecenter/user_view");
		mav.addObject("pagination", pagination);
		mav.addObject("qna", qnaService.SelectUserList(user.getUserNo(), pagination));
		System.out.println(qnaService.SelectUserList(user.getUserNo(), pagination));
		mav.addObject("bc", bc);
		return mav;
	}

	@RequestMapping("/qnadetail/{qnaNo}")
	public ModelAndView detail(@PathVariable("qnaNo") int qnaNo) {
		List<BoardCategory> bc = bcService.showBCByClass("qna");
		QNA qna = qnaService.showQNAByNo(qnaNo);
		List<UserInfo> user = userinfoService.showUserAll();
		System.out.println(user);
		ModelAndView mav = new ModelAndView("servicecenter/view_detail", "qna", qna);
		mav.addObject("bc", bc);
		mav.addObject("user", user);
		return mav;
	}

	@RequestMapping("/qnawrite")
	public ModelAndView WriteAll() {
		List<BoardCategory> bc = bcService.showBCByClass("qna");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("servicecenter/user_write");
		mav.addObject("bc", bc);
		return mav;
	}

	@RequestMapping("/qnareply/{qnaNo}")
	public ModelAndView ReplyAll(@PathVariable("qnaNo") int qnaNo, HttpSession session, HttpServletResponse response)
			throws IOException {
		QNA qna = qnaService.showQNAByNo(qnaNo);
		List<BoardCategory> bc = bcService.showBCByClass("qna");
		UserInfo user = userService.showUserbyNo(qnaNo);
		UserAuthInfo admin = (UserAuthInfo) session.getAttribute("authInfo");

		ModelAndView mav = new ModelAndView();
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (admin.getUserNo() >= 0 || session.getAttribute("authInfo") == null) {
			out.println("<script type='text/javascript'>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			
			mav.setViewName("servicecenter/all_view");
			return mav;
		}

		mav.setViewName("servicecenter/admin_reply");
		System.out.println(qna);
		System.out.println(user);
		mav.addObject("qna", qna);
		mav.addObject("user", user);
		mav.addObject("bc", bc);
		return mav;
	}

	@PostMapping("/qnaSuccess")
	public String qnaUpload(QNA qna, BoardCategory bc) {
		try {
			System.out.println(qna);
			qnaService.uploadQNA(qna);
			return "servicecenter/user_write_end";

		} catch (Exception e) {
			e.printStackTrace();

			return "servicecenter/user_write";
		}

	}

	@PostMapping("/qnaRpSuccess")
	public ModelAndView qnaReply(QNA qna, HttpSession session, HttpServletResponse response) {
		try {
			System.out.println(qna);

			UserAuthInfo admin = (UserAuthInfo) session.getAttribute("authInfo");

			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			if (admin.getUserNo() >= 0 || session.getAttribute("authInfo") == null) {
				out.println("<script type='text/javascript'>");
				out.println("alert('잘못된 접근입니다.');");
				out.println("history.back();");
				out.println("</script>");
				out.flush();

				return detail(qna.getQnaNo());
			}

			qnaService.replyQNA(qna);
			
			return detail(qna.getQnaNo());

		} catch (Exception e) {
			e.printStackTrace();
			return detail(qna.getQnaNo());
		}
	}

	@GetMapping("/qnadelete/{qnaNo}")
	public String deleteSuccess(@PathVariable("qnaNo") int qnaNo, HttpSession session, HttpServletResponse response) {
		try {
			System.out.println(qnaNo);
			QNA qna = qnaService.showQNAByNo(qnaNo);
			
			UserAuthInfo user = (UserAuthInfo) session.getAttribute("authInfo");
			UserInfo resUser = userService.showUserbyNo(qna.getUserNo().getUserNo());
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			System.out.println(user.getUserNo());
			System.out.println(resUser.getUserNo());
			
			if (user.getUserNo() != resUser.getUserNo()) {
				out.println("<script type='text/javascript'>");
				out.println("alert('잘못된 접근입니다.');");
				out.println("history.back();");
				out.println("</script>");
				out.flush();

				return "/";
			}

			qnaService.removeQNA(qnaNo);
			
			return "servicecenter/delete";

		} catch (Exception e) {
			e.printStackTrace();
			return "servicecenter/view_detail/{qnaNo}";
		}
	}
}
