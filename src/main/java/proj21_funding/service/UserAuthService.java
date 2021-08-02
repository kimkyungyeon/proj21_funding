package proj21_funding.service;

import org.springframework.stereotype.Service;
import proj21_funding.dto.account.UserAuthInfo;
import proj21_funding.dto.account.UserLogin;
@Service
public interface UserAuthService {
	UserAuthInfo authenicate(UserLogin userLogin);
}
