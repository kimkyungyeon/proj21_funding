package proj21_funding.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import proj21_funding.dto.Board;
import proj21_funding.dto.BoardCategory;
import proj21_funding.dto.account.UserAuthInfo;
import proj21_funding.dto.paging.Pagination;
import proj21_funding.service.BoardService;
import proj21_funding.service.CategoryService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private CategoryService bcService;

	@RequestMapping(value = "/notice/list")
	public ModelAndView noticeAll(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
			@RequestParam(value = "keyword", required = false, defaultValue = "total") String keyword,
			@RequestParam(value = "searchKeyword", required = false, defaultValue = "") String searchKeyword,
			HttpSession session)
			throws Exception {
		int pageSearch = (currentPage-1)*cntPerPage;
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPage", currentPage);
		map.put("cntPerPage", cntPerPage);
		map.put("pageSize", pageSize);
		map.put("pageSearch", pageSearch);
		map.put("keyword", keyword);
		map.put("searchKeyword", searchKeyword);
		
		List<BoardCategory> bc = bcService.showBCByClass("board");
		System.out.println(map);
		System.out.println(boardService.selectSearchBoardList(map));
		Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
		int listCnt = boardService.selectSearchBoardListCount(map);
		pagination.setTotalRecordCount(listCnt);
		
		session.setAttribute("pagination", pagination);
		session.setAttribute("keyword", keyword);
		session.setAttribute("searchKeyword", searchKeyword);

		mav.addObject("pagination", pagination);
		mav.addObject("board", boardService.selectSearchBoardList(map));
		mav.addObject("bc", bc);
		mav.setViewName("/notice/list");
		return mav;
	}

	@RequestMapping(value = "/notice/list/{categoryNo}")
	public ModelAndView noticeCategory(@PathVariable("categoryNo") int categoryNo,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
			@RequestParam(value = "keyword", required = false, defaultValue = "total") String keyword,
			@RequestParam(value = "searchKeyword", required = false, defaultValue = "") String searchKeyword,
			HttpSession session)
			throws Exception {
		int pageSearch = (currentPage-1)*cntPerPage;
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPage", currentPage);
		map.put("cntPerPage", cntPerPage);
		map.put("pageSize", pageSize);
		map.put("pageSearch", pageSearch);
		map.put("keyword", keyword);
		map.put("searchKeyword", searchKeyword);
		map.put("categoryNo", categoryNo);
		
		int listCnt = boardService.selectSearchBoardListCountCategory(map);
		Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
		pagination.setTotalRecordCount(listCnt);
		List<BoardCategory> bc = bcService.showBCByClass("board");
		session.setAttribute("pagination", pagination);
		session.setAttribute("keyword", keyword);
		session.setAttribute("searchKeyword", searchKeyword);

		mav.addObject("pagination", pagination);
		mav.addObject("board", boardService.selectSearchBoardListCategory(map));
		mav.addObject("bc", bc);
		mav.setViewName("/notice/list_cate");
		return mav;
	}

	@RequestMapping("/notice/write")
	public ModelAndView WriteAll(HttpSession session, HttpServletResponse response) throws IOException {
		List<BoardCategory> bc = bcService.showBCByClass("board");
		ModelAndView mav = new ModelAndView();

		UserAuthInfo user = (UserAuthInfo) session.getAttribute("authInfo");

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (user.getUserNo() >= 0 || session.getAttribute("authInfo") == null) {
			out.println("<script type='text/javascript'>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			mav.setViewName("/");
			return mav;
		}

		mav.setViewName("/notice/write");
		mav.addObject("bc", bc);
		return mav;
	}

	@PostMapping("/noticesuccess")
	public ModelAndView registerSuccess(Board board, BoardCategory bc, HttpSession session,
			HttpServletResponse response) throws IOException {
		try {
			System.out.println(board);
			boardService.uploadBoard(board);
			Pagination pagination = new Pagination();
			pagination.setCurrentPage(1);
			pagination.setCntPerPage(10);
			pagination.setPageSize(10);
			return new ModelAndView("redirect:/notice/list");
//			return noticeAll(pagination.getCurrentPage(), pagination.getCntPerPage(), pagination.getPageSize(),
//					session);

		} catch (Exception e) {
			e.printStackTrace();

			return WriteAll(session, response);
		}
	}

	@RequestMapping("/notice/detail/{boardNo}&{categoryNo}")
	public ModelAndView detail(@PathVariable("boardNo") int boardNo, @PathVariable("categoryNo") int categoryNo,
			HttpSession session) {
		session.getAttribute("pagination");
		List<BoardCategory> bc = bcService.showBCByClass("board");
		Board board = boardService.showBoardByNo(boardNo);
		board.setCategoryNo(new BoardCategory(categoryNo));
		ModelAndView mav = new ModelAndView("notice/detail", "board", board);
		mav.addObject("bc", bc);
		mav.addObject("pagination", session.getAttribute("pagination"));
		return mav;
	}

	@RequestMapping("/noticeupdate/{boardNo}&{categoryNo}")
	public ModelAndView UpdateAll(@PathVariable("boardNo") int boardNo, @PathVariable("categoryNo") int categoryNo,
			HttpSession session, HttpServletResponse response) throws IOException {
		Board board = boardService.showBoardByNo(boardNo);
		List<BoardCategory> bc = bcService.showBCByClass("board");
		board.setCategoryNo(new BoardCategory(categoryNo));
		System.out.println(board);
		ModelAndView mav = new ModelAndView();

		UserAuthInfo user = (UserAuthInfo) session.getAttribute("authInfo");

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (user.getUserNo() >= 0 || session.getAttribute("authInfo") == null) {
			out.println("<script type='text/javascript'>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			mav.setViewName("/");
			return mav;
		}
		mav.setViewName("notice/update");
		mav.addObject("board", board);
		mav.addObject("bc", bc);
		return mav;
	}

	@PostMapping("/noticeupsuccess")
	public ModelAndView updateSuccess(Board board, BoardCategory bc, HttpSession session, HttpServletResponse response)
			throws IOException {
		Pagination pagination = new Pagination();
		pagination.setCurrentPage(1);
		pagination.setCntPerPage(10);
		pagination.setPageSize(10);
		try {
			System.out.println(board);
			boardService.modifyBoard(board);
			return detail(board.getBoardNo(), board.getCategoryNo().getCategoryNo(), session);

		} catch (Exception e) {
			e.printStackTrace();

			return UpdateAll(board.getBoardNo(), board.getCategoryNo().getCategoryNo(), session, response);
		}
	}

	@GetMapping("/noticedelete/{boardNo}&{categoryNo}")
	public ModelAndView deleteSuccess(@PathVariable("boardNo") int boardNo, @PathVariable("categoryNo") int categoryNo,
			HttpSession session, HttpServletResponse response) throws IOException {
		Pagination pagination = new Pagination();
		pagination = (Pagination) session.getAttribute("pagination");

		UserAuthInfo user = (UserAuthInfo) session.getAttribute("authInfo");

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (user.getUserNo() >= 0 || session.getAttribute("authInfo") == null) {
			out.println("<script type='text/javascript'>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			return detail(boardNo, categoryNo, session);
		}

		try {
			System.out.println(boardNo);
			boardService.removeBoard(boardNo);
			return new ModelAndView("redirect:/notice/list");
//			return noticeAll(pagination.getCurrentPage(), pagination.getCntPerPage(), pagination.getPageSize(),
//					session);

		} catch (Exception e) {
			e.printStackTrace();

			return detail(boardNo, categoryNo, session);
		}
	}

}
