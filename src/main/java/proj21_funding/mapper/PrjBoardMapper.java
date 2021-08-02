package proj21_funding.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_funding.dto.PrjBoard;
import proj21_funding.dto.PrjBoardReply;

@Component
public interface PrjBoardMapper {
	List<PrjBoard> selectPrjBoardbyPrjNo(int prjNo);

	PrjBoard selectPrjBoardbyPostNo(int postNo);

	int insertPrjBoard(PrjBoard prjBoard);

	int updatePrjBoard(PrjBoard prjBoard);
	
	int updatePrjBoardNoFile(PrjBoard prjBoard);

	int deletePrjBoard(PrjBoard prjBoard);

	List<PrjBoardReply> selectPrjBoardReplyPostNo(int postNo);
	
	PrjBoardReply selectPrjBoardbyReplyNo(int replyNo);
	
	int insertPrjBoardReply(PrjBoardReply prjBoardReply);
	
	int updatePrjBoardReply(PrjBoardReply prjBoardReply);

	int deletePrjBoardReply(PrjBoardReply prjBoardReply);
}
