package proj21_funding.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import proj21_funding.dto.FundingInfo;
import proj21_funding.dto.Message;
import proj21_funding.dto.Project;
import proj21_funding.dto.account.UserAuthInfo;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.paging.Pagination;
import proj21_funding.exception.SameUserException;
import proj21_funding.exception.UserNotFoundException;
import proj21_funding.service.MessageService;

@Controller
public class MessageController {

	@Autowired
	private MessageService service;

	@RequestMapping("/message/message-receive")
	public String receive(Message message, HttpSession session, Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
            @RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
            @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize) {
		UserAuthInfo userAuthInfo = (UserAuthInfo) session.getAttribute("authInfo");
		int listCnt = service.countByReceiveUser(userAuthInfo.getUserId());
	    Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
	    pagination.setTotalRecordCount(listCnt);
		
	    model.addAttribute("pagination",pagination);
		List<Message> messages = service.showByReceiveUser(userAuthInfo.getUserId(),pagination);
		model.addAttribute("messages", messages);
	
		return "message/message-receive";
	}

	@RequestMapping("/message/dels")
	public String receive(String[] check, HttpSession session, @RequestParam(value = "currentPage") int currentPage,
			@RequestParam(value = "readYN") boolean readYN) {
		UserAuthInfo userAuthInfo = (UserAuthInfo) session.getAttribute("authInfo");
		if (check == null) {
			return "redirect:/message/message-receive";
		}
		Message message = null;		
		for (int i = 0; i < check.length; i++) {
			message = service.showByMsgNo(Integer.parseInt(check[i]));
			if(message.getReceiveUser().equals(userAuthInfo.getUserId())) {
				service.removeReceiveMessage(message);				
			}else {
				service.removeSendMessage(message);
			}			
		}			
		
		if(message.getReceiveUser().equals(userAuthInfo.getUserId())) {	
			if(readYN != false) {
				return "redirect:/message/message-receive?currentPage="+currentPage;
			}else {
				return "redirect:/message/message-unRead?currentPage="+currentPage;
			}
		}else {
			return "redirect:/message/message-send?currentPage="+currentPage;
		}
		
	}

	@GetMapping("/message/message-receive/{msgNo}")
	public String receiveDetail(@PathVariable("msgNo") int msgNo, Message message, Model model,
			@RequestParam(value = "currentPage") int currentPage,
			@RequestParam(value = "readYN") boolean readYN) {
		model.addAttribute("currentPage", currentPage);
		message = service.showByMsgNo(msgNo);
		model.addAttribute("readYN", readYN);		

		service.readMessage(message);
		model.addAttribute("msgNo", message.getMsgNo());
		model.addAttribute("rcUser", message.getReceiveUser());
		model.addAttribute("seUser", message.getSendUser());
		model.addAttribute("content", message.getMsgContent());

		return "message/message-detail";
	}

	@PostMapping("/message/message-receive/{msgNo}")
	public String receiveReply(@PathVariable("msgNo") int msgNo, Message message, Errors errors, RedirectAttributes rttr, Model model) {
		if (errors.hasErrors()) {
		}
		
		try {			
			Message message1 = new Message(message.getReceiveUser(), message.getSendUser(), message.getMsgContent());
			service.sendMessage(message1);						
		} catch (NullPointerException e) {			
			rttr.addFlashAttribute("err","내용을 적어주세요.");			
		}
		return "redirect:/message/message-receive/"+ msgNo
				+"?currentPage=" +message.getCurrentPage()
				+"&readYN="+message.isReadYN();	
		
	}

	@GetMapping("/message/message-receive/delete/{msgNo}")
	public String delete(@PathVariable("msgNo") int msgNo, Message message, HttpSession session,
			@RequestParam(value = "currentPage") int currentPage,
			@RequestParam(value = "readYN") boolean readYN) {
		UserAuthInfo userAuthInfo = (UserAuthInfo) session.getAttribute("authInfo");
		message = service.showByMsgNo(msgNo);		
		
		if(message.getReceiveUser().equals(userAuthInfo.getUserId())) {
			service.removeReceiveMessage(message);	
			if(readYN == true) {
				return "redirect:/message/message-receive?currentPage="+currentPage;
			}else {
				return "redirect:/message/message-unRead?currentPage="+currentPage;
			}
		}else {
			service.removeSendMessage(message);
			return "redirect:/message/message-send?currentPage="+currentPage;
		}		
	
	}

	@RequestMapping("/message/message-unRead")
	public String unRead(Message message, HttpSession session, Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
            @RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
            @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize) {
		UserAuthInfo userAuthInfo = (UserAuthInfo) session.getAttribute("authInfo");
		int listCnt = service.countByReceiveUserUnRead(userAuthInfo.getUserId());
	    Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
	    pagination.setTotalRecordCount(listCnt);
		
	    model.addAttribute("pagination",pagination);
		List<Message> messages = service.showByReceiveUserUnRead(userAuthInfo.getUserId(),pagination);
		model.addAttribute("messages", messages);

		return "message/message-unRead";
	}

	@RequestMapping("/message/message-send")
	public String send(Message message, HttpSession session, Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
            @RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
            @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize) {
		UserAuthInfo userAuthInfo = (UserAuthInfo) session.getAttribute("authInfo");
		int listCnt = service.countBySendUser(userAuthInfo.getUserId());
	    Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
	    pagination.setTotalRecordCount(listCnt);
		
	    model.addAttribute("pagination",pagination);
		List<Message> messages = service.showBySendUser(userAuthInfo.getUserId(),pagination);
		model.addAttribute("messages", messages);
		return "message/message-send";
	}

	@GetMapping("/message/message-write")
	public String write(Message message) {
		return "message/message-write";
	}

	@PostMapping("/message/message-write")
	public String write(@Valid Message message, Errors errors) {
		if (errors.hasErrors()) {
			return "message/message-write";
		}

		try {
			service.sendMessage(message);
			return "redirect:/message/message-receive";
		}catch (UserNotFoundException e) {
			errors.rejectValue("receiveUser", "userNotFound");
			return "message/message-write";
		}catch (NullPointerException e) {
			errors.rejectValue("msgContent", "nullContent");
			return "message/message-write";
		}catch (SameUserException e) {
			errors.rejectValue("receiveUser", "SameUserImpossible");
			return "message/message-write";
		}

	}

	@RequestMapping("/message/message-search")
	public String searchProject(HttpSession session, Model model) {
		UserAuthInfo userAuthInfo = (UserAuthInfo) session.getAttribute("authInfo");	
		List<Project> projects = service.showProjectsByUser(userAuthInfo.getUserNo());
		model.addAttribute("projects", projects);
		return "message/message-search";
	}
	
	@RequestMapping("/message/message-search/{prjNo}")
	public String searchUser(@PathVariable("prjNo") int prjNo, HttpSession session, Model model) {
		UserAuthInfo userAuthInfo = (UserAuthInfo) session.getAttribute("authInfo");	
		List<Project> projects = service.showProjectsByUser(userAuthInfo.getUserNo());
		model.addAttribute("projects", projects);	
		
		List<FundingInfo> fundingInfos = service.showFundingInfosByPrjNo(prjNo);
		for(FundingInfo funding : fundingInfos) {			
			UserInfo userInfo= service.showUserbyNo(funding.getUserNo().getUserNo());
			funding.setUserNo(userInfo);
		}		
		model.addAttribute("fundingInfos", fundingInfos);
		return "message/message-search";
	}
	
	
}
