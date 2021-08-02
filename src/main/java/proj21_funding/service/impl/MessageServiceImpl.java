package proj21_funding.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.FundingInfo;
import proj21_funding.dto.Message;
import proj21_funding.dto.Project;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.paging.Pagination;
import proj21_funding.exception.SameUserException;
import proj21_funding.exception.UserNotFoundException;
import proj21_funding.mapper.FundingInfoMapper;
import proj21_funding.mapper.MessageMapper;
import proj21_funding.mapper.ProjectMapper;
import proj21_funding.mapper.UserInfoMapper;
import proj21_funding.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageMapper mapper;

	@Autowired
	private UserInfoMapper userMapper;

	@Autowired
	private ProjectMapper proMapper;

	@Autowired
	private FundingInfoMapper FundingMapper;

	@Override
	public int sendMessage(Message message) {
		
		String receive = message.getReceiveUser();
		String[] user = receive.split(", ");
		
		List<String> reUser =  new ArrayList<>();	
		for(String item : user) {
			if(!reUser.contains(item))
				reUser.add(item);
		}
		

		if(receive.equals("")) {
			throw new UserNotFoundException();
		}
		
		if(message.getMsgContent().equals("")) {
			throw new NullPointerException();
		}	
		
		for (String reList : reUser) {
			message.setReceiveUser(reList);

			UserInfo info = userMapper.selectUserbyId(message.getReceiveUser());
			if (info == null) {
				throw new UserNotFoundException();
			}
			if (message.getSendUser().equals(message.getReceiveUser())) {
				throw new SameUserException();
			}
			Message newMessage = new Message(message.getSendUser(), message.getReceiveUser(), message.getMsgContent());
			mapper.insertMessage(newMessage);
		}
		return 0;
	}

	@Override
	public int countBySendUser(String sendUser) {
		return mapper.countBySendUser(sendUser);
	}

	@Override
	public List<Message> showBySendUser(String sendUser, Pagination pagination) {
		return mapper.selectBySendUser(sendUser, pagination.getPageSearch(), pagination.getCntPerPage());
	}

	@Override
	public int countByReceiveUser(String receiveUser) {
		return mapper.countByReceiveUser(receiveUser);
	}

	@Override
	public List<Message> showByReceiveUser(String receiveUser, Pagination pagination) {
		return mapper.selectByreceiveUser(receiveUser, pagination.getPageSearch(), pagination.getCntPerPage());
	}

	@Override
	public int countByReceiveUserUnRead(String receiveUser) {
		return mapper.countByRead(receiveUser);
	}

	@Override
	public List<Message> showByReceiveUserUnRead(String receiveUser, Pagination pagination) {
		return mapper.selectByRead(receiveUser, pagination.getPageSearch(), pagination.getCntPerPage());
	}

	@Override
	public Message showByMsgNo(int msgNo) {
		return mapper.selectByMsgNo(msgNo);
	}

	@Override
	public int readMessage(Message message) {
		return mapper.updateMessage(message);
	}

	@Override
	public int removeReceiveMessage(Message message) {
		return mapper.delReceiveMessage(message);
	}

	@Override
	public int removeSendMessage(Message message) {
		return mapper.delSendMessage(message);
	}

	@Override
	public List<Project> showProjectsByUser(int userNo) {
		return proMapper.selectProjectByUser(userNo);
	}

	@Override
	public List<FundingInfo> showFundingInfosByPrjNo(int prjNo) {
		return FundingMapper.selectFundingInfoByPrjNo(prjNo);
	}

	@Override
	public UserInfo showUserbyNo(int userNo) {
		return userMapper.selectUserbyNo(userNo);
	}

}
