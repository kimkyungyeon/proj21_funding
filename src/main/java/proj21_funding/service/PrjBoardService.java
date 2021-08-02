package proj21_funding.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import proj21_funding.dto.PrjBoard;
import proj21_funding.dto.PrjBoardReply;

@Service
public interface PrjBoardService {
	List<PrjBoard> showPrjBoardbyPrjNo(int prjNo);
	
	PrjBoard showPrjBoardbyPostNo(int postNo);
	
	int registPrjBoard(PrjBoard prjBoard, MultipartFile postFile);

	int modifyPrjBoard(PrjBoard prjBoard, MultipartFile postFile);

	int removePrjBoard(PrjBoard prjBoard);	

	List<PrjBoardReply> showPrjBoardReplyPostNo(int postNo);
	
	PrjBoardReply showPrjBoardReplyReplyNo(int replyNo);
	
	int registPrjBoardReply(PrjBoardReply prjBoardReply);

	int modifyPrjBoardReply(PrjBoardReply prjBoardReply);

	int removePrjBoardReply(PrjBoardReply prjBoardReply);
}
