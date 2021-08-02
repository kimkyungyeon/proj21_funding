package proj21_funding.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import proj21_funding.dto.PrjBoard;
import proj21_funding.dto.PrjBoardReply;
import proj21_funding.dto.account.UserAuthInfo;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.service.MessageService;
import proj21_funding.service.PrjBoardService;

@Controller
public class PrjBoardController {
	@Autowired
	private MessageService service;
	@Autowired
	private PrjBoardService boardService;

	// 프로젝트 게시판 글쓰기
	@GetMapping("/prjBoard/prjBoard-write")
	public String write(PrjBoard prjBoard, HttpSession session, Model model, MultipartFile postFile) {
		UserAuthInfo authInfo = (UserAuthInfo) session.getAttribute("authInfo");
		model.addAttribute("authInfo", authInfo);
		
		if(prjBoard.getPostNo() != 0) {			
			PrjBoard pBoard = boardService.showPrjBoardbyPostNo(prjBoard.getPostNo());			
			model.addAttribute("pBoard", pBoard);
		}		
		return "prjBoard/prjBoard-write";
	}

	@PostMapping("/prjBoard/prjBoard-write")
	public String write(@Valid PrjBoard prjBoard, Errors errors, Model model, MultipartFile postFile,HttpServletResponse response) {
				
		if (prjBoard.getPostNo() == 0) {
			try {
				boardService.registPrjBoard(prjBoard, postFile);
				String complet = "등록되었습니다.";
				model.addAttribute("complet", complet);
			} catch (NullPointerException e) {
				errors.rejectValue("postContent", "nullContent");
				return "prjBoard/prjBoard-write";
			}
		}else {
			try {
				boardService.modifyPrjBoard(prjBoard, postFile);
				String complet = "수정되었습니다.";
				model.addAttribute("complet", complet);
			} catch (NullPointerException e) {
				errors.rejectValue("postContent", "nullContent");
				return "prjBoard/prjBoard-write";
			}
		}		
		PrintWriter out;		
		try {
			out = response.getWriter();			
			out.println("<script type='text/javascript'>");
			out.println("opener.document.location.reload();");
			out.println("window.close();");
			out.println("</script>");
			out.flush();
		} catch (IOException e1) {			
			e1.printStackTrace();
		}		
		return "prjBoard/prjBoard-write";
	}

	// 프로젝트 게시판 삭제
	@RequestMapping("/prjDetail/deleteBoard")
	public String delprjBoard(PrjBoard prjBoard) {
		prjBoard = boardService.showPrjBoardbyPostNo(prjBoard.getPostNo());
		try {
			boardService.removePrjBoard(prjBoard);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/prjDetail/" + prjBoard.getPrjNo() + "#prjBoard";
	}

	// 게시판 리플 작성
	@RequestMapping("/prjDetail/registerReply")
	public String prjBoard(PrjBoardReply prjBoardReply, RedirectAttributes rttr, HttpSession session) {
		UserAuthInfo authInfo = (UserAuthInfo) session.getAttribute("authInfo");
		UserInfo userInfo = service.showUserbyNo(authInfo.getUserNo());
		PrjBoard prjBoard = boardService.showPrjBoardbyPostNo(prjBoardReply.getPostNo());

		if (userInfo == null) {
		}
		prjBoardReply.setUserNo(userInfo);
		try {
			boardService.registPrjBoardReply(prjBoardReply);
		} catch (NullPointerException e) {
			rttr.addFlashAttribute("err", "전달하고 싶은 내용을 적어주세요.");
		}
		return "redirect:/prjDetail/" + prjBoard.getPrjNo() + "?postNo=" + prjBoardReply.getPostNo() + "#prjBoard";
	}

	// 게시판 리플 삭제
	@RequestMapping("/prjDetail/deleteReply")
	public String deleteReply(PrjBoard prjBoard, PrjBoardReply prjBoardReply) {
		prjBoard = boardService.showPrjBoardbyPostNo(prjBoard.getPostNo());
		prjBoardReply = boardService.showPrjBoardReplyReplyNo(prjBoardReply.getReplyNo());
		try {
			boardService.removePrjBoardReply(prjBoardReply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/prjDetail/" + prjBoard.getPrjNo() + "?postNo=" + prjBoardReply.getPostNo() + "#prjBoard";
	}

}
