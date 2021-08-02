package proj21_funding.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import proj21_funding.dto.PrjOption;
import proj21_funding.dto.QNA;
import proj21_funding.service.BoardService;
import proj21_funding.service.PrjOptionService;
import proj21_funding.service.QNAService;

@RestController
public class RestAdminController {
	@Autowired
	private PrjOptionService optionService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private QNAService qnaService;
	
	@GetMapping("/getOptList/{prjNo}")
	public ResponseEntity<Object> member(@PathVariable int prjNo, HttpServletResponse response) {
		System.out.println(1);
		System.out.println(prjNo);
//        List<PrjOption> option = optionService.showSimpleOptionByPrjNo(prjNo);
//        System.out.println(option);
        return ResponseEntity.ok(optionService.showSimpleOptionByPrjNo(prjNo));
    }
	
	@PatchMapping("replyQna/{idx}")
	public ResponseEntity<Object> updateReply(@PathVariable int idx,@RequestBody QNA qna){
		System.out.println(1);
		return ResponseEntity.ok(qnaService.updateQNA(qna));
	}
	

}
