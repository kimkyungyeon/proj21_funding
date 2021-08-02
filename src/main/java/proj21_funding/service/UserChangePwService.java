package proj21_funding.service;

import org.springframework.stereotype.Service;

@Service
public interface UserChangePwService {
	void changePassword(String userId, String oldPwd, String newPwd);
}
