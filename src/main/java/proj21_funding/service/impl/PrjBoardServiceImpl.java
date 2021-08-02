package proj21_funding.service.impl;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import proj21_funding.dto.PrjBoard;
import proj21_funding.dto.PrjBoardReply;
import proj21_funding.mapper.PrjBoardMapper;
import proj21_funding.service.PrjBoardService;

@Service
public class PrjBoardServiceImpl implements PrjBoardService {

	@Autowired
	private PrjBoardMapper boardMapper;

	@Override
	public List<PrjBoard> showPrjBoardbyPrjNo(int prjNo) {
		return boardMapper.selectPrjBoardbyPrjNo(prjNo);
	}

	@Override
	public PrjBoard showPrjBoardbyPostNo(int postNo) {
		return boardMapper.selectPrjBoardbyPostNo(postNo);
	}

	@Override
	public int registPrjBoard(PrjBoard prjBoard, MultipartFile postFile) {
		if (prjBoard.getPostContent().equals("")) {
			throw new NullPointerException();
		}

		if (!postFile.getOriginalFilename().equals("")) {
			byte[] pic = null;

			try {
				pic = postFile.getBytes();
			} catch (IOException e2) {
				e2.printStackTrace();
			}

			if (pic != null) {
				prjBoard.setPostFile(pic);
				prjBoard.setFileName(postFile.getOriginalFilename());
			}
		}		
		return boardMapper.insertPrjBoard(prjBoard);
	}

	@Override
	public int modifyPrjBoard(PrjBoard prjBoard, MultipartFile postFile) {
		if(!postFile.getOriginalFilename().equals("")) {
			byte[] pic = null;

			try {
				pic = postFile.getBytes();
			} catch (IOException e2) {
				e2.printStackTrace();
			}

			if (pic != null) {
				prjBoard.setPostFile(pic);
				prjBoard.setFileName(postFile.getOriginalFilename());
			}
			
			return boardMapper.updatePrjBoard(prjBoard);
		}else{
			return boardMapper.updatePrjBoardNoFile(prjBoard);
		}		
	}

	@Override
	public int removePrjBoard(PrjBoard prjBoard) {
		return boardMapper.deletePrjBoard(prjBoard);
	}

	@Override
	public List<PrjBoardReply> showPrjBoardReplyPostNo(int postNo) {
		return boardMapper.selectPrjBoardReplyPostNo(postNo);
	}

	@Override
	public int registPrjBoardReply(PrjBoardReply prjBoardReply) {
		if (prjBoardReply.getReplyContent().equals("")) {
			throw new NullPointerException();
		}
		return boardMapper.insertPrjBoardReply(prjBoardReply);
	}

	@Override
	public int modifyPrjBoardReply(PrjBoardReply prjBoardReply) {
		return boardMapper.updatePrjBoardReply(prjBoardReply);
	}

	@Override
	public int removePrjBoardReply(PrjBoardReply prjBoardReply) {
		return boardMapper.deletePrjBoardReply(prjBoardReply);
	}

	@Override
	public PrjBoardReply showPrjBoardReplyReplyNo(int replyNo) {		
		return boardMapper.selectPrjBoardbyReplyNo(replyNo);
	}

}
