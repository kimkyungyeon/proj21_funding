package proj21_funding.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import proj21_funding.dto.Message;

@Component
public interface MessageMapper {

	// 보낸 메세지
	int countBySendUser(String sendUser);

	List<Message> selectBySendUser(@Param("sendUser") String sendUser, @Param("pageSearch") int pageSearch, @Param("cntPerPage") int cntPerPage);

	// 받은 메세지
	int countByReceiveUser(String receiveUser);

	List<Message> selectByreceiveUser(@Param("receiveUser") String receiveUser, @Param("pageSearch") int pageSearch, @Param("cntPerPage") int cntPerPage);

	// 받은 메세지 - 읽지않음
	int countByRead(String receiveUser);

	List<Message> selectByRead(@Param("receiveUser") String receiveUser, @Param("pageSearch") int pageSearch, @Param("cntPerPage") int cntPerPage);

	Message selectByMsgNo(int msgNo);

	int insertMessage(Message message);

	int updateMessage(Message message);

	int delReceiveMessage(Message message);

	int delSendMessage(Message message);

}
