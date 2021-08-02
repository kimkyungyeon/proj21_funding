package proj21_funding.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.binding.BindingException;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.FundingInfo;
import proj21_funding.dto.Message;
import proj21_funding.dto.PrjBoard;
import proj21_funding.dto.PrjBoardReply;
import proj21_funding.dto.PrjCategory;
import proj21_funding.dto.PrjOption;
import proj21_funding.dto.account.UserAuthInfo;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.account.UserLogin;
import proj21_funding.dto.paging.Pagination;
import proj21_funding.dto.project.ProjectJoin;
import proj21_funding.exception.SameUserException;
import proj21_funding.service.FundingInfoService;
import proj21_funding.service.MessageService;
import proj21_funding.service.PrjBoardService;
import proj21_funding.service.PrjOptionService;
import proj21_funding.service.ProjectJoinService;
import proj21_funding.service.ProjectService;
import proj21_funding.service.UserInfoService;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService projectService;
	@Autowired
	private PrjOptionService optionService;
	@Autowired
	private FundingInfoService fundingService;
	@Autowired
	private ProjectJoinService joinService;
	@Autowired
	private UserInfoService userService;
	@Autowired
	private MessageService service;
	@Autowired
	private PrjBoardService boardService;

//	모든 프로젝트
	@RequestMapping("/projectList")
	public ModelAndView listAll(@RequestParam(value = "keyword", defaultValue = "total") String keyword,
			@RequestParam(value = "searchKeyword", required = false, defaultValue = "") String searchKeyword,
			@RequestParam(value = "finishYn", required = false, defaultValue = "notFinished") String finishYn,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "12") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "9") int pageSize, HttpSession session)
			throws Exception {

		int pageSearch = (currentPage - 1) * cntPerPage;

		Map<String, Object> listMap = new HashMap<String, Object>();
		listMap.put("keyword", keyword);
		listMap.put("searchKeyword", searchKeyword);
		listMap.put("finishYn", finishYn);
		listMap.put("currentPage", currentPage);
		listMap.put("cntPerPage", cntPerPage);
		listMap.put("pageSize", pageSize);
		listMap.put("pageSearch", pageSearch);

		List<ProjectJoin> prjs = joinService.showProjectListByMap(listMap);
		int listCount = joinService.showProjectListByMapCount(listMap);
		Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
		pagination.setTotalRecordCount(listCount);

		session.setAttribute("pagination", pagination);
		session.setAttribute("keyword", keyword);
		session.setAttribute("searchKeyword", searchKeyword);
		session.setAttribute("finishYn", finishYn);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("project/list");
		mav.addObject("prjs", prjs);
		mav.addObject("listCount", listCount);
		return mav;
	}

	@RequestMapping("/projectList/{pCategoryNo}")
	public String category(@PathVariable("pCategoryNo") int pCategoryNo, Model model,
			@RequestParam(value = "keyword", defaultValue = "total") String keyword,
			@RequestParam(value = "searchKeyword", required = false, defaultValue = "") String searchKeyword,
			@RequestParam(value = "finishYn", required = false, defaultValue = "notFinished") String finishYn,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, HttpSession session)
			throws Exception {
		

		int pageSearch = (currentPage - 1) * cntPerPage;

		Map<String, Object> listMap = new HashMap<String, Object>();
		listMap.put("keyword", keyword);
		listMap.put("searchKeyword", searchKeyword);
		listMap.put("finishYn", finishYn);
		listMap.put("currentPage", currentPage);
		listMap.put("cntPerPage", cntPerPage);
		listMap.put("pageSize", pageSize);
		listMap.put("pageSearch", pageSearch);
		listMap.put("category", pCategoryNo);

		List<ProjectJoin> prjs = joinService.showProjectListByMap(listMap);
		int listCount = joinService.showProjectListByMapCount(listMap);
		Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
		pagination.setTotalRecordCount(listCount);

		session.setAttribute("pagination", pagination);
		session.setAttribute("keyword", keyword);
		session.setAttribute("searchKeyword", searchKeyword);
		session.setAttribute("finishYn", finishYn);

//		List<ProjectJoin> prjs = joinService.showProjectJoinByPcategoryno(pCategoryNo);
		model.addAttribute("prjs", prjs);
		model.addAttribute("pCateogryNo", pCategoryNo);
		model.addAttribute("listCount", listCount);
		return "project/listByCategory";
	}

	@RequestMapping("/sucessImbakProject")
	public ModelAndView ImbakListAll() {

		ModelAndView mav = new ModelAndView();
		List<ProjectJoin> prjs = joinService.showProjectSuccessImbak();
		mav.setViewName("project/list");
		mav.addObject("prjs", prjs);
		return mav;
	}

	@RequestMapping("/projectListSearch")
	public String listByName(Model model, HttpServletRequest request) {
		List<ProjectJoin> prjs = null;
		if (request.getParameter("type").equals("prjName")) {
			prjs = joinService.showProjectJoinByPrjName(request.getParameter("param"));
		} else if (request.getParameter("type").equals("prjManager")) {
			prjs = joinService.showProjectJoinByPrjManager(request.getParameter("param"));
		}
		model.addAttribute("prjs", prjs);
		System.out.println(request.getParameter("type"));
		System.out.println(request.getParameter("param"));
		return "project/list";
	}

