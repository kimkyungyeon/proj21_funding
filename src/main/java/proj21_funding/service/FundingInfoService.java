package proj21_funding.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import proj21_funding.dto.FundingInfo;

@Service
public interface FundingInfoService {
	int showCountByPrjNo(int prjNo);
	int showSumByPrjNo(int prjNo);
	
	int showCountByUserNo(int userNo);
	int showSumByUserNo(int userNo);
	
	int addFundingInfo(FundingInfo fundingInfo);
	List<FundingInfo> showFundingInfoByUserNo(int userNo);
	List<FundingInfo> showFundingInfoByUserNoMap(Map<String,Object> listMap);
	
	int modifyPayYes();

}
