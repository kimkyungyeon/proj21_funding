package proj21_funding.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.Board;
import proj21_funding.dto.BoardCategory;
import proj21_funding.dto.PrjCategory;
import proj21_funding.dto.account.UserAuthInfo;
import proj21_funding.dto.paging.Pagination;
import proj21_funding.dto.project.ProjectJoin;
import proj21_funding.service.BoardService;
import proj21_funding.service.CategoryService;
import proj21_funding.service.PrjCategoryService;
import proj21_funding.service.ProjectJoinService;
import proj21_funding.service.UserInfoService;

@Controller
public class AdminBoardController {
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private CategoryService bcService;

	@RequestMapping("/adminNoticeUpdate/{boardNo}&{categoryNo}")
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
		mav.setViewName("admin/adminBoardUpdate");
		mav.addObject("board", board);
		mav.addObject("bc", bc);
		return mav;
	}
	
	@PostMapping("/adminBoardUpSuccess")
	public ModelAndView updateSuccess(Board board, BoardCategory bc, HttpSession session, HttpServletResponse response)
			throws IOException {
		Pagination pagination = new Pagination();
		pagination.setCurrentPage(1);
		pagination.setCntPerPage(10);
		pagination.setPageSize(10);
		try {
			System.out.println(board);
			boardService.modifyBoard(board);
			return new ModelAndView("admin/resultClose");

		} catch (Exception e) {
			e.printStackTrace();

			return UpdateAll(board.getBoardNo(), board.getCategoryNo().getCategoryNo(), session, response);
		}
	}
	
	@RequestMapping("/adminNotice/write")
	public ModelAndView WriteAll(HttpSession session, HttpServletResponse response) throws IOException {
		if(session.getAttribute("authInfo")== null) {
			System.out.println(1);
		}
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

		mav.setViewName("/admin/adminBoardWrite");
		mav.addObject("bc", bc);
		return mav;
	}
	
	@PostMapping("/adminNoticeSuccess")
	public ModelAndView registerSuccess(Board board, BoardCategory bc, HttpSession session,
			HttpServletResponse response) throws IOException {
		try {
			System.out.println(board);
			boardService.uploadBoard(board);
			Pagination pagination = new Pagination();
			pagination.setCurrentPage(1);
			pagination.setCntPerPage(10);
			pagination.setPageSize(10);
			return new ModelAndView("admin/resultClose");

		} catch (Exception e) {
			e.printStackTrace();

			return WriteAll(session, response);
		}
	}

	
}