//	@RequestMapping("/projectListAll")
//	public String listAll(Model model) {
//		List<Project> projects = mapper.selectProjectListAll();
//		model.addAttribute("projects",projects);
//		return "project/list";
//	}

	@RequestMapping("/prjDetail/{prjNo}")
	public ModelAndView detail(@PathVariable("prjNo") int prjNo, HttpSession session, PrjBoardReply prjBoardReply,PrjBoard prjBoard,  Model model) {
		int count;
		int sum;
		List<PrjOption> prj = optionService.showPrjOptionByPrjNo(prjNo);
		session.setAttribute("prj", prj);
		session.setAttribute("prjNo", prjNo);
//		List<Project> prjList=projectService.showProjectListAll();

		// 프로젝트 게시판 목록
		List<PrjBoard> prBd = boardService.showPrjBoardbyPrjNo(prjNo);
		List<String> imgList = new ArrayList<String>();
		UserAuthInfo authInfo = (UserAuthInfo) session.getAttribute("authInfo");
		List<FundingInfo> fundingInfos = service.showFundingInfosByPrjNo(prjNo);
		List<Integer> reCountList = new ArrayList<Integer>();
		for (PrjBoard board : prBd) {
			UserInfo user = service.showUserbyNo(board.getUserNo().getUserNo());
			board.setUserNo(user);
			List<PrjBoardReply> boardRe = boardService.showPrjBoardReplyPostNo(board.getPostNo());
			reCountList.add(boardRe.size());
			if (board.getPostFile() != null && board.getPostFile().length > 0) {
				try {
					byte[] imagefile = board.getPostFile();
					byte[] encodeBase64 = Base64.encodeBase64(imagefile);
					String base64DataString = new String(encodeBase64, "UTF-8");
					imgList.add(base64DataString);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
		}

		if (authInfo != null) {
			for (FundingInfo info : fundingInfos) {
				if (info.getUserNo().getUserNo() == authInfo.getUserNo()) {
					session.setAttribute("info", info);
				}
			}
		}
		session.setAttribute("reCount", reCountList);
		session.setAttribute("img", imgList);
		session.setAttribute("board", prBd);
		
		// 프로젝트 게시판 상세보기
		if(prjBoardReply.getPostNo()!= 0) {
			PrjBoard prBoard = boardService.showPrjBoardbyPostNo(prjBoardReply.getPostNo());
			UserInfo user = service.showUserbyNo(prBoard.getUserNo().getUserNo());
			prBoard.setUserNo(user);		

			if (prBoard.getPostFile() != null && prBoard.getPostFile().length > 0) {
				try {
					byte[] imagefile = prBoard.getPostFile();
					byte[] encodeBase64 = Base64.encodeBase64(imagefile);
					String base64DataString = new String(encodeBase64, "UTF-8");
					model.addAttribute("img", base64DataString);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
			model.addAttribute("prBoard", prBoard);
			
			List<PrjBoardReply> boardReply = boardService.showPrjBoardReplyPostNo(prjBoardReply.getPostNo());
			for(PrjBoardReply reply : boardReply) {
				UserInfo userInfo = service.showUserbyNo(reply.getUserNo().getUserNo());
				
				reply.setUserNo(userInfo);
			}				
			model.addAttribute("boardReply", boardReply);
		}
		
		
		try {
			count = fundingService.showCountByPrjNo(prjNo);
			sum = fundingService.showSumByPrjNo(prjNo);
		} catch (BindingException e) {
			count = 0;
			sum = 0;
		}
		ModelAndView mav = new ModelAndView("project/project_detail", "prj", prj);
		mav.addObject("count", count);
		mav.addObject("sum", sum);
		return mav;
	}

	@RequestMapping("/fundingProject")
	public ModelAndView funding(@Valid UserLogin userLogin, HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws IOException {
		System.out.println(request.getContextPath());
		UserAuthInfo uai;
		int prjNo = (int) session.getAttribute("prjNo");
		try {
			uai = (UserAuthInfo) session.getAttribute("authInfo");
			System.out.println(request.getParameter("price"));
			System.out.println(request.getParameter("optNo"));
			String userId = uai.getUserId();
			UserInfo ui = userService.showUserInfoById(userId);
//		System.out.println(ui);
			int price = Integer.parseInt(request.getParameter("price"));
			int optNo = Integer.parseInt(request.getParameter("optNo"));
			ProjectJoin prjInfo = joinService.showProjectJoinByPrjNo(prjNo);
			PrjOption buyOption = optionService.showPrjOptionByOptNo(optNo);
			ModelAndView mav = new ModelAndView("funding/fundingScreen", "price", price);
			mav.addObject("price", price);
			mav.addObject("buyOption", buyOption);
			mav.addObject("prjInfo", prjInfo);
			mav.addObject("ui", ui);
			return mav;
		} catch (NullPointerException e) {
			return new ModelAndView("redirect:/login");
		} catch (NumberFormatException e) {
			return new ModelAndView("project/project_detail");
		}
	}

	// 창작자에게 문의하기
	@GetMapping("/project/question-write")
	public String Question(Message message) {
		return "project/question-write";
	}

	@PostMapping("/project/question-write")
	public String Question1(@Valid Message message, Errors errors, Model model) {
		if (message.getSendUser().equals("")) {
			String complet = "로그인이 필요합니다.";
			model.addAttribute("complet", complet);
			return "project/question-write";
		}
		try {
			service.sendMessage(message);
			String complet = "전송되었습니다.";
			model.addAttribute("complet", complet);
		} catch (NullPointerException e) {
			errors.rejectValue("msgContent", "nullContent");
		}catch (SameUserException e) {
			errors.rejectValue("msgContent", "SameUserImpossible");			
		}
		return "project/question-write";
	}

}
