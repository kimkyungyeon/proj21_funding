package proj21_funding.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.FundingInfo;
import proj21_funding.mapper.FundingInfoMapper;
import proj21_funding.service.FundingInfoService;

@Service
public class FundingInfoServiceImpl implements FundingInfoService {
	@Autowired
	FundingInfoMapper mapper;

	@Override
	public int showCountByPrjNo(int prjNo) {
		return mapper.selectCountByPrjNo(prjNo);
	}

	@Override
	public int showSumByPrjNo(int prjNo) {
		return mapper.selectSumByPrjNo(prjNo);
	}
	
	@Override
	public List<FundingInfo> showFundingInfoByUserNo(int userNo) {
		return mapper.selectFundingInfoByUserNo(userNo);
	}

	@Override
	public int addFundingInfo(FundingInfo fundingInfo) {
		return mapper.insertFundingInfo(fundingInfo);
	}

	@Override
	public int showCountByUserNo(int userNo) {
		return mapper.selectCountByUserNo(userNo);
	}

	@Override
	public int showSumByUserNo(int userNo) {
		return mapper.selectSumByUserNo(userNo);
	}

	@Override
	public List<FundingInfo> showFundingInfoByUserNoMap(Map<String, Object> listMap) {
		return mapper.selectFundingInfoByUserNoMap(listMap);
	}

	@Override
	public int modifyPayYes() {
		return mapper.updatePayYes();
	}


}
